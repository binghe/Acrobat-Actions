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
 *   Program Name:   
 *		dialog
 *
 *    General Description:
 *		Displays a sample custom dialog box. The template and resource files  
 *		for the dialog box are included. Refer to the platform specific  
 *		documentation for information on creating and compiling the 
 *		dialog resource.
 *
 *    Invocation:                                                             
 *		From the Dialog menu choose Modal to display the sample dialog.
 *                                                                      
 *    Install Info (UNIX):                                              
 *		If you compile this as an RPC client (the default), add these lines
 *		to the apiclients file:
 *
 *		<APIclient
 *			<Name dialog>
 *			<Description Displays a sample custom dialog box.>
 *			<Directory fdk_install_dir/samples/dialog>
 *			<CommandLine $FAPIDIR/fa.dialog>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.dialog>
 *		to:
 *			<SharedLibrary fa.dialog.dl>
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
 **************************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "futils.h"

/*
 *      Constants
 */
#define DIALOG_NUM                      1
#define MODAL                           1
#define NUM_STRINGS                     10
#define TEXT_BOX                        2
#define IMAGE_POPUP                     3
#define POPUP                           5
#define SCROLL_LIST                     7
#define VALUE_TEXT_BOX					10
#define SCROLL_BAR                      11
#define CHECK_BOX                       12
#define OK_BUTTON                       14
#define CANCEL_BUTTON					15

/*
 *      Globals
 */
F_ObjHandleT    gDialogId = 0;

/*
 *      Prototypes
 */
VoidT HandleDialogEvent(IntT itemNum, IntT modifiers);

VoidT F_ApiInitialize(IntT initialization)
{
    F_ObjHandleT    menubarId;
    F_ObjHandleT    menuId;
    
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

    if(initialization == FA_Init_First){
		menubarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
		menuId = F_ApiDefineAndAddMenu(menubarId, "APIDialogMenu", "Dialog");
		F_ApiDefineAndAddCommand(MODAL, menuId,"ModalCmd", "Modal", "");
		F_ApiBailOut();
    }
}

VoidT F_ApiCommand(IntT command)
{
    F_ObjHandleT			itemId;
    F_StringsT              strings;
    
    gDialogId = F_ApiOpenResource(FO_DialogResource, "dialog");
    if(!gDialogId){
        F_ApiAlert("Unable to open dialog resource.", FF_ALERT_CONTINUE_NOTE);
        return;
    }
    /*Create a list to display in the dialog box.*/
    strings.len = NUM_STRINGS;
    
    strings.val = (StringT *)F_Alloc(NUM_STRINGS * sizeof(StringT), NO_DSE);
    if(strings.val == NULL){
        F_ApiAlert("Unable to allocate strings.", FF_ALERT_CONTINUE_NOTE);
        return;
    }
    /*First position is reserved for the title of dialog item - displays on Unix only*/
    strings.val[0] = F_StrCopyString("Dialog Title");
    strings.val[1] = F_StrCopyString("2");
    strings.val[2] = F_StrCopyString("3");
    strings.val[3] = F_StrCopyString("4");
    strings.val[4] = F_StrCopyString("5");
    strings.val[5] = F_StrCopyString("6");
    strings.val[6] = F_StrCopyString("7");
    strings.val[7] = F_StrCopyString("8");
    strings.val[8] = F_StrCopyString("9");
    strings.val[9] = F_StrCopyString("10");
		    
    itemId = F_ApiDialogItemId(gDialogId, SCROLL_LIST);
    F_ApiSetStrings(gDialogId, itemId, FP_Labels, &strings);
    
    itemId = F_ApiDialogItemId(gDialogId, POPUP);
    F_ApiSetStrings(gDialogId, itemId, FP_Labels, &strings);
	F_ApiSetInt(gDialogId, itemId, FP_State, 0);
    
    itemId = F_ApiDialogItemId(gDialogId, IMAGE_POPUP);
    F_ApiSetStrings(gDialogId, itemId, FP_Labels, &strings);
    
    F_ApiDeallocateStrings(&strings);
    
    itemId = F_ApiDialogItemId(gDialogId, SCROLL_BAR);
    F_ApiSetInt(gDialogId, itemId, FP_IncrVal, 1);
    F_ApiSetInt(gDialogId, itemId, FP_MinVal, 0);
    F_ApiSetInt(gDialogId, itemId, FP_MaxVal, 20);
    F_ApiSetInt(gDialogId, itemId, FP_State, 0);
    
    itemId = F_ApiDialogItemId(gDialogId, VALUE_TEXT_BOX);
    F_ApiSetString(gDialogId, itemId, FP_Text, "0");
    
    switch(command){
        case MODAL:
        F_ApiModalDialog(DIALOG_NUM, gDialogId);
        break;
    }
}

VoidT F_ApiDialogEvent(IntT dlgNum, IntT itemNum, IntT modifiers)
{
	switch(dlgNum){
        case DIALOG_NUM:
        HandleDialogEvent(itemNum, modifiers);
        break;
	}
}

VoidT HandleDialogEvent(IntT itemNum, IntT modifiers)
{
    F_ObjHandleT    itemId;
    F_StringsT              strings;
    StringT                 s = NULL;
    UCharT                  msg[10];
    IntT                    state;
    IntT                    dbclick;

    switch(itemNum){
		case SCROLL_BAR:
		itemId = F_ApiDialogItemId(gDialogId, SCROLL_BAR);
		state = F_ApiGetInt(gDialogId, itemId, FP_State);
		F_Sprintf(msg, "%d", state);
		itemId = F_ApiDialogItemId(gDialogId, VALUE_TEXT_BOX);
		F_ApiSetString(gDialogId, itemId, FP_Text, msg);
		
		break;
    
		case SCROLL_LIST:
		dbclick = F_ApiGetInt(gDialogId, gDialogId, FP_DoubleClick);
		if(dbclick){
				itemId = F_ApiDialogItemId(gDialogId, SCROLL_LIST);
				strings = F_ApiGetStrings(gDialogId, itemId, FP_Labels);
				state = F_ApiGetInt(gDialogId, itemId, FP_State);
				F_Printf(NULL, "You double clicked on: %s\n", strings.val[state]);
				F_ApiDeallocateStrings(&strings);
				}
		break;

    
		case OK_BUTTON:
		/* Close the dialog box */
		F_ApiClose(gDialogId, FF_CLOSE_MODIFIED);
		break;
    
		case CANCEL_BUTTON:
		/* Close the dialog box */
		F_ApiClose(gDialogId, FF_CLOSE_MODIFIED);
		break;
	}
}