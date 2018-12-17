/*********************************************************************

 Copyright (C) 2018  Chun Tian (binghe)
 Copyright (C) 1998-2006 Adobe Systems Incorporated
 All rights reserved.

 NOTICE: Adobe permits you to use, modify, and distribute this file
 in accordance with the terms of the Adobe license agreement
 accompanying it. If you have received this file from a source other
 than Adobe, then your use, modification, or distribution of it
 requires the prior written permission of Adobe.

 ---------------------------------------------------------------------

 StarterInit.cpp

 - Skeleton .cpp file for a plug-in. It implements the basic
   handshaking methods required for all plug-ins.

*********************************************************************/

// Acrobat Headers.
#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif

/** 
  Starter is a plug-in template that provides a minimal
  implementation for a plug-in. Developers may use this plug-in a
  basis for their plug-ins.
 */

/*-------------------------------------------------------
	Constants/Declarations
 -------------------------------------------------------*/
static AVMenuItem menuItem = NULL;

ACCB1 ASBool ACCB2 FindPluginMenu(void);

/*-------------------------------------------------------
	Core Handshake Callbacks
-------------------------------------------------------*/

/* PluginExportHFTs
** ------------------------------------------------------
**/

/**
** Create and register the HFT's.
**
** @return true to continue loading plug-in,
** false to cause plug-in loading to stop.
*/
ACCB1 ASBool ACCB2 PluginExportHFTs(void)
{
	return true;
}

/* PluginImportReplaceAndRegister
** ------------------------------------------------------
** */
/** 
	The application calls this function to allow it to
	<ul>
	<li> Import plug-in supplied HFTs.
	<li> Replace functions in the HFTs you're using (where allowed).
	<li> Register to receive notification events.
	</ul>

	@return true to continue loading plug-in,
	false to cause plug-in loading to stop.
*/
ACCB1 ASBool ACCB2 PluginImportReplaceAndRegister(void)
{
    return true;
}

static const char *pluginMenuName = "Extensions";

/* Find an existing "Plug-ins" menu from the menubar. */
ACCB1 ASBool ACCB2 FindPluginMenu(void)
{
    AVMenubar menubar = AVAppGetMenubar();
    AVMenu volatile commonMenu = NULL;
    ASAtom PluginMenuName = ASAtomFromString(pluginMenuName);

    if (!menubar)
	return false;

    /* Gets the number of menus in menubar. */
    AVTArraySize nMenu = AVMenubarGetNumMenus(menubar);

    for (AVMenuIndex index = 0; index < nMenu; ++ index) {
	/* Acquires the menu with the specified index. */
	AVMenu menu = AVMenubarAcquireMenuByIndex(menubar, index);
	/* get the menu's language-independent name. */
	ASAtom name = AVMenuGetName(menu);
	if (name == PluginMenuName) {
	    // AVAlertNote(ASAtomGetString(name));
	}
    }

    return true;
}

ACCB1 void ACCB2 PluginCommand(void *clientData)
{
    // get this plugin's name for display
    ASAtom NameAtom = ASExtensionGetRegisteredName (gExtensionID);
    const char * name = ASAtomGetString(NameAtom);
    char str[256];
    sprintf(str,"This menu item is added by plugin %s.\n", name);
    
    // try to get front PDF document
    AVDoc avDoc = AVAppGetActiveDoc();
    
    if(avDoc==NULL) {
	// if no doc is loaded, make a message.
	strcat(str,"There is no PDF document loaded in Acrobat.");
    }
    else {
	// if a PDF is open, get its number of pages
	PDDoc pdDoc = AVDocGetPDDoc (avDoc);
	int numPages = PDDocGetNumPages (pdDoc);
	sprintf(str,"%sThe active PDF document has %d pages.", str, numPages);
    }

    // display message
    AVAlertNote(str);
    
    return;
}

ACCB1 ASBool ACCB2 PluginIsEnabled(void *clientData)
{
    // this code make it is enabled only if there is an open PDF document.
    return (AVAppGetActiveDoc() != NULL);
}

ACCB1 ASBool ACCB2 PluginMenuItem(const char* menuItemTitle,
				  const char* menuItemName)
{
    AVMenubar menubar = AVAppGetMenubar();
    AVMenu volatile commonMenu = NULL;
	
    if (!menubar) return false;

DURING
    // Create our menuitem
    menuItem = AVMenuItemNew(menuItemTitle, menuItemName,
			     NULL, true, NO_SHORTCUT, 0, NULL, gExtensionID);
    AVMenuItemSetExecuteProc
      (menuItem, ASCallbackCreateProto(AVExecuteProc, PluginCommand), NULL);

    AVMenuItemSetComputeEnabledProc
      (menuItem, ASCallbackCreateProto(AVComputeEnabledProc, PluginIsEnabled),
       (void *)pdPermEdit);

    commonMenu = AVMenubarAcquireMenuByName (menubar, pluginMenuName);
    // if "Extensions" menu is not existing, create "Acrobat SDK".
    if (!commonMenu) {
	commonMenu = AVMenuNew("Acrobat SDK", "ADBE:Acrobat_SDK", gExtensionID);
	AVMenubarAddMenu(menubar, commonMenu, APPEND_MENU);
    }

    AVMenuAddMenuItem(commonMenu, menuItem, APPEND_MENUITEM);
    AVMenuRelease(commonMenu);

HANDLER
    if (commonMenu) {
	AVMenuRelease (commonMenu);
    }
    return false;

END_HANDLER
    return true;
}

ACCB1 ASBool ACCB2 PluginSetMenu()
{
    return PluginMenuItem((const char *)"Starter",
			  (const char *)"CHUN:StarterMenu");
}

/* PluginInit
** ------------------------------------------------------
**/
/** 
	The main initialization routine.
	
	@return true to continue loading the plug-in, 
	false to cause plug-in loading to stop.
*/
ACCB1 ASBool ACCB2 PluginInit(void)
{
    return PluginSetMenu();
}

/* PluginUnload
** ------------------------------------------------------
**/
/** 
	The unload routine.
	Called when your plug-in is being unloaded when the application quits.
	Use this routine to release any system resources you may have
	allocated.

	Returning false will cause an alert to display that unloading failed.
	@return true to indicate the plug-in unloaded.
*/
ACCB1 ASBool ACCB2 PluginUnload(void)
{
    return true;
}

/* GetExtensionName
** ------------------------------------------------------
*/
/**
	Returns the unique ASAtom associated with your plug-in.
	@return the plug-in's name as an ASAtom.
*/
ASAtom GetExtensionName()
{
    return ASAtomFromString("CHUN:Starter");
}

/** PIHandshake
	function provides the initial interface between your plug-in and the application.
	This function provides the callback functions to the application that allow it to 
	register the plug-in with the application environment.

	Required Plug-in handshaking routine: <b>Do not change its name!</b>
	
	@param handshakeVersion the version this plug-in works with. There are two versions possible, the plug-in version 
	and the application version. The application calls the main entry point for this plug-in with its version.
	The main entry point will call this function with the version that is earliest. 
	@param handshakeData OUT the data structure used to provide the primary entry points for the plug-in. These
	entry points are used in registering the plug-in with the application and allowing the plug-in to register for 
	other plug-in services and offer its own.
	@return true to indicate success, false otherwise (the plug-in will not load).
*/
ACCB1 ASBool ACCB2 PIHandshake(Uns32 handshakeVersion, void *handshakeData)
{
    if (handshakeVersion == HANDSHAKE_V0200) {
	/* Cast handshakeData to the appropriate type */
	PIHandshakeData_V0200 *hsData = (PIHandshakeData_V0200 *)handshakeData;
	
	/* Set the name we want to go by */
	hsData->extensionName = GetExtensionName();
	
	/* If you export your own HFT, do so in here */
	hsData->exportHFTsCallback =
	  (void*)ASCallbackCreateProto(PIExportHFTsProcType, &PluginExportHFTs);
	
	/*
	** If you import plug-in HFTs, replace functionality, and/or want to register for
	** notifications before
	** the user has a chance to do anything, do so in here.
	*/
	hsData->importReplaceAndRegisterCallback =
	    (void*)ASCallbackCreateProto(PIImportReplaceAndRegisterProcType,
					 &PluginImportReplaceAndRegister);

	/* Perform your plug-in's initialization in here */
	hsData->initCallback = (void*)ASCallbackCreateProto(PIInitProcType, &PluginInit);
	
	/* Perform any memory freeing or state saving on "quit" in here */
	hsData->unloadCallback = (void*)ASCallbackCreateProto(PIUnloadProcType, &PluginUnload);
	
	/* All done */
	return true;
	
    } /* Each time the handshake version changes, add a new "else if" branch */
    
    /*
     ** If we reach here, then we were passed a handshake version number we don't know about.
     ** This shouldn't ever happen since our main() routine chose the version number.
     */
    return false;
}
