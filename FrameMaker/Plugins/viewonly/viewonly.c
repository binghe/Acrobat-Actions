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
 *	    viewonly
 *
 * General Description:
 *		Sets all open documents to view only display options, and adds
 *		some text at each document's last insertion point.
 *
 * Invocation:
 *		With one or more documents open, choose "Set View Only" from
 *		the FDKClassMenu.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name viewonly>
 *			<Description Sets open docs to viewonly>
 *			<Directory fdk_install_dir/samples/viewonly>
 *			<CommandLine $FAPIDIR/fa.viewonly>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.viewonly>
 *		to:
 *			<SharedLibrary fa.viewonly.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		viewonly=Standard, Sets open docs to viewonly,
 *			fdk_install_dir\samples\viewonly\debug\viewonly.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#define VIEW_ONLY 1

#include "fapi.h"
#include "fdetypes.h"
#include "fmemory.h"
#include "futils.h"
#include "fcodes.h"
#include "fmetrics.h"
#include "fprogs.h"

#include "cutils.h"

VoidT setViewOnlySettings();

VoidT F_ApiInitialize(init)
IntT init;{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	addCommandToMenu(CLASS_MENU_NAME, VIEW_ONLY, (StringT) "viewOnlyCmd", (StringT) "Set View Only", (StringT)"\\!VO");
	/* addCommandToMenu(CLASS_MENU_NAME, CLASS_MENU_NAME, VIEW_ONLY, (StringT) "viewOnlyCmd", (StringT) "Set View Only", (StringT)"\\!VO"); */
}

VoidT F_ApiCommand(command)
IntT command;{
	F_ObjHandleT docId; /*  document ID */
	
	switch(command){
	case VIEW_ONLY:
		F_ApiSetInt(FV_SessionId, FV_SessionId, FP_Displaying, False);
		docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_FirstOpenDoc);
		while(docId){
			addTextAtIP(docId, (StringT) "Some stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "More stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Yet more stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Even more stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Even more stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Even more stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Even more stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Even more stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Even more stuff to make fireworks!\n");
			addTextAtIP(docId, (StringT) "Even more stuff to make fireworks!\n");
			setViewOnlySettings(docId);
			docId = F_ApiGetId(FV_SessionId, docId, FP_NextOpenDocInSession);
		}
		F_ApiSetInt(FV_SessionId, FV_SessionId, FP_Displaying, True);
		docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_FirstOpenDoc);
		while(docId){
			F_ApiReformat(docId);
			F_ApiRedisplay(docId);
			docId = F_ApiGetId(FV_SessionId, docId, FP_NextOpenDocInSession);
		}
		F_ApiBailOut();
		break;
	}
}

VoidT setViewOnlySettings(docId)
F_ObjHandleT docId;{
	MetricT zoom;
	static IntT fcodes[] = {KBD_ZOOM_FIT_WINDOW};
	
	F_ApiSetId(FV_SessionId, FV_SessionId, FP_ActiveDoc, docId);
	zoom = F_MetricMake(1, 1);
	F_ApiSetMetric(FV_SessionId, docId, FP_Zoom, zoom);
	F_ApiSetInt(FV_SessionId, docId, FP_ViewBorders, False);
	F_ApiSetInt(FV_SessionId, docId, FP_ViewRulers, False);
	F_ApiSetInt(FV_SessionId, docId, FP_ViewTextSymbols, False);
	F_ApiSetInt(FV_SessionId, docId, FP_ViewGrid, False);
	F_ApiSetInt(FV_SessionId, docId, FP_DocIsViewOnly, True);
	F_ApiFcodes(sizeof(fcodes)/sizeof(IntT), fcodes);
}
