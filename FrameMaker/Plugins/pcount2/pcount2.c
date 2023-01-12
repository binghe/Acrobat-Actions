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
 *	    pcount2
 *
 * General Description:
 *		Counts the pages in a FrameMaker document.
 *
 * Invocation:
 *		From the Special menu, choose "How many pages?".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name pcount2>
 *			<Description Counts pages in a document>
 *			<Directory fdk_install_dir/samples/pcount2>
 *			<CommandLine $FAPIDIR/fa.pcount2>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.pcount2>
 *		to:
 *			<SharedLibrary fa.pcount2.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		pcount2=Standard, Counts pages in a document,
 *			fdk_install_dir\samples\pcount2\debug\pcount2.dll, all 
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
#include "futils.h"
#include "fmemory.h"

#define COUNT_CMD 1
#define MAXSTRING 255 

/* Initialization callback to run at product start up time */
VoidT F_ApiInitialize(init)
IntT init;{
	F_ObjHandleT specialMenuId;
	F_ObjHandleT separatorId;
	F_ObjHandleT countCmdId = 0;
	F_ObjHandleT mainMenuId = 0;
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		/* Get specialMenuId */
		specialMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, (StringT) "SpecialMenu");
		if(specialMenuId){
			/* Define and add a new command to the Special menu */
			countCmdId = F_ApiDefineAndAddCommand(COUNT_CMD, specialMenuId, (StringT) "countPagesCmd", (StringT) "How many pages?", (StringT) "\\!PCC");
			/* Use FP_PrevMenuItemInMenu property to move command to top of menu */
			F_ApiSetId(specialMenuId, countCmdId, FP_PrevMenuItemInMenu, 0);
			/* Get the ID of Separator1 */
			separatorId = F_ApiGetNamedObject(FV_SessionId, FO_MenuItemSeparator, (StringT) "Separator1");
			F_ApiAddCommandToMenu(specialMenuId, separatorId);
			/* Place the separator after the Count Pages command */
			F_ApiSetId(specialMenuId, separatorId, FP_PrevMenuItemInMenu, countCmdId);
		}
		else
			F_ApiAlert((StringT) "Problem in finding special menu", FF_ALERT_CONTINUE_WARN);
		F_ApiBailOut();
		break;
	}
}

/* Callback to respond to when user chooses this client's menu items */
VoidT F_ApiCommand(command)
IntT command;{
	StringT msg;
	F_ObjHandleT docId = 0;
	F_ObjHandleT lastPageId;
	IntT pageNum;
	
	F_ApiBailOut();

	switch(command){
	case COUNT_CMD:
		docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
		if(!docId){
			F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		lastPageId = F_ApiGetId(FV_SessionId, docId, FP_LastBodyPageInDoc);
		pageNum = F_ApiGetInt(docId, lastPageId, FP_PageNum);
		msg = F_StrNew(MAXSTRING + 1);
		F_Sprintf(msg, (StringT) "Page count is %d\n", pageNum + 1);
		F_ApiAlert(msg, FF_ALERT_CONTINUE_NOTE);
		if(msg != NULL)
			F_Free(msg);
		break;
	}
}
