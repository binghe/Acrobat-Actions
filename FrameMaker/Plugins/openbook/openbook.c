/********************************************************************/
/*                                                                  */
/* ADOBE SYSTEMS INCORPORATED                                       */
/* Copyright 1986 - 2005 Adobe Systems Incorporated                 */
/* All Rights Reserved                                              */
/*                                                                  */
/* NOTICE:  Adobe permits you to use, modify, and distribute this   */
/* file in accordance with the terms of the Adobe license agreement */
/* accompanying it.  If you have received this file from a source   */
/* other than Adobe, then your use, modification, or distribution   */
/* of it requires the prior written permission of Adobe.            */
/*                                                                  */
/********************************************************************/

/*
 * Program Name:
 *	    openbook
 *
 * General Description:
 *		Does a scripted open of all files in a FrameMaker book.
 *
 * Invocation:
 *		From the FDK_Class menu (in a FrameMaker book main menu), choose
 *		"Open all files in book".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name openbook>
 *			<Description Opens all files in book>
 *			<Directory fdk_install_dir/samples/openbook>
 *			<CommandLine $FAPIDIR/fa.openbook>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.openbook>
 *		to:
 *			<SharedLibrary fa.openbook.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		openbook=Standard, Opens all files in book,
 *			fdk_install_dir\samples\openbook\debug\openbook.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fmemory.h"
#include "futils.h"
#include "fcodes.h"
#include "fmetrics.h"

#include "cutils.h"

#define OPEN_BOOK 1

VoidT setViewOnlySettings();

VoidT F_ApiInitialize(IntT init)
{
	F_ObjHandleT classBookMenuId;
	F_ObjHandleT bookMenuId;
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		bookMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, (StringT) "!BookMainMenu");
		if(bookMenuId){
			classBookMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, CLASS_BOOK_MENU_NAME);
			if(!classBookMenuId)
				classBookMenuId = F_ApiDefineAndAddMenu(bookMenuId, CLASS_BOOK_MENU_NAME, CLASS_MENU_LABEL);
			bookMenuId =F_ApiDefineAndAddCommand(OPEN_BOOK, classBookMenuId, (StringT) "OPEN_BOOKMenu", (StringT) "Open all files in book", (StringT) "\\!OA");
		}
		F_ApiBailOut();
		break;
	}
}

VoidT F_ApiCommand(IntT command)
{
	IntT i; /* index into property list */
	F_PropValsT script, *returnp = NULL;
	F_ObjHandleT bookId; /* active book ID */
	F_ObjHandleT compId; /* book component ID */
	F_ObjHandleT docId; /*  document ID */
	BoolT userCancel = False;
	StringT compName = NULL; /* name of book component */
	
	switch(command){
	case OPEN_BOOK:
		/* create open script */
		script = F_ApiGetOpenDefaultParams();
		i = F_ApiGetPropIndex(&script, FS_MakeVisible);
		script.val[i].propVal.u.ival = True;
		i = F_ApiGetPropIndex(&script, FS_RefFileNotFound);
		script.val[i].propVal.u.ival = FV_AllowAllRefFilesUnFindable;
		i = F_ApiGetPropIndex(&script, FS_FileIsOldVersion);
		script.val[i].propVal.u.ival = FV_DoOK;
		i = F_ApiGetPropIndex(&script, FS_FontChangedMetric);
		script.val[i].propVal.u.ival = FV_DoOK;
		i = F_ApiGetPropIndex(&script, FS_FontNotFoundInCatalog);
		script.val[i].propVal.u.ival = FV_DoOK;
		i = F_ApiGetPropIndex(&script, FS_FontNotFoundInDoc);
		script.val[i].propVal.u.ival = FV_DoOK;
		i = F_ApiGetPropIndex(&script, FS_LanguageNotAvailable);
		script.val[i].propVal.u.ival = FV_DoOK;
		i = F_ApiGetPropIndex(&script, FS_LockCantBeReset);
		script.val[i].propVal.u.ival = FV_DoOK;
		i = F_ApiGetPropIndex(&script, FS_UpdateTextReferences);
		script.val[i].propVal.u.ival = FV_DoNo;
		i = F_ApiGetPropIndex(&script, FS_UpdateXRefs);
		script.val[i].propVal.u.ival = FV_DoNo;
		i = F_ApiGetPropIndex(&script, FS_UseAutoSaveFile);
		script.val[i].propVal.u.ival = FV_DoNo;
		i = F_ApiGetPropIndex(&script, FS_UseRecoverFile);
		script.val[i].propVal.u.ival = FV_DoNo;
		i = F_ApiGetPropIndex(&script, FS_AlertUserAboutFailure);
		script.val[i].propVal.u.ival = False;
		i = F_ApiGetPropIndex(&script, FS_BeefyDoc);
		script.val[i].propVal.u.ival = FV_DoOK;
		i = F_ApiGetPropIndex(&script, FS_FileIsInUse);
		script.val[i].propVal.u.ival = FV_OpenViewOnly;
		i = F_ApiGetPropIndex(&script, FS_FileIsStructured);
		script.val[i].propVal.u.ival = FV_OpenViewOnly;
		i = F_ApiGetPropIndex(&script, FS_OpenFileNotWritable);
		script.val[i].propVal.u.ival = FV_DoOK;

		/* get ID of active book */
		bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);
		/* get all components in the active book and open using script */
		compId = F_ApiGetId(FV_SessionId, bookId, FP_FirstComponentInBook);
		while(compId && !userCancel){
			/* get component name */
			compName = F_ApiGetString(bookId, compId, FP_Name);
			/* open the document with the component name */
			docId = F_ApiOpen(compName, &script, &returnp);
			userCancel = F_ApiUserCancel(); /* allow user cancel */
			/* check outcome of open for FV_ReferencedFilesWerentFound */
			if(F_ApiCheckStatus(returnp, FV_ReferencedFilesWerentFound)){
				F_Printf(NULL, (StringT) "%s contains graphic files that could not be found.\n", compName);
			}
			/* check status of FV_UnresolvedTextInsets */
			if(F_ApiCheckStatus(returnp, FV_UnresolvedTextInsets)){
				F_Printf(NULL, (StringT) "%s contains imported text files that could not be found.\n", compName);
			}
			/* deallocate propVals */
			F_ApiDeallocatePropVals(returnp);
			if(compName != NULL)
				F_Free(compName);
			/* get next component in book */
			compId = F_ApiGetId(bookId, compId, FP_NextComponentInBook);
		}
		F_ApiDeallocatePropVals(&script);
		/* bail out when finished */
		F_ApiBailOut();
		break;
	}
}
