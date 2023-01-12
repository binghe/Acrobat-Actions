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
 *		pickfmts
 *
 *  General Description:
 *		Allows the user to choose a group of paragraph formats to delete
 *		from the active document. It makes use of a custom dialog box.
 *
 *	Invocation:
 *		From the FDK Class Menu, choose "Delete Paragraph Formats".
 *		Make your choices from the dialog box that appears.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name pickfmts>
 *			<Description Custom delete paragraphs.>
 *			<Directory fdk_install_dir/samples/pickfmts>
 *			<CommandLine $FAPIDIR/fa.pickfmts>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.pickfmts>
 *		to:
 *			<SharedLibrary fa.pickfmts.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		This sample contains a resource file which includes a versioninfo
 *		resource. To register the client, copy or move the client to the 
 *		fminit\plugins directory in the FrameMaker product directory.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ************************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "fstrlist.h"
#include "fmemory.h"
#include "futils.h"
#include "fprogs.h"

#include "cutils.h"

#define MAXSTRING 255 
#define DELETE_FMTS 1
#define KEEP_BOX 1
#define RIGHT_ARROW 4
#define DELETE_BOX 3
#define LEFT_ARROW 2
#define OK 5
#define CANCEL 6
#define HELP 7
#define PICK_DIALOG 1

#define PICK_DRE_FILE (StringT) "multipic"

StringListT getListOfFormats();
F_StringsT  convertToApiList();
StringT getSelectedLabel();
IntT getSelectedLabelIndex();
VoidT deleteUnwantedFormats();

F_ObjHandleT dialogId;
F_ObjHandleT activeDocId;
F_ObjHandleT keepScrollBoxId;
F_ObjHandleT deleteScrollBoxId;
StringListT keepList = NULL;
StringListT deleteList = NULL;
IntT moveItemNum;
StringT moveItemName = NULL;

/* Call back to put up menu and menu item */
VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		addToClassMenu(DELETE_FMTS, (StringT) "deleteFmtsCmd", (StringT) "Delete Paragraph Formats", (StringT) "\\!DPF");
		F_ApiBailOut();
		break;
	}
}

VoidT F_ApiCommand(command)
IntT command;{
	F_StringsT apiKeepList;
	F_StringsT apiDeleteList;
	
	switch(command){
	case DELETE_FMTS:
		activeDocId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
		if(!activeDocId){
			F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		deleteList = F_StrListNew(10, 2);
		keepList = getListOfFormats(activeDocId);
		if(!keepList){
			F_ApiAlert((StringT) "No formats currently defined", FF_ALERT_CONTINUE_WARN);
			return;
		}
		apiKeepList = convertToApiList(keepList);
		if(apiKeepList.val == NULL){
			F_ApiAlert((StringT) "Could not convert list: possible memory problem", FF_ALERT_CONTINUE_WARN);
			return;
		}
		/* Open the dialog box resource */
		dialogId = F_ApiOpenResource(FO_DialogResource, PICK_DRE_FILE);
		if(!dialogId){
			F_ApiAlert((StringT) "Unable to open dialog resource", FF_ALERT_CONTINUE_WARN);
			return;
		}
		keepScrollBoxId = F_ApiDialogItemId(dialogId, KEEP_BOX);
		deleteScrollBoxId = F_ApiDialogItemId(dialogId, DELETE_BOX);
		/* stuff the keep box with the list of currently define paragraph foramts */
		F_ApiSetStrings(dialogId, keepScrollBoxId,  FP_Labels, &apiKeepList);
		F_ApiDeallocateStrings(&apiKeepList);
		F_ApiSetInt(dialogId, keepScrollBoxId, FP_State, -1);
		apiDeleteList = convertToApiList(deleteList);
		F_ApiSetStrings(dialogId, deleteScrollBoxId,  FP_Labels, &apiDeleteList);
		F_ApiDeallocateStrings(&apiDeleteList);
		F_ApiModalDialog(PICK_DIALOG, dialogId);
		break;
	}
}

/* for modeless dialog box */
VoidT F_ApiDialogEvent(dlgNum, itemNum, modifiers)
IntT dlgNum;
IntT itemNum;
IntT modifiers;{
	IntT i;
	StringT s;
	F_StringsT apiKeepList;
	F_StringsT apiDeleteList;
	
	switch(itemNum){
	case KEEP_BOX:
	case DELETE_BOX:
		moveItemName  = getSelectedLabel(dialogId, itemNum);
		moveItemNum = getSelectedLabelIndex(dialogId, itemNum);
		F_ApiReturnValue(FR_ModalStayUp);
		break;
	case RIGHT_ARROW:
		if(moveItemName){
			if(F_StrListIndex(keepList, moveItemName) != -1){
				if(keepList && moveItemName){
					F_StrListRemove(keepList, moveItemNum);
					for(i = 0; i < F_StrListLen(deleteList); i++){
						s = F_StrListGet(deleteList, i);
						if(F_StrCmpUTF8(s, moveItemName  ) >= 0)
							break;
					}
					if(i < F_StrListLen(keepList)){
						F_StrListInsert(deleteList, moveItemName, i);
						F_Free(moveItemName);
						F_ApiSetInt(dialogId, deleteScrollBoxId, FP_FirstVis, i);
					}
					else{
						F_StrListAppend(deleteList, moveItemName);
						F_ApiSetInt(dialogId, deleteScrollBoxId, FP_FirstVis, F_StrListLen(deleteList) -1);
					}
					moveItemName = NULL;
					apiKeepList = convertToApiList(keepList);
					F_ApiSetStrings(dialogId, keepScrollBoxId,  FP_Labels, &apiKeepList);
					F_ApiDeallocateStrings(&apiKeepList);
					F_ApiSetInt(dialogId, keepScrollBoxId, FP_State, -1);
					apiDeleteList = convertToApiList(deleteList);
					F_ApiSetStrings(dialogId, deleteScrollBoxId,  FP_Labels, &apiDeleteList);
					F_ApiDeallocateStrings(&apiDeleteList);
					F_ApiSetInt(dialogId, deleteScrollBoxId, FP_State, -1);
				}
			}
			F_Free(moveItemName);
			moveItemName=NULL;
		}
		F_ApiReturnValue(FR_ModalStayUp);
		break;

	case LEFT_ARROW:
		if(moveItemName){
			if(F_StrListIndex(deleteList, moveItemName) != -1){
				if(deleteList && moveItemName){
					F_StrListRemove(deleteList, moveItemNum);
					for(i = 0; i < F_StrListLen(keepList); i++){
						s = F_StrListGet(keepList, i);
						if(F_StrCmp(s, moveItemName ) >= 0)
							break;
					}
					if(i < F_StrListLen(keepList)){
						F_StrListInsert(keepList, moveItemName, i);
						F_Free(moveItemName);
						F_ApiSetInt(dialogId, keepScrollBoxId, FP_FirstVis, i);
					}
					else{
						F_StrListAppend(keepList, moveItemName);
						F_ApiSetInt(dialogId, keepScrollBoxId, FP_FirstVis, F_StrListLen(keepList) -1);
					}
					moveItemName = NULL;
					apiKeepList = convertToApiList(keepList);
					F_ApiSetStrings(dialogId, keepScrollBoxId,  FP_Labels, &apiKeepList);
					F_ApiDeallocateStrings(&apiKeepList);
					F_ApiSetInt(dialogId, keepScrollBoxId, FP_State, -1);
					apiDeleteList = convertToApiList(deleteList);
					F_ApiSetStrings(dialogId, deleteScrollBoxId,  FP_Labels, &apiDeleteList);
					F_ApiDeallocateStrings(&apiDeleteList);
					F_ApiSetInt(dialogId, deleteScrollBoxId, FP_State, -1);
				}
			}
			F_Free(moveItemName);
			moveItemName=NULL;
		}
		F_ApiReturnValue(FR_ModalStayUp);
		break;
	case OK:
		deleteUnwantedFormats(activeDocId, deleteList);
		break;
	}
}

F_StringsT  convertToApiList(fdeList)
StringListT fdeList;{
	IntT numFmts;
	F_StringsT list;
	IntT i;
	
	numFmts = F_StrListLen(fdeList);
	list.val = (StringT *) F_Alloc(numFmts*sizeof(StringT), NO_DSE);
	if(list.val){
		list.len = numFmts;
		for(i =0; i < numFmts; i++){
			list.val[i] = F_StrNew(MAXSTRING + 1);
			F_StrCpy(list.val[i], F_StrListGet(fdeList,i));
		}
	}
	else{
		F_ApiAlert((StringT) "Unable to allocate memory for format list", FF_ALERT_CONTINUE_WARN);
		list.val = NULL;
	}
	return(list);
}

StringListT getListOfFormats(docId)
F_ObjHandleT docId;{
	F_ObjHandleT fmtId;
	StringListT fmtList;
	StringT fmtName;
	
	fmtList = F_StrListNew((UIntT) 1, (UIntT)1);
	fmtId = F_ApiGetId(FV_SessionId, docId, FP_FirstPgfFmtInDoc);
	while(fmtId){
		fmtName = F_ApiGetString(docId, fmtId, FP_Name);
		F_StrListAppend(fmtList, fmtName);
		F_Free(fmtName);
		fmtId = F_ApiGetId(docId, fmtId, FP_NextPgfFmtInDoc);
	}
	return(fmtList);
}

StringT getSelectedLabel(dialogId, itemNum)
F_ObjHandleT dialogId;
IntT itemNum;{
	IntT index;
	F_StringsT strings;
	StringT s;
	F_ObjHandleT itemId = F_ApiDialogItemId(dialogId, itemNum);
	UIntT type = F_ApiGetObjectType(dialogId, itemId);
	
	if(!dialogId || !itemId || (type != FO_DlgPopUp && type != FO_DlgScrollBox && type != FO_DlgImage)){
		FA_errno = FE_BadParameter;
		return NULL;
	}
	index = F_ApiGetInt(dialogId, itemId, FP_State);
	strings = F_ApiGetStrings(dialogId, itemId, FP_Labels);
	if(!strings.len || !strings.val || index < 0)
		return NULL;
	s = F_StrCopyString(strings.val[index]);
	F_ApiDeallocateStrings(&strings);
	return s;
}

/* Returns the index of the selected label on the popup menu or scrollbox.
 *	If nothing is selected, -1 is returned.*/
IntT getSelectedLabelIndex(dialogId, itemNum)
F_ObjHandleT dialogId;
IntT itemNum;{
	F_ObjHandleT itemId = F_ApiDialogItemId(dialogId, itemNum);
	UIntT type = F_ApiGetObjectType(dialogId, itemId);
	
	if(!dialogId || !itemId || (type != FO_DlgPopUp && type != FO_DlgScrollBox && type != FO_DlgImage)){
		FA_errno = FE_BadParameter;
		return 0;
	}
	return F_ApiGetInt(dialogId, itemId, FP_State);
}

VoidT deleteUnwantedFormats(docId, deleteList)
F_ObjHandleT docId;
StringListT deleteList;{
	F_ObjHandleT fmtId;
	F_ObjHandleT nextFmtId;
	StringT fmtName;
	
	fmtId = F_ApiGetId(FV_SessionId, docId, FP_FirstPgfFmtInDoc);
	while(fmtId){
		fmtName = F_ApiGetString(docId, fmtId, FP_Name);
		if(F_StrListIndex(deleteList, fmtName) != -1){
			nextFmtId =  F_ApiGetId(docId, fmtId, FP_NextPgfFmtInDoc);
			F_ApiDelete(docId, fmtId);
			fmtId = nextFmtId;
		}
		else
			fmtId = F_ApiGetId(docId, fmtId, FP_NextPgfFmtInDoc);
		F_Free(fmtName);
	}
}
