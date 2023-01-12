/********************************************************************/
/*                                                                  */
/* ADOBE SYSTEMS INCORPORATED                                       */
/* Copyright 1986 - 2012 Adobe Systems Incorporated                 */
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
 *	    Sample client for managing different views in FrameMaker 11.
 *
 * Invocation:
 *		From the FDK Class Menu of all the 3 views, choose "Get Active View" and "Set Active View".
 *      Switch from one view to another view.
 *
 * Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		views=Standard, Different views in FrameMaker 11,
 *			fdk_install_dir\samples\views\debug\views.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		
 *      Restart maker.
 *
 *	Exceptions:
 *		None. 
 *
 ***********************************************************************/
/*
 * General Description:
 *	    Define and Add Menu in WYSIWYG , Author and XML View.
 *		Define and Add Commands in WYSIWYG , Author and XML View. 
 *		Gets and display the Active View Name by querying the session's FP_ActiveView property.
 *		Sets Active View from WYSIWYG to Author, Author to XML,XML to WYSIWYG view.
 *      Pre and Post SwitchView Notification.
 */

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "futils.h"

#define Get_Active_View 1
#define Set_Active_View 2

/* Call back to put up menu and command in WYSIWYG , Author and XML View */
VoidT F_ApiInitialize(IntT init)
{
	F_ObjHandleT menuBarId,XVMenuBarID,menuId;
		
	StringT curViewName, validViews[3] = {(StringT)"WYSIWYG View",(StringT)"Author View",(StringT)"XML View"};
	F_StringsT validViewsList = {3, validViews};
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init)
	{
	case FA_Init_First:
		menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, (ConStringT)"!MakerMainMenu");
		menuId = F_ApiDefineAndAddMenu(menuBarId, (ConStringT)"Views",(ConStringT) "Views");

		curViewName = F_ApiGetString (0, 0, FP_ActiveView);
		if (F_StrCmp (curViewName, (StringT)"XML View"))
             F_ApiSetString (0, 0, FP_ActiveView, (StringT)"XML View");

		XVMenuBarID = F_ApiGetNamedObject(FV_SessionId, FO_Menu,(ConStringT)"!XmlMainMenu");
		F_ApiAddMenuToMenu (XVMenuBarID, menuId);

		if (F_StrCmp (curViewName, (StringT)"XML View"))
            F_ApiSetString (0, 0, FP_ActiveView, curViewName);

		F_ApiDefineAndAddCommandEx(Get_Active_View, menuId, (ConStringT)"Get Active View", (ConStringT)"Get Active View", (ConStringT)"\\!gav", &validViewsList);
		F_ApiDefineAndAddCommandEx(Set_Active_View, menuId, (ConStringT)"Set Active View", (ConStringT)"Set Active View", (ConStringT)"\\!sav", &validViewsList);
	
		F_ApiNotification(FA_Note_PostSwitchView, True);
		F_ApiNotification(FA_Note_PreSwitchView, True);

		F_StrFree (curViewName);
	break;
	}
}

/* Callback to respond to the user choosing menu items */
VoidT F_ApiCommand(IntT command)
{
	StringT activeViewName;
	
	switch (command)
	{
	    case Get_Active_View:
		activeViewName = F_ApiGetString (0, 0, FP_ActiveView);
        F_ApiAlert((StringT)activeViewName, FF_ALERT_CONTINUE_NOTE);
	    break;
	
	    case Set_Active_View:
		activeViewName = F_ApiGetString (0, 0, FP_ActiveView);
		if(F_StrCmp(activeViewName,(ConStringT)"WYSIWYG View")==0)  
		F_ApiSetString (0, 0, FP_ActiveView,"Author View");
		else if (F_StrCmp(activeViewName,(ConStringT)"Author View")==0)  
		F_ApiSetString (0, 0, FP_ActiveView,"XML View");
		else if (F_StrCmp(activeViewName,(ConStringT)"XML View")==0) 
		F_ApiSetString (0, 0, FP_ActiveView,"WYSIWYG View");
        break;
	
		default:
		break;
	}
}

VoidT F_ApiNotify(IntT notification,F_ObjHandleT docId,StringT sparm,IntT iparm)
{
	StringT currentViewName=NULL,lastViewName=NULL; 
	UCharT msg[256];  /* your message to the user */
	if (notification == FA_Note_PostSwitchView)
	{
			StringT lastViewName = F_ApiCopyString((ConStringT) sparm);
			F_Sprintf(msg, "Post SwitchView Notification: View switched from %s",lastViewName);		
			F_ApiAlert((StringT)msg, FF_ALERT_CONTINUE_NOTE);
		
	}
	else if (notification == FA_Note_PreSwitchView)
	{
			StringT currentViewName = F_ApiCopyString((ConStringT) sparm);
			F_Sprintf(msg, "Pre SwitchView Notification: View switch to %s",currentViewName);		
			F_ApiAlert((StringT)msg , FF_ALERT_CONTINUE_NOTE);
	}
}