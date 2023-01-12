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
 *		elmutil
 *	
 *   General Description:	
 *		This sample demonstrates how to manipulate elements and other
 *		structure oriented features of FrameMaker.
 *                                                                         
 *   Invocation:                                                             	
 *		It adds a menu called "Element-Utils" with the following commands:
 * 
 *		Format:	
 *			Wraps the current text selection in an Emphasis element
 *			with the Type attribute set appropriately.  If there
 *			is an insertion point but no selection, it inserts
 *			and Emphasis element at the insertion point.  If the
 *			selection includes more than <TEXT> it will raise an
 *			error. Demonstrates how to wrap text and to insert element.
 * 
 *		Collapse All:	
 *			Collapses the entire structure view.
 *	
 *		Expand All:			
 *			Expands the entire structure view. Demonstrates how to 
 *			traverse the structure tree.
 *
 *		Reset Attributes:
 *			Resets all attributes to their default values. Demonstrates 
 *			how to manipulate attributes.
 * 
 *		Add Acronym:
 *			Adds an Acronym and Defn element pair alphabetically
 *			to the AcronymList element. Demonstrates use of a 
 *			custom dialog box and how to add an element.					
 *                                                                      
 *   Install Info (UNIX):                                              
 *		If you compile this as an RPC client (the default), add these lines
 *		to the apiclients file:
 *	                      
 *		<APIclient
 *			<Name elemutil>
 *			<Description Utilities for manipulating elements. >
 *			<Directory fdk_install_dir/samples/elemutil>
 *			<CommandLine $FAPIDIR/fa.elemutil>
 *		>    
 *                            
 *		Replace fdk_install_dir with the path of the directory in         
 *		which you installed your copy of the FDK files.          
 *	                
 *		If you compile this as a dynamic client, change the line       
 *			<CommandLine $FAPIDIR/fa.elemutil>                  
 *		to:                           
 *			<SharedLibrary elemutil.dl>                   
 *	                
 *		Restart maker.                                                 
 *                            
 *   Install Info (Windows):
 *		This sample contains a resource file which includes a versioninfo
 *		resource. To register the client, copy or move the client to the 
 *		fminit\plugins directory in the FrameMaker product directory.
 *		Restart maker.
 *
 *   Exceptions:
 *		None.                                                        
 *                                                                      
 **************************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "fmemory.h"
#include "futils.h"
#include "elemutil.h"

VoidT SetUp_Menu();

F_ObjHandleT	dlgId;

/*
 * F_ApiInitialize()
 *
 * Called during plug-in initialization when FrameMaker starts up.
 * It adds the new menu/commands. 
 */
VoidT F_ApiInitialize(IntT init)
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch (init) {
		case FA_Init_First :
			SetUp_Menu();
			break;

		default:
			break;
	}	
}

/*
 * F_ApiCommand()
 *
 * Called each time a command from the "Element-Utils" menu is chosen.
 */
VoidT F_ApiCommand(IntT command)
{
	F_ObjHandleT	docId, elemId;

	docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
	if (!docId) return;

	F_ApiSetInt(0, FV_SessionId, FP_Displaying, False);

	switch (command) {
		case COLLAPSE_ALL :
		case EXPAND_ALL :
			elemId = U_GetHighestElemId(docId);
			if (!elemId) return;

			if (command == COLLAPSE_ALL)
				Collapse_Structure(docId, elemId, True);
			else
				Collapse_Structure(docId, elemId, False);
			break;

		case BOLD :
		case UL :
		case ITAL :
			Apply_FormatInfo(docId, command);	
			break;

		case ADD_ACRONYM :
			Add_AcronymToList(docId);
			break;

		case RESET_ATTR :
			elemId = U_GetHighestElemId(docId);
			if (!elemId) return;

			Reset_AttributeValues(docId, elemId);
			break;

		default :
			break;
	}
	F_ApiSetInt(0, FV_SessionId, FP_Displaying, True);
	F_ApiRedisplay(docId);
}

/*
 * F_ApiDialogEvent()
 *
 * Called each time Okay or Cancel are clicked in the "Add Acronym"
 * dialog box.
 */
VoidT F_ApiDialogEvent(IntT dlgNum, IntT itemNum, IntT modifiers)
{
	F_ObjHandleT 	docId, itemId, elemId, acrListId;
	StringT			acronym, defn;

	docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
	if (!docId) return;

	switch (dlgNum) {
	case DLG_ADDACR :
		switch (itemNum) {
		case DLGITEM_OK :
			itemId = F_ApiDialogItemId(dlgId, DLGITEM_ACR);
			acronym = F_ApiGetString(dlgId, itemId, FP_Text);
			itemId = F_ApiDialogItemId(dlgId, DLGITEM_DEFN);
			defn = F_ApiGetString(dlgId, itemId, FP_Text);
			if (!F_StrIsEmpty(acronym) && !F_StrIsEmpty(defn)) {
				elemId = U_GetHighestElemId(docId);
				acrListId = FindAcrList(docId, elemId);
				if (acrListId) {
					AddAcrToList(docId, acrListId, acronym, defn);
				}
				else
					F_ApiAlert("Unable to find \"Acronym List\"", FF_ALERT_CONTINUE_NOTE);
			}
			else {
				F_ApiAlert("Enter an Acronym and its Definition.", FF_ALERT_CONTINUE_NOTE);
			}
			F_Free(acronym);
			F_Free(defn);
			break;

		case DLGITEM_CANCEL :
		case FV_DlgClose :
		default :
			break;
		}
		break;
	}

}

/*
 * SetUp_Menu()
 *
 */
VoidT SetUp_Menu()
{
	F_ObjHandleT	menubarId, menuId, submenuId, sepaId;

	menubarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, (StringT)"!MakerMainMenu");
	menuId = F_ApiDefineAndAddMenu(menubarId, (StringT)"ElemUtils", (StringT)"Element-Utils");
	submenuId = F_ApiDefineAndAddMenu(menuId, (StringT)"Format", (StringT)"Format");
	F_ApiDefineAndAddCommand(BOLD, submenuId, "Bold", "Bold", "");
	F_ApiDefineAndAddCommand(UL, submenuId, "Ul", "Underline", "");
	F_ApiDefineAndAddCommand(ITAL, submenuId, "Ital", "Italic", "");

	sepaId = F_ApiGetNamedObject(FV_SessionId, FO_MenuItemSeparator,
					(StringT)"Separator1");
	F_ApiAddCommandToMenu(menuId, sepaId);

	F_ApiDefineAndAddCommand(COLLAPSE_ALL, menuId, "CollapseAll", "Collapse All", "");
	F_ApiDefineAndAddCommand(EXPAND_ALL, menuId, "ExpandAll", "Expand All", "");
	F_ApiDefineAndAddCommand(RESET_ATTR, menuId, "ResetAttr", "Reset Attributes", "");
	F_ApiDefineAndAddCommand(ADD_ACRONYM, menuId, "AddAcr", "Add Acronym", "");
}

