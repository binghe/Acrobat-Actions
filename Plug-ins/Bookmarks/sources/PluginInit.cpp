/*********************************************************************

 Copyright (C) 2018-2019 Chun Tian (binghe)
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
#include "resource.h"

#include <cstdio>
#include <cstring>

#include "Functions.hpp"

/** 
  Starter is a plug-in template that provides a minimal
  implementation for a plug-in. Developers may use this plug-in a
  basis for their plug-ins.
 */

/*-------------------------------------------------------
	Constants/Declarations
 -------------------------------------------------------*/
#ifdef WIN_PLATFORM
extern "C" HINSTANCE gHINSTANCE;
#endif

static const char *pluginMenuName = "Extensions";
static AVMenuItem topMenuItem = NULL;
static AVMenuItem menuItem[4] = {NULL, NULL, NULL, NULL};

ACCB1 ASBool ACCB2 FindPluginMenu(void);
ACCB1 ASBool ACCB2 PluginUnload(void);

static const char *toolName = "Fix FitType of All Bookmarks";

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

/* Find an existing "Plug-ins" menu from the menubar. */
ACCB1 ASBool ACCB2 FindPluginMenu(void)
{
    AVMenubar menubar = AVAppGetMenubar();
    ASAtom PluginMenuName = ASAtomFromString(pluginMenuName);

    if (!menubar) return false;

    /* Gets the number of menus in menubar. */
    AVTArraySize nMenu = AVMenubarGetNumMenus(menubar);

    for (AVMenuIndex index = 0; index < nMenu; ++index) {
	/* Acquires the menu with the specified index. */
	AVMenu menu = AVMenubarAcquireMenuByIndex(menubar, index);
	/* get the menu's language-independent name. */
	ASAtom name = AVMenuGetName(menu);
	if (name == PluginMenuName) {
	    AVAlertNote(ASAtomGetString(name));
	}
    }

    return true;
}

#define NOTESIZ 200
static char notes[NOTESIZ] = "";

/* Fix FitType of all Bookmarks */
ACCB1 void ACCB2 PluginCommand_1(void *clientData)
{
    // try to get front PDF document
    AVDoc avDoc = AVAppGetActiveDoc();
    PDDoc pdDoc = AVDocGetPDDoc(avDoc);
    PDBookmark rootBookmark = PDDocGetBookmarkRoot(pdDoc);
    int acc = 0;

    // visit all bookmarks recursively, fixing FitView
    acc = FixAllBookmarks(pdDoc, rootBookmark, acc);
#ifdef WIN_PLATFORM
    _snprintf(notes, NOTESIZ, "Changed %d bookmarks.", acc);
#else
    snprintf(notes, NOTESIZ, "Changed %d bookmarks.", acc);
#endif
    AVAlertNote((const char*) notes);

    return;
}

ACCB1 void ACCB2 PluginCommand_2(void *clientData)
{
    // try to get front PDF document
    AVDoc avDoc = AVAppGetActiveDoc();
    PDDoc pdDoc = AVDocGetPDDoc(avDoc);
    PDBookmark rootBookmark = PDDocGetBookmarkRoot(pdDoc);
    int acc = 0;

    // visit all bookmarks recursively, capitalizing them
    acc = CapitalizeAllBookmarks(pdDoc, rootBookmark, acc);
#ifdef WIN_PLATFORM
    _snprintf(notes, NOTESIZ, "Changed %d bookmarks.", acc);
#else
    snprintf(notes, NOTESIZ, "Changed %d bookmarks.", acc);
#endif
    AVAlertNote((const char*) notes);

    return;
}

/* Collapse All Bookmarks */
ACCB1 void ACCB2 PluginCommand_3(void *clientData)
{
    // try to get front PDF document
    AVDoc avDoc = AVAppGetActiveDoc();
    PDDoc pdDoc = AVDocGetPDDoc(avDoc);
    PDBookmark rootBookmark = PDDocGetBookmarkRoot(pdDoc);

    // collapse all bookmarks recursively
    CollapseAllBookmarks(pdDoc, rootBookmark);

    return;
}

/* Fix All Text Annotations */
ACCB1 void ACCB2 PluginCommand_4(void *clientData)
{
    // try to get front PDF document
    AVDoc avDoc = AVAppGetActiveDoc();
    PDDoc pdDoc = AVDocGetPDDoc(avDoc);

    int acc = FixAllTextAnnotations(pdDoc);
#ifdef WIN_PLATFORM
    _snprintf(notes, NOTESIZ, "Changed %d annotations.", acc);
#else
    snprintf(notes, NOTESIZ, "Changed %d annotations.", acc);
#endif
    AVAlertNote((const char*) notes);

    return;
}

ACCB1 ASBool ACCB2 PluginIsEnabled(void *clientData)
{
    // this code make it is enabled only if there is an open PDF document.
    return (AVAppGetActiveDoc() != NULL);
}

ACCB1 ASBool ACCB2 PluginIsDisabled(void *clientData)
{
    return false;
}

ACCB1 ASBool ACCB2 PluginSetMenu()
{
    AVMenubar menubar = AVAppGetMenubar();
    AVMenu volatile commonMenu = NULL;
    AVMenu subMenu = NULL;
    int i = 0;

    if (!menubar) { return false; }

DURING
    // Find or create our dedicated (sub)menu, title is not important (not shown anywhere)
    topMenuItem = AVMenubarAcquireMenuItemByName(menubar, "AA:Plugins");
    if (topMenuItem) {
        subMenu = AVMenuItemAcquireSubmenu(topMenuItem);
    } else {
        subMenu = AVMenuNew("N/A", "AA:PluginsMenu", gExtensionID);
        AVMenuAcquire(subMenu);
        topMenuItem = AVMenuItemNew("Acrobat Actions", "AA:Plugins",
                                    subMenu, true, NO_SHORTCUT, 0, NULL,
                                    gExtensionID);
    }

    /* Acquire() needs a Release() */
    commonMenu = AVMenubarAcquireMenuByName(menubar, pluginMenuName);
    // if "Extensions" menu doesn't exist, then create one.
    if (!commonMenu) {
      commonMenu = AVMenuNew(pluginMenuName, pluginMenuName, gExtensionID);
      AVMenubarAddMenu(menubar, commonMenu, APPEND_MENU);
    }
    AVMenuAddMenuItem(commonMenu, topMenuItem, APPEND_MENUITEM);
    AVMenuRelease(commonMenu);

    // Command 1
    menuItem[i] = AVMenuItemNew(toolName, "AA:FixFitType_BookmarksItm",
                                NULL, /* submenu */
                                true, /* longMenusOnly */
                                NO_SHORTCUT, 0 /* flags */,
                                NULL /* icon */, gExtensionID);
    AVMenuItemSetExecuteProc
      (menuItem[i], ASCallbackCreateProto(AVExecuteProc, PluginCommand_1), NULL);

    AVMenuItemSetComputeEnabledProc
      (menuItem[i], ASCallbackCreateProto(AVComputeEnabledProc, PluginIsEnabled),
       (void *)pdPermEdit);
    AVMenuAddMenuItem(subMenu, menuItem[i], APPEND_MENUITEM);
    i++;

    // Command 2
    menuItem[i] = AVMenuItemNew("Capitalize All Bookmarks", "AA:Capitalize_Bookmarks",
                                NULL, /* submenu */
                                true, /* longMenusOnly */
                                NO_SHORTCUT, 0 /* flags */,
                                NULL /* icon */, gExtensionID);
    AVMenuItemSetExecuteProc
      (menuItem[i], ASCallbackCreateProto(AVExecuteProc, PluginCommand_2), NULL);
    
    AVMenuItemSetComputeEnabledProc
      (menuItem[i], ASCallbackCreateProto(AVComputeEnabledProc, PluginIsEnabled),
       (void *)pdPermEdit);
    AVMenuAddMenuItem(subMenu, menuItem[i], APPEND_MENUITEM);
    i++;

    // Command 3
    menuItem[i] = AVMenuItemNew("Collapse All Bookmarks", "AA:Collapse_Bookmarks",
                NULL, /* submenu */
                true, /* longMenusOnly */
                NO_SHORTCUT, 0 /* flags */,
                NULL /* icon */, gExtensionID);
    AVMenuItemSetExecuteProc
      (menuItem[i], ASCallbackCreateProto(AVExecuteProc, PluginCommand_3), NULL);

    AVMenuItemSetComputeEnabledProc
      (menuItem[i], ASCallbackCreateProto(AVComputeEnabledProc, PluginIsEnabled),
       (void *)pdPermEdit);
    AVMenuAddMenuItem(subMenu, menuItem[i], APPEND_MENUITEM);
    i++;

    // Command 4
    menuItem[i] = AVMenuItemNew("Fix All Text Annotations", "AA:Fix_Annotations",
                                NULL, /* submenu */
                                true, /* longMenusOnly */
                                NO_SHORTCUT, 0 /* flags */,
                                NULL /* icon */, gExtensionID);
    AVMenuItemSetExecuteProc
      (menuItem[i], ASCallbackCreateProto(AVExecuteProc, PluginCommand_4), NULL);

    AVMenuItemSetComputeEnabledProc
      (menuItem[i], ASCallbackCreateProto(AVComputeEnabledProc, PluginIsEnabled),
       (void *)pdPermEdit);
    AVMenuAddMenuItem(subMenu, menuItem[i], APPEND_MENUITEM);
    i++;

HANDLER
    AVMenuRelease(subMenu);
    if (commonMenu) {
        AVMenuRelease(commonMenu);
    }
    return false;
END_HANDLER

    return true;
}

static AVCommandHandlerRec gAVCmdHandler;
const char *kCmdName = "AA:FixFitType_BookmarksCmd";

static ACCB1 AVCommandStatus ACCB2 DoWorkImpl (AVCommand cmd)
{
    AVDoc avDoc = AVCommandGetAVDoc(cmd);
    PDDoc pdDoc = AVDocGetPDDoc(avDoc);
    PDBookmark rootBookmark = PDDocGetBookmarkRoot(pdDoc);
    int acc = 0;

    // visit all bookmarks recursively, fixing FitView
    acc = FixAllBookmarks(pdDoc, rootBookmark, acc);
#ifdef WIN_PLATFORM
    _snprintf(notes, NOTESIZ, "Changed %d bookmarks.", acc);
#else
    snprintf(notes, NOTESIZ, "Changed %d bookmarks.", acc);
#endif
    AVAlertNote((const char*) notes);

    return kAVCommandDone;
}

static ACCB1 void ACCB2 DoGetPropsImpl (AVCommand cmd, ASCab params)
{
    // Exposing AVCommands to the batch framework
    const char *kCmdGenericTitle = toolName;
    const char *kCmdTitle = toolName;

    ASBool doItAll = false;
    if (ASCabNumEntries(params) == 0) {
        doItAll = true;
    }

    if (doItAll || ASCabKnown (params, kAVCommandKeyCanBatch)) {
        ASCabPutBool (params, kAVCommandKeyCanBatch, true);
    }

    if (doItAll || ASCabKnown (params, kAVCommandKeyGenericTitle))
    {
        // Create a new text object and insert it into the ASCab
        ASText text = ASTextNew();
        ASTextSetEncoded (text, kCmdGenericTitle,
                          (ASHostEncoding)PDGetHostEncoding());
        ASCabPutText (params, kAVCommandKeyGenericTitle, text);
    }

    if (doItAll || ASCabKnown (params, kAVCommandKeyTitle))
    {
        // Create another text object and insert it into the ASCab
        ASText text = ASTextNew();
        ASTextSetEncoded (text, kCmdTitle,
                          (ASHostEncoding)PDGetHostEncoding());
        ASCabPutText (params, kAVCommandKeyTitle, text);
    }
}

ACCB1 ASBool ACCB2 PluginSetCommands()
{
    // Create an AVCommandHandlerRec object
    memset (&gAVCmdHandler, 0, sizeof(AVCommandHandlerRec));
    gAVCmdHandler.size = sizeof(AVCommandHandlerRec);

    gAVCmdHandler.Work = ASCallbackCreateProto (AVCommandWorkProc, DoWorkImpl);
    gAVCmdHandler.GetProps = ASCallbackCreateProto (AVCommandGetProc, DoGetPropsImpl);
    AVAppRegisterCommandHandler (ASAtomFromString(kCmdName), &gAVCmdHandler);

    AVCommand cmd = AVCommandNew (ASAtomFromString(kCmdName));
    AVAppRegisterGlobalCommand (cmd);

    return true;
}

ACCB1 ASBool ACCB2 PluginSetToolbar()
{
    AVToolButton button =
        AVToolButtonNew (ASAtomFromString("AA:FixFitType_BookmarksBtn"), NULL, false, false);
    AVToolButtonSetExecuteProc (button,
        ASCallbackCreateProto(AVExecuteProc, PluginCommand_1), NULL);
    AVToolButtonSetComputeEnabledProc (button,
        ASCallbackCreateProto(AVComputeEnabledProc, PluginIsEnabled), NULL);
    AVToolButtonSetHelpText (button, toolName);

    // Create an ASConstText object by using a ASText object
    ASText tmpText = ASTextNew();
    ASTextSetPDText(tmpText, toolName);
    ASConstText labelText = tmpText;

    // Set the button’s label text with a kAVButtonPriorityOnNormal priority
    // NOTE: this fixed toolbar label display for Acrobat Pro XI
    AVToolButtonSetLabelText (button, labelText, kAVButtonPriorityOnNormal);
    ASTextDestroy(tmpText);

    /* First try to add the button to an existing public tool bar */
    AVToolBar toolBar = AVAppGetToolBarByName ("Add-on");
    if (NULL == toolBar) {
        /* maybe already added by another sibling plugin? */
        toolBar = AVAppGetToolBarByName ("AA:AcrobatActions");
    }
    if (NULL == toolBar) {
        toolBar = AVToolBarNew("AA:AcrobatActions", "Acrobat Actions");
    }
    if (AVToolBarIsRoomFor (toolBar, 1, 0)) {
        AVToolBarAddButton(toolBar, button, false, NULL);
    }

    return true;
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
    if (PluginSetMenu() && PluginSetCommands() && PluginSetToolbar()) {
        return true;
    }
    else {
        return false;
    }
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
ACCB1 ASBool ACCB2 PluginUnload (void)
{
    if (topMenuItem) {
        AVMenuItemRemove(topMenuItem);
    }

    AVCommand cmd = AVAppFindGlobalCommandByName(ASAtomFromString(kCmdName));
    if (NULL != cmd) {
        AVAppUnregisterGlobalCommand(cmd);
    }
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
    return ASAtomFromString("AA:Bookmarks");
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
