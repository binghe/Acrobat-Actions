/*********************************************************************

 ADOBE SYSTEMS INCORPORATED
 Copyright (C) 1994-2006 Adobe Systems Incorporated
 All rights reserved.

 NOTICE: Adobe permits you to use, modify, and distribute this file
 in accordance with the terms of the Adobe license agreement
 accompanying it. If you have received this file from a source other
 than Adobe, then your use, modification, or distribution of it
 requires the prior written permission of Adobe.

 -------------------------------------------------------------------*/ 
/**

\file SelectionServerInit.cpp

 - Implements the core handshake callbacks.

 - Installs the Acrobat SDK > Image Selection Tool menuitem and
   the associated AVToolButton.

*********************************************************************/

#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif
#include "Resource.h"

/*-------------------------------------------------------
	Constants/Declarations
-------------------------------------------------------*/

static ASAtom ImageSelection_K;
static ASBool gSelectionToolIsActive = false;
static AVMenuItem menuItem = NULL;
static AVToolButton toolButton = NULL;
HFT gDebugWindowHFT = NULL;
extern void InitializeTool (void);
extern void InitializeSelectionServer (void);

#if WIN_PLATFORM
extern "C" HINSTANCE gHINSTANCE;
#endif

/*-------------------------------------------------------
	Utility Methods
-------------------------------------------------------*/

/* GetToolIcon
** ------------------------------------------------------
** */ 
/** Retrieves the icon resource for the tool button.
 ** */
void *GetToolIcon ()
{
#if WIN_PLATFORM
	return LoadImage (gHINSTANCE, MAKEINTRESOURCE(IDB_SELBITMAP),
						IMAGE_BITMAP, 0, 0, LR_DEFAULTSIZE);
#else
    extern CFBundleRef gPluginBundle;
	AVIconDataRec iconData;
    
    // Find a resource in the plugin bundle by name and type.
    CFURLRef pingURL = CFBundleCopyResourceURL( gPluginBundle,
                                               CFSTR("SelectionServer"),
                                               CFSTR("png"),
                                               NULL );
    
    ASFile asf = NULL;
    ASPathName aspn = ASFileSysCreatePathName (NULL,ASAtomFromString("CFURLRef"),
                                               pingURL, NULL);
    ASFileSysOpenFile(NULL, aspn, ASFILE_READ, &asf);
    
    ASUns32 dataSize = ASFileGetEOF(asf);
    
    ASUns8 *data = (ASUns8 *)ASmalloc(dataSize + 1);
    ASFileRead(asf, (char *)data, dataSize);
    ASFileClose(asf);
    
    iconData.dataStm = ASMemStmRdOpen((char *)data, dataSize);
    iconData.eColorFormat = kAVIconColor;
    
    return AVAppCreateIconBundle6(kAVIconPNG, &iconData, 1);
#endif
}

/*-------------------------------------------------------
	UI Callbacks
-------------------------------------------------------*/

/* SelectionToolExecute
** ------------------------------------------------------
** */ 
/** Toggles the selection tool on and off.
 **
 ** @see AVAppGetActiveTool
 ** @see AVToolGetType
 ** @see AVAppGetToolByName
 ** @see AVAppGetActiveDoc
 ** @see AVDocGetLastActiveTool
 ** @see AVAppSetActiveTool
 ** */
static ACCB1 void ACCB2 SelectionToolExecute (void *clientData)
{
#ifdef MAC_PLATFORM
#pragma unused(clientData)
#endif

	AVTool tool = AVAppGetActiveTool();
	if (AVToolGetType(tool) != ImageSelection_K)
		tool = AVAppGetToolByName (ImageSelection_K);
	else
	{
		AVDoc avDoc = AVAppGetActiveDoc();
		tool = AVDocGetLastActiveTool(avDoc);
	}

	AVAppSetActiveTool (tool, true);
}

/* SelectionToolIsEnabled
** ------------------------------------------------------
** */ 
/** Enables the AVTool if the user has the required
 ** permissions for the active document.
 **
 ** @return true if enabled
 **
 ** @see PDDocGetPermissions
*/
static ACCB1 ASBool ACCB2 SelectionToolIsEnabled (void *permRequired)
{
	AVDoc avDoc = AVAppGetActiveDoc();
	if (!avDoc)
		return false;
	else {
		PDPerms docPerms = PDDocGetPermissions(AVDocGetPDDoc(avDoc));
		return (!permRequired || (((size_t)permRequired & docPerms) != 0));
	}
}

/* SelectionToolIsMarked
** ----------------------------------------------------
** */ 
/** Marks the UI elements as active if our tool is the
 ** active tool.
 **
 ** @return true to mark the element as active.
*/
static ACCB1 ASBool ACCB2 SelectionToolIsMarked(void *clientData)
{
#ifdef MAC_PLATFORM
#pragma unused(clientData)
#endif

	AVTool activeTool = AVAppGetActiveTool();
	return (ImageSelection_K == activeTool->GetType(activeTool));
}

/*-------------------------------------------------------
	Core Handshake Callbacks
-------------------------------------------------------*/

/* PluginExportHFTs
** ------------------------------------------------------
** */ 
/** Create and register the HFT's.
 **
 ** @return true to continue loading plug-in, 
 ** false to cause plug-in loading to stop.
 */
ACCB1 ASBool ACCB2 PluginExportHFTs (void)
{
	return true;
}

/* PluginImportReplaceAndRegister
** ------------------------------------------------------
** */ 
/** 
 **	The application calls this function to allow it to
 **	-# Import plug-in supplied HFTs.
 **	-# Replace functions in the HFTs you're using (where allowed).
 **	-# Register to receive notification events.
.
 **	Cos, PDModel and AcroView-level functionality are not available here.
 **
 **	@return true to continue loading plug-in,
 **	@return false to cause plug-in loading to stop.
*/
ACCB1 ASBool ACCB2 PluginImportReplaceAndRegister (void)
{
	// Acquire the SnippetRunner HFT. We don't depend on it, though.
	gDebugWindowHFT = ASExtensionMgrGetHFT(ASAtomFromString("ADBE:DebugWindow"), 1);
	return true;
}

/* PluginInit
** ------------------------------------------------------
** */
/** The main initialization routine.
 **	Creates a menu item and toolbar button for this plug-in.
 **	
 **	@return true to continue loading the plug-in
 **	@return false to cause plug-in loading to stop.
 ** 
 ** @see ASAtomFromString
 ** @see AVMenubarAcquireMenuByName
 ** @see AVMenuNew
 ** @see AVMenuItemNew
 ** @see AVMenuItemSetExecuteProc
 ** @see AVMenuItemSetComputeEnabledProc
 ** @see AVMenuItemSetComputeMarkedProc
 ** @see AVMenuAddMenuItem
 ** @see AVMenuItemRelease
 ** @see AVMenuRelease
 ** */
ACCB1 ASBool ACCB2 PluginInit (void)
{
	AVMenubar menubar = AVAppGetMenubar();
	AVMenu volatile commonMenu = NULL;

	if (!menubar)
		return false;

	ImageSelection_K = ASAtomFromString ("ImageSelection");

	DURING
		// Acquire the common "Acrobat SDK" menu, creating it if necessary.
		commonMenu = AVMenubarAcquireMenuByName (menubar, "ADBE:Acrobat_SDK");
		if (!commonMenu) {
			commonMenu = AVMenuNew ("Acrobat SDK", "ADBE:Acrobat_SDK", gExtensionID);
			AVMenubarAddMenu(menubar, commonMenu, APPEND_MENU);
		}

    	// Create our main menuitem and add to the common menu
		menuItem = AVMenuItemNew ("Image Selection Tool", "ADBE:ImageSelection", NULL, true, NO_SHORTCUT, 0, GetToolIcon(), gExtensionID);
		AVMenuItemSetExecuteProc (menuItem,
				ASCallbackCreateProto(AVExecuteProc, SelectionToolExecute), NULL);
		AVMenuItemSetComputeEnabledProc (menuItem,
				ASCallbackCreateProto(AVComputeEnabledProc, SelectionToolIsEnabled), (void*)pdPermCopy);
		AVMenuItemSetComputeMarkedProc (menuItem,
				ASCallbackCreateProto(AVComputeMarkedProc, SelectionToolIsMarked), NULL);
		AVMenuAddMenuItem (commonMenu, menuItem, APPEND_MENUITEM);
		AVMenuItemRelease (menuItem);

		AVMenuRelease (commonMenu);
	HANDLER
		if (commonMenu)
			AVMenuRelease (commonMenu);
		return false;
	END_HANDLER

	// Insert the image selection toolbutton just before the
	// "endToolsGroup" AVToolButton separator.

	DURING
		AVToolBar toolBar = AVAppGetToolBar();
		AVToolButton separator = AVToolBarGetButtonByName (toolBar,
												ASAtomFromString("endToolsGroup"));

		toolButton = AVToolButtonNew (ASAtomFromString("ADBE:ImageSelection"),
													GetToolIcon(), true, false);
		AVToolButtonSetExecuteProc (toolButton,
			ASCallbackCreateProto(AVExecuteProc, SelectionToolExecute), NULL);
		AVToolButtonSetComputeEnabledProc (toolButton,
			ASCallbackCreateProto(AVComputeEnabledProc, SelectionToolIsEnabled), (void*)pdPermCopy);
		AVToolButtonSetComputeMarkedProc (toolButton, SelectionToolIsMarked, NULL);
		AVToolButtonSetHelpText (toolButton, "Image Selection Tool");

		AVToolBarAddButton (toolBar, toolButton, true, separator);
	HANDLER
		return false;
	END_HANDLER

	// Set up the AVTool and the selection server.
	InitializeTool();
	InitializeSelectionServer();

	return true;
}

/* PluginUnload
** ------------------------------------------------------
** */ 
/** 
 **	The unload routine.
 **	Called when your plug-in is being unloaded when the application quits.
 **	Use this routine to release any system resources you may have
 **	allocated.
 **
 **	Returning false will cause an alert to display that unloading failed.
 **	@return true to indicate the plug-in unloaded.
 **
 ** @see AVToolButtonDestroy
*/
ACCB1 ASBool ACCB2 PluginUnload (void)
{
	// Remove any menus or menu items created.
	if (menuItem)
		AVMenuItemRemove (menuItem);

	if (toolButton)
		AVToolButtonDestroy (toolButton);

	return true;
}

/* GetExtensionName
** ------------------------------------------------------
** */ 
/**
 **	Return the unique ASAtom associated with your plug-in.
 **	@return the plug-in's name as an ASAtom.
 **
 **	@see ASAtomFromString
*/
ASAtom GetExtensionName()
{
	return ASAtomFromString ("ADBE:SelectionServer");
}

 /*
 ** PIHandshake */
/** This function provides the callback functions to the application that allow it to 
 ** register the plug-in with the application environment.
 ** 
 ** Required Plug-in handshaking routine: <b>Do not change its name!</b>
 ** 
 ** @param handshakeVersion the version this plug-in works with. There are two versions possible, the plug-in version 
 ** and the application version. The application calls the main entry point for this plug-in with its version.
 ** The main entry point will call this function with the version that is earliest. 
 ** @param handshakeData OUT the data structure used to provide the primary entry points for the plug-in. These
 ** entry points are used in registering the plug-in with the application and allowing the plug-in to register for 
 ** other plug-in services and offer its own.
 ** @return true to indicate success, false otherwise (the plug-in will not load).
 ** */

ACCB1 ASBool ACCB2 PIHandshake(Uns32 handshakeVersion, void *handshakeData)
{
	if (handshakeVersion == HANDSHAKE_V0200) {
		/* Cast handshakeData to the appropriate type */
		PIHandshakeData_V0200 *hsData = (PIHandshakeData_V0200 *)handshakeData;

		/* Set the name we want to go by */
		hsData->extensionName = GetExtensionName();

		/* If you export your own HFT, do so in here */
		hsData->exportHFTsCallback = (void *)ASCallbackCreateProto(PIExportHFTsProcType, &PluginExportHFTs);

		/*
		** If you import plug-in HFTs, replace functionality, and/or want to register for notifications before
		** the user has a chance to do anything, do so in here.
		*/
		hsData->importReplaceAndRegisterCallback = (void *)ASCallbackCreateProto(PIImportReplaceAndRegisterProcType,
																		 &PluginImportReplaceAndRegister);

		/* Perform your plug-in's initialization in here */
		hsData->initCallback = (void *)ASCallbackCreateProto(PIInitProcType, &PluginInit);

		/* Perform any memory freeing or state saving on "quit" in here */
		hsData->unloadCallback = (void *)ASCallbackCreateProto(PIUnloadProcType, &PluginUnload);

		/* All done */
		return true;

	} /* Each time the handshake version changes, add a new "else if" branch */

	/*
	** If we reach here, then we were passed a handshake version number we don't know about.
	** This shouldn't ever happen since our main() routine chose the version number.
	*/
	return false;
}
