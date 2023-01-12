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
 *	    myapi
 *
 * General Description:
 *		This application is the same as the example application presented
 *		in Chapter 1 of the FDK Programmer's Guide.
 *
 *		It adds a menu to the document menu bar. The menu includes items
 *		that close the current (active) document, set the fill pattern of
 *		of a selected object to black, and add a page at the beginning of
 *		the current document.
 *
 * Invocation:
 *		To start this application, follow the instructions in Install Info
 *		below. Then, start the Frame product.  An additional menu, named API,
 *		will appear to the right of the other menus on the document menu bar.
 *		This menu will only appear if you are using full menus.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name myapi>
 *			<Description Sample apiclient>
 *			<Directory fdk_install_dir/samples/myapi>
 *			<CommandLine $FAPIDIR/fa.myapi>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.myapi>
 *		to:
 *			<SharedLibrary fa.myapi.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		myapi=Standard, Sample apiclient,
 *			fdk_install_dir\samples\myapi\debug\myapi.dll, all 
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
#include "fencode.h"
#include "fdetypes.h"

#define CloseDoc 		 1
#define SetFill 		 2
#define AddPage 		 3

VoidT F_ApiInitialize(initialization)
IntT initialization;        /* Code for initialization type */
{
	F_ObjHandleT menuBarId, menuId;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	/* Get ID of the Frame product menu bar. */
	menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu,
									"!MakerMainMenu");
	/* Add menu named "API" to the Frame product menu bar. */
	menuId = F_ApiDefineAndAddMenu(menuBarId, "APIMenu", "API");
	
	/* Add items to API menu. */
	F_ApiDefineAndAddCommand(CloseDoc, menuId,"CloseDocCmd","Close","\\!CD");
	F_ApiDefineAndAddCommand(SetFill, menuId,"SetFillCmd", "Set Fill","\\!SF");
	F_ApiDefineAndAddCommand(AddPage, menuId,"AddPageCmd","Add Page","\\!AP");
}

VoidT F_ApiCommand(command)
IntT command;
{
	F_ObjHandleT pgId, objId, docId;
	
	/* Get the ID of the active document. */
	docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
	if(!docId) return; /* Return if there is no active document. */
	
	switch (command)
	{
	case CloseDoc:    /* Close document even if it’s changed. */
		F_ApiClose(docId, FF_CLOSE_MODIFIED); 
		break;
	
	case SetFill:    /* Set fill pattern to black. */
		/* Get ID of selected object. */
		objId = F_ApiGetId(FV_SessionId, docId,
								FP_FirstSelectedGraphicInDoc);

		/* If an object is selected, set its fill. */
		if (!objId) F_ApiAlert("Select an object first.",
								FF_ALERT_CONTINUE_WARN);
		else F_ApiSetInt(docId, objId, FP_Fill, FV_FILL_BLACK);
		break;
	
	case AddPage:    /* Add a new page. */
		pgId = F_ApiNewSeriesObject(docId, FO_BodyPage, 0);
		break;
	}
}

