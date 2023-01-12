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
 *	    saveas
 *
 * General Description:
 *		Saves a FrameMaker book to either PDF or HTML depending on the
 *		menu choice. It also shows an example of programmatically 
 *		setting an Acrobat Bookmark level.
 *
 * Invocation:
 *		From a FrameMaker book's main menu, choose API-> Save As PDF, or
 *		API-> Save As HTML.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name saveas>
 *			<Description Saves book as pdf or html>
 *			<Directory fdk_install_dir/samples/saveas>
 *			<CommandLine $FAPIDIR/fa.saveas>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.saveas>
 *		to:
 *			<SharedLibrary fa.saveas.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		saveas=Standard, Saves as PDF or HTML,
 *			fdk_install_dir\samples\saveas\debug\saveas.dll, all 
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

#define SVPDF 1
#define SVHTML 2

/* Function protocols */
VoidT SaveAsPdf(VoidT);
VoidT SaveAsHtml(VoidT);
VoidT openBookFiles(F_ObjHandleT bookId);


VoidT F_ApiInitialize(IntT init)
{
	F_ObjHandleT menuBarId, menuId;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init)
	{
	case FA_Init_First:
		menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!BookMainMenu");
		menuId = F_ApiDefineAndAddMenu(menuBarId, "APIMenu", "API");
		F_ApiDefineAndAddCommand(SVPDF, menuId, "SvPdfCmd", "Save As PDF", "");
		F_ApiDefineAndAddCommand(SVHTML, menuId, "SvHtmlCmd", "Save As HTML", "");
		F_ApiBailOut();
		break;
	}
}

VoidT F_ApiCommand(IntT command)
{
	switch(command)
	{
		case SVPDF:
			SaveAsPdf();
			break;
		
		case SVHTML:
			SaveAsHtml();
			break;
		
		default:
			break;
	}
}

VoidT SaveAsPdf()
{
	F_PropValsT params, *returnParams = NULL;
	F_ObjHandleT docId, pgfId, saveId, bookId;
	IntT i = 0;
	StringT name = NULL;


	F_FdeInit();
	bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);

	/* Open all files */ 
	openBookFiles(bookId);

	/* Get docId in order to set Acrobat Bookmark levels */
	docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_FirstOpenDoc);
	if(!docId)
    {
		F_ApiAlert("Couldn't open first component.", FF_ALERT_CONTINUE_NOTE);
		return;
    }

	/* Sets "Body" to the highest Acrobat Bookmark level. */
	   
	pgfId = F_ApiGetNamedObject(docId, FO_PgfFmt, "Body");
	F_ApiSetInt(docId, pgfId, FP_AcrobatLevel, 1);
	F_ApiSimpleSave(docId, name, False);

	/* Sets the save parameters so as to save as PDF and allow user to name file.*/
	params = F_ApiGetSaveDefaultParams();
	i = F_ApiGetPropIndex(&params, FS_FileType);
	params.val[i].propVal.u.ival = FV_SaveFmtPdf;
	i = F_ApiGetPropIndex(&params, FS_SaveAsModeName);
	params.val[i].propVal.u.ival = FV_SaveAsNameAskUser;
	i = F_ApiGetPropIndex(&params, FS_SaveMode);
	params.val[i].propVal.u.ival = FV_ModeSaveAs;


	/* Saves the book and all its components to one PDF file */
	saveId = F_ApiSave(bookId, "", &params, &returnParams);
	/* Close the open files.*/
	while (docId)
	{
		F_ApiClose(docId, FF_CLOSE_MODIFIED);
		docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_NextOpenDocInSession);
	}

	F_ApiDeallocatePropVals(&params);
	F_ApiDeallocatePropVals(returnParams);
}

VoidT SaveAsHtml()
{
	F_PropValsT params, *returnParams = NULL;
	F_ObjHandleT saveId, bookId;
	IntT i = 0;
	
	F_FdeInit();
	
	/* Gets the active book (bookId) */
	bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);
	
	/* Sets save parameters */
	params = F_ApiGetSaveDefaultParams();
	i = F_ApiGetPropIndex(&params, FS_FileType);
	params.val[i].propVal.u.ival = FV_SaveFmtFilter;
	i = F_ApiGetPropIndex(&params, FS_SaveFileTypeHint);
	params.val[i].propVal.u.sval = F_StrCopyString("0001ADBEHTML");
	i = F_ApiGetPropIndex(&params, FS_SaveAsModeName);
	params.val[i].propVal.u.ival = FV_SaveAsNameAskUser;
	i = F_ApiGetPropIndex(&params, FS_SaveMode);
	params.val[i].propVal.u.ival = FV_ModeSaveAs;

	/* Saves the book and all its components to a single HTML file.*/
	saveId = F_ApiSave(bookId, "", &params, &returnParams);
	F_ApiDeallocatePropVals(&params);
	F_ApiDeallocatePropVals(returnParams);
}

VoidT openBookFiles(F_ObjHandleT bookId)
{
	IntT i = 0; 
	F_PropValsT script, *returnp = NULL;
	F_ObjHandleT compId; 
	F_ObjHandleT docId; 
	StringT compName = NULL;


	/* create open script which minimizes user response*/
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


	/* get all components in the active book and open using script */
	compId = F_ApiGetId(FV_SessionId, bookId, FP_FirstComponentInBook);
	i = 0;
	while(compId){
		/* get component name */
		compName = F_ApiGetString(bookId, compId, FP_Name);
		/* open the document with the component name */
		docId = F_ApiOpen(compName, &script, &returnp);

		/* check outcome of open for FV_ReferencedFilesWerentFound */
		if(F_ApiCheckStatus(returnp, FV_ReferencedFilesWerentFound)){
			F_Printf(NULL, (StringT) "%s contains graphic files that could not be found.\n", compName);

		}
		/* check status of FV_UnresolvedTextInsets */
		if(F_ApiCheckStatus(returnp, FV_UnresolvedTextInsets)){
			F_Printf(NULL, (StringT) "%s contains imported text files that could not be found.\n", compName);

		}
		/* deallocate propVals */
		F_ApiPrintSaveStatus(returnp);
		F_ApiDeallocatePropVals(returnp);
		if(compName != NULL)
			F_Free(compName);
		/* get next component in book */
		compId = F_ApiGetId(bookId, compId, FP_NextComponentInBook);
		i++;
	}
	F_ApiDeallocatePropVals(&script);

}
