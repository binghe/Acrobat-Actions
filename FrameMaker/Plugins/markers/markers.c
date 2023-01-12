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
 *	    markers
 *
 * General Description:
 *	1. INSERT_CMD:
 *		Inserts a marker of type defined by user. User is prompted
 *		for the marker type	(using F_ApiPromptString()). If the user
 *		fails to enter a marker	type, the operation is essentially
 *		cancelled and control is immediately returned to FrameMaker.
 *		If the user chooses a marker type (can be any string of text),
 *		a new marker is inserted with the name (type) the user chose.
 *		The user is prompted for marker text in the same manner.
 *		The user can choose to enter text or not.
 *
 *	2. COUNT_CMD:
 *		Count all anchors within a selected text range.
 *
 *	3.	This sample also demonstrates how to control placement of menu items and how to 
 *		create and place a menu separator.
 *
 * Invocation:
 *	1.	INSERT_CMD- Choose "Insert Marker" from the Special menu.
 *
 *	2.	COUNT_CMD- Choose "Count Anchors In Range" from the Special
 *		menu.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name markers>
 *			<Description Insert marker or count anchors in range>
 *			<Directory fdk_install_dir/samples/markers>
 *			<CommandLine $FAPIDIR/fa.markers>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.markers>
 *		to:
 *			<SharedLibrary fa.markers.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		markers=Standard,Insert marker or count anchors in range,
 *			fdk_install_dir\samples\markers\debug\markers.dll, all 
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
#include "fstrings.h"
#include "fmemory.h"
#include "fdetypes.h"
#include "futils.h"

#define INSERT_CMD 1
#define COUNT_CMD 2

F_ObjHandleT InsertMarker(F_ObjHandleT docId, F_TextLocT loc, StringT markername);
IntT CountAnchorsInRange(F_ObjHandleT docId, F_TextRangeT tr);

VoidT F_ApiInitialize(init)
     IntT init;
{
	F_ObjHandleT specialMenuId;
	F_ObjHandleT separatorId;
	F_ObjHandleT insertCmdId, countCmdId;
	F_ObjHandleT mainMenuId = 0;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch (init){
	case FA_Init_First:
		/* Get specialMenuId */
		specialMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, (StringT) "SpecialMenu");
		if (specialMenuId) {
			/* Define and add a new command to the Special menu */
			insertCmdId = F_ApiDefineAndAddCommand(INSERT_CMD, specialMenuId, (StringT) "insertMarkerCmd", (StringT) "Insert Marker", (StringT) "");
			countCmdId = F_ApiDefineAndAddCommand(COUNT_CMD, specialMenuId, (StringT) "countAnchorCmd", (StringT) "Count Anchors In Range", (StringT) "");

			/* Use FP_PrevMenuItemInMenu property to move command to top of menu */
			F_ApiSetId(specialMenuId, insertCmdId, FP_PrevMenuItemInMenu, 0);
			/* Get the ID of Separator1 */ 
			separatorId = F_ApiGetNamedObject(FV_SessionId, FO_MenuItemSeparator, (StringT) "Separator1");
			F_ApiAddCommandToMenu(specialMenuId, separatorId);
			/* Place the separator after the Count Pages command */
			F_ApiSetId(specialMenuId, separatorId, FP_PrevMenuItemInMenu, insertCmdId);
		}
		else
			F_ApiAlert((StringT) "Problem in finding special menu", FF_ALERT_CONTINUE_WARN);
		F_ApiBailOut();
		break;
	}
}

VoidT F_ApiCommand(command)
     IntT command;
{
	F_ObjHandleT docId = 0, markerId;
	F_TextRangeT tr;
	F_TextLocT loc;
	StringT markername, sres = NULL;
	IntT err;
	UIntT numAnchors = 0;

	docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);

	switch (command){
	case INSERT_CMD:	  
		if (!docId){
			F_ApiAlert((StringT) "Please Open a Document Before Invoking This Command.", FF_ALERT_CONTINUE_WARN);
			return;
		}	  
		tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
		if (tr.beg.objId == 0){
			F_ApiAlert((StringT) "No Insertion Point.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		loc = tr.beg = tr.end;
		err = F_ApiPromptString(&sres, "What Type of Marker?", "");
		if (err) return;
		if(sres == NULL) return;
		F_ApiSetString(FV_SessionId, docId, FO_MarkerType, sres);
		markername = sres;
		markerId = InsertMarker(docId, loc, markername);
		F_Free(sres);
		err = F_ApiPromptString(&sres, "Insert Marker Text Here and Click OK", "");
		if (err) return;
		F_ApiSetString(docId, markerId, FP_MarkerText, sres);
		F_ApiAlert("Your Marker Has Been Inserted", FF_ALERT_CONTINUE_NOTE);
		F_Free(sres);
		break;
	case COUNT_CMD:
		if (!docId){
			F_ApiAlert((StringT) "Please Open a Document Before Invoking This Command.", FF_ALERT_CONTINUE_WARN);
			return;
		}	  
		tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
		if (tr.beg.objId == 0){
			F_ApiAlert((StringT) "No Text Selection.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		numAnchors = CountAnchorsInRange(docId, tr);
		F_Printf(NULL, "There are %d Anchors in the Text Range.\n", numAnchors);
		break;
	default:
		break;
	}
}

F_ObjHandleT InsertMarker(F_ObjHandleT docId, F_TextLocT loc, StringT markername)
{
	F_ObjHandleT markerId, markerTypeId;
	
	markerId = F_ApiNewAnchoredObject(docId, FO_Marker, &loc);
	markerTypeId = F_ApiGetNamedObject(docId, FO_MarkerType, markername);
	if(!markerTypeId)
		markerTypeId = F_ApiNewNamedObject(docId, FO_MarkerType, markername);

	F_ApiSetId(docId, markerId, FP_MarkerTypeId, markerTypeId);
	return(markerId);
}

IntT CountAnchorsInRange(F_ObjHandleT docId, F_TextRangeT tr)
{
	F_TextItemsT tis;
	UIntT len = 0;

	tis = F_ApiGetTextForRange(docId, &tr, FTI_FrameAnchor | 
									FTI_TblAnchor | FTI_MarkerAnchor | FTI_FnAnchor);
	len = tis.len;

	F_ApiDeallocateTextItems(&tis);
	return(len);
}


