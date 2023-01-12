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
 *	    import
 *
 * General Description:
 *		Sample demonstrating how to import graphic files.
 *
 * Invocation:
 *		Open a new document. Choose ImportApi->Import On Page... to
 *		import a graphic on the page. To import the the graphic in a
 *		anchored frame choose ImportApi->Import In Text..
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name import>
 *			<Description Imports graphic files onto page or into text>
 *			<Directory fdk_install_dir/samples/import>
 *			<CommandLine $FAPIDIR/fa.import>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.import>
 *		to:
 *			<SharedLibrary fa.import.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		import=Standard, Imports graphic files onto page or into text,
 *			fdk_install_dir\samples\import\debug\import.dll, all 
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
#include "fstrings.h"
#include "fencode.h"

#define IMPORT 1
#define IMPORTPAGE 2

VoidT F_ApiInitialize(IntT init)
{
	F_ObjHandleT menuBarId, menuId, importInTextCmd, importOnPageCmd;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
	F_FdeInitFontEncs("UTF-8");

	switch(init)
	{
	case FA_Init_First:
		menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
		if(menuBarId)
		{
      		menuId = F_ApiDefineAndAddMenu(menuBarId, "APIMenu", "ImportApi");
	      	importOnPageCmd = F_ApiDefineAndAddCommand(IMPORTPAGE, menuId, "PageCmd", "Import On Page...", (StringT)"\\!OP");
      		importInTextCmd = F_ApiDefineCommand(IMPORT, "TextCmd", "Import in Text...", (StringT)"\\!IT");
			F_ApiSetInt(FV_SessionId, importInTextCmd, FP_EnabledWhen, FV_ENABLE_IN_PARA_TEXT);
			F_ApiAddCommandToMenu(menuId, importInTextCmd);
      		F_ApiBailOut();
      	}
		break;

	default:
		break;
	}
}

VoidT F_ApiCommand(IntT command)
{
	F_PropValsT			params, *returnParamsp = NULL;
	F_TextRangeT		tr;
	F_ObjHandleT		docId, objId;
	IntT					i = 0, err = 0;
	StringT 				choice = NULL;

	F_FdeInit();

	docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
	if(!docId)
	{
		F_ApiAlert("No Active Document.", FF_ALERT_CONTINUE_WARN);
		return;
	}

	err = F_ApiChooseFile(&choice, "Choose a file to import", "", "", FV_ChooseSelect, "");
	if(err < 0)
		return;

	/* Create import script */
	params = F_ApiGetImportDefaultParams();

	i = F_ApiGetPropIndex(&params, FS_HowToImport);
	params.val[i].propVal.u.ival = FV_DoByRef;

	i = F_ApiGetPropIndex(&params, FS_DisallowDoc);
	params.val[i].propVal.u.ival = True;

	i = F_ApiGetPropIndex(&params, FS_DisallowMIF);
	params.val[i].propVal.u.ival = True;

	i = F_ApiGetPropIndex(&params, FS_DisallowMacEditions);
	params.val[i].propVal.u.ival = True;

	i = F_ApiGetPropIndex(&params, FS_DisallowPlainText);
	params.val[i].propVal.u.ival = True;

	i = F_ApiGetPropIndex(&params, FS_DisallowSgml);
	params.val[i].propVal.u.ival = True;

	i = F_ApiGetPropIndex(&params, FS_DontNotifyAPIClients);
	params.val[i].propVal.u.ival = True;

	i = F_ApiGetPropIndex(&params, FS_FileIsSgmlDoc);
	params.val[i].propVal.u.ival = FV_DoCancel;

	/* Switch on which command was choosen from the menu. */
	switch(command)
	{
	case IMPORT:
		objId = F_ApiImport(docId, &tr.beg, choice, &params, &returnParamsp);
		break;

	case IMPORTPAGE:
		tr.beg.objId = 0;
		tr.beg.offset = 0;
		tr.end.objId = 0;
		tr.end.offset = 0;

		/* Make sure there's no insertion point or selection. */
		F_ApiSetTextRange(FV_SessionId, docId, FP_TextSelection, &tr);
		/* Import the object onto the page. */
		F_ApiImport(docId, &tr.beg, choice, &params, &returnParamsp);
		break;

	default :
		break;
	}
	/* If import failed, find out why. */
	if(F_ApiCheckStatus(returnParamsp, FV_BadImportFileType))
		F_ApiAlert("File isn't a graphic.", FF_ALERT_CONTINUE_NOTE);
	if(F_ApiCheckStatus(returnParamsp, FV_DisallowedImportType))
		F_ApiAlert("File isn't an importable graphic file.", FF_ALERT_CONTINUE_NOTE);

	/* Clean up. */
	if(choice != NULL)
		F_Free(choice);

	F_ApiDeallocatePropVals(&params);
	F_ApiDeallocatePropVals(returnParamsp);
}


