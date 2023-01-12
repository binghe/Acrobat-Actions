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
 *  Program Name:
 *		pcount
 *
 *  General Description:
 *		Counts pages of a Framemaker book. A file must be open in order
 *		to count its pages. So if the client is unable to open any file in a
 *		book, the count is aborted. An alert is posted giving the user the name
 *		of the file which caused the cancellation. The client should open most
 *		files without user intervention. However, it can't open an unavailable
 *		file and will cancel in that case.
 *
 *  Invocation:
 *		Open a FrameMaker book. From the FDK_Class menu (only available in a FrameMaker 
 *		Book Main Menu), choose "Count pages in book".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name pcount>
 *			<Description Counts pages in all components of a book.>
 *			<Directory fdk_install_dir/samples/pcount>
 *			<CommandLine $FAPIDIR/fa.pcount>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.pcount>
 *		to:
 *			<SharedLibrary fa.pcount.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		pcount=Standard,Counts pages in all components of a book,
 *			fdk_install_dir\samples\pcount\debug\pcount.dll, all 
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
#include "fstrings.h"
#include "fprogs.h"

#include "cutils.h"

#define COUNT_PAGES_CMD 1
#define MAXSTRING 255
#define INVISIBLE_OPEN 1


VoidT F_ApiInitialize(init)
IntT init;{
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
			if(!classBookMenuId){
				classBookMenuId = F_ApiDefineAndAddMenu(bookMenuId, CLASS_BOOK_MENU_NAME, CLASS_MENU_LABEL);
			}
			F_ApiDefineAndAddCommand(COUNT_PAGES_CMD, classBookMenuId, (StringT) "CountPagesMenu", (StringT) "Count pages in book", (StringT) "\\!OA");
		}
		else
			F_ApiAlert((StringT) "Client menu could not be added as there is no book menu", FF_ALERT_CONTINUE_WARN);
		F_ApiBailOut();
		break;
	}
}

VoidT F_ApiCommand(command)
IntT command;
{
	IntT i; /* index into property list */
	F_PropValsT script, *returnp = NULL;
	F_ObjHandleT bookId; /* active book ID */
	F_ObjHandleT compId; /* book component ID */
	F_ObjHandleT docId; /*  document ID */
	BoolT userCancel = False;
	StringT componentName = NULL; /* name of book component */
	StringT msg;
	IntT count, pageNum;
	F_ObjHandleT lastPageId;
	
	F_ApiBailOut();
	switch(command)
	{
	case COUNT_PAGES_CMD:
		/* create open script */
		script = F_ApiGetOpenDefaultParams();
		i = F_ApiGetPropIndex(&script, FS_MakeVisible);
		script.val[i].propVal.u.ival = False;
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

		bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);
		count = 0;
		/* get all components in the active book and open using script */
		compId = F_ApiGetId(FV_SessionId, bookId, FP_FirstComponentInBook);
		userCancel = F_ApiUserCancel();
		while (compId && !userCancel)
		{
			componentName = F_ApiGetString(bookId, compId, FP_Name);
			docId = F_ApiOpen(componentName, &script, &returnp);						
			if(!docId)
			{
				msg = F_StrNew(MAXSTRING + 1);
				F_StrCatNEnc(msg, (StringT) "Count pages in book canceled. \nUnable to open ", MAXSTRING,
					fdeUTF8EncodingId);
				F_StrCatNEnc(msg, (StringT) componentName, MAXSTRING, fdeUTF8EncodingId);		
				F_ApiAlert(msg, FF_ALERT_CONTINUE_WARN);
				/*Deallocate memory*/
				F_Free(msg);
				F_ApiDeallocatePropVals(&script);
				F_ApiDeallocatePropVals(returnp);
				F_Free(componentName);
				/*Return focus to book*/
				F_ApiSetId(FV_SessionId, FV_SessionId, FP_ActiveBook, bookId);
				return;
			}
			else
			{
				lastPageId = F_ApiGetId(FV_SessionId, docId, FP_LastBodyPageInDoc);
				pageNum = F_ApiGetInt(docId, lastPageId, FP_PageNum);

				/*Don't close book files that were already open.*/
				if (!(F_ApiCheckStatus(returnp, FV_FileAlreadyOpen)))					
					F_ApiClose(docId, FF_CLOSE_MODIFIED);
				count = count + pageNum + 1;
				F_ApiDeallocatePropVals(returnp);
			}
			F_Free(componentName);
			compId = F_ApiGetId(bookId, compId, FP_NextComponentInBook);
			userCancel = F_ApiUserCancel();
		}
		F_ApiDeallocatePropVals(&script);
		
		if(!userCancel)
		{
			msg = F_StrNew(MAXSTRING + 1);			
			F_StrCatIntN(msg, count, MAXSTRING);
			F_StrCatNEnc(msg, (StringT) " pages in this book.\n", MAXSTRING, fdeUTF8EncodingId);
			F_ApiAlert(msg, FF_ALERT_CONTINUE_WARN);
			F_Free(msg);
		}
		/*Return focus to book.*/
		F_ApiSetId(FV_SessionId, FV_SessionId, FP_ActiveBook, bookId);
		break;
	}
}
