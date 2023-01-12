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
 *	    whatpage
 *
 * General Description:
 *		Identifies the Body page # of the selected object.
 *
 * Invocation:
 *		From the FDKClassMenu, choose "What page?"
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name whatpage>
 *			<Description Displays page # of selected obj on body page>
 *			<Directory fdk_install_dir/samples/whatpage>
 *			<CommandLine $FAPIDIR/fa.whatpage>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.whatpage>
 *		to:
 *			<SharedLibrary fa.whatpage.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		whatpage=Standard, Displays page # of selected obj on body page,
 *			fdk_install_dir\samples\whatpage\debug\whatpage.dll, all 
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
#include "futils.h"
#include "fstrings.h"
#include "fmemory.h"

#include "cutils.h"

#define WHAT_PAGE 1  

#define MAXSTRING 255

StringT findPage();

FindTextLocXY(F_ObjHandleT docId,F_TextLocT tl)
{
	UCharT msg[128];
	F_PropValT tempPropVal=F_ApiGetTextPropVal(docId,&tl,FP_LocX);
	IntT left=tempPropVal.propVal.u.ival;
	F_ApiDeallocatePropVal(&tempPropVal);

	F_Sprintf(msg,"X = %d",left);
	F_ApiAlert(msg, FF_ALERT_CONTINUE_NOTE);
}

/* Call back to put up menu and menu item */
VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		addToClassMenu(WHAT_PAGE, (StringT) "whatPageCmd", (StringT) "What page?", (StringT) "\\!WP");
		F_ApiBailOut();
		break;
	}
}

/* Callback to respond to the user choosing menu items */
VoidT F_ApiCommand(command)
IntT command;{
	F_ObjHandleT docId;
	F_ObjHandleT objId;
	F_TextRangeT ip;
	StringT pageNumStr;
	StringT msg;
	
	F_ApiBailOut();
	docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
	
	if(!docId){
		F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
		return;
	}
	ip = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
	objId = ip.beg.objId; /* if range use beginning */
	
	if(!objId){
		objId  = F_ApiGetId(FV_SessionId, docId, FP_SelectedTbl);
		if(!objId){
			objId = F_ApiGetId(FV_SessionId, docId, FP_FirstSelectedGraphicInDoc);
		}
	}


	FindTextLocXY(docId,ip.beg);
	return;
	if(objId)
		pageNumStr = findPage(docId, objId);
	else
		pageNumStr = NULL;
	if(pageNumStr){
		msg = F_StrNew(MAXSTRING + 1);
//		F_StrCpyNEnc(msg, (StringT) "Object is on page ", MAXSTRING, fdeUTF8EncodingId);
//		F_StrCatNEnc(msg, pageNumStr, MAXSTRING, fdeUTF8EncodingId);
		F_ApiAlert(msg, FF_ALERT_CONTINUE_NOTE);
		if(msg != NULL)
			F_Free(msg);
		if(pageNumStr != NULL)
			F_Free(pageNumStr);
	}
	else
		F_ApiAlert((StringT) "Cannot determine page number of current object",  FF_ALERT_CONTINUE_WARN);
}



StringT findPage(docId, objId)
F_ObjHandleT docId;
F_ObjHandleT objId;{
	F_ObjHandleT frameId = 0;
	F_ObjHandleT pageId;
	IntT objType;
	F_ObjHandleT rowId;
	F_ObjHandleT cellId;
	IntT colNum;
	StringT pageNumStr;
	
	while(objId){
		frameId = objId;
		objType = F_ApiGetObjectType(docId, objId);
		switch(objType){
		case FO_SubCol:
			objId = F_ApiGetId(docId, objId, FP_ParentTextFrame);
			break;
		case FO_Tbl:
			rowId = F_ApiGetId(docId, objId, FP_TopRowSelection);
			colNum = F_ApiGetInt(docId, rowId, FP_RightColNum);
			cellId = F_ApiGetId(docId, rowId, FP_FirstCellInRow);
			objId = cellId;
			break;
			/* handle FO_Cell case */
		case FO_Cell:
			/* handle FO_Pgf case */
		case FO_Pgf:
			/* handle FO_AFrame case */
		case FO_AFrame:
			objId = F_ApiGetId(docId, objId, FP_InTextFrame);
			break;
			/* handle graphic object cases */
		case FO_TextLine:
		case FO_TextFrame:
		case FO_UnanchoredFrame:
		case FO_Arc:
		case FO_Ellipse:
		case FO_Group:
		case FO_Inset:
		case FO_Line:
		case FO_Math:
		case FO_Polygon:
		case FO_Polyline:
		case FO_Rectangle:
		case FO_RoundRect:
			objId = F_ApiGetId(docId, objId, FP_FrameParent);
			break;
		default:
			/* prevents loop if unknown object type is found */
			objId = 0;
			break;
		}
	}
	if(frameId){
		/* use FP_PageFramePage to get the page identifier of the object */
		/* use FP_PageNumString to get the page number as it appears on the page */
		pageId = F_ApiGetId(docId, frameId, FP_PageFramePage);
		pageNumStr = F_ApiGetString(docId, pageId, FP_PageNumString);
	}
	else
		pageNumStr = NULL;
	return(pageNumStr);
}
