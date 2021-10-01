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
\file SelectionServerTool.cpp

 - Implements the image selection tool.

*********************************************************************/

#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif
#include "SelectionServer.h"
#include "Resource.h"

/*-------------------------------------------------------
	Constants/Declarations
-------------------------------------------------------*/

static AVToolRec gSelectionTool;
static AVCursor gSelectionToolCursor = NULL;
static ASAtom ImageSelection_K;

#if WIN_PLATFORM
extern "C" HINSTANCE gHINSTANCE;
#endif

/*-------------------------------------------------------
	Utility Method
-------------------------------------------------------*/

/* SelectImageAtPoint
** ------------------------------------------------------
** */
/**
 ** The image selection tool calls this to handle mouse
 ** clicks. The method acquires the PDEContent for the
 ** page and walks through it looking for images that lie
 ** under the click point.  If it finds one, it allocates
 ** an ImageSelection record and calls AVDocSetSelection
 ** with it. The selection server takes it from there.
 **
 ** @return true if an image was selected.
 **
 ** @param pageView current PageView
 ** @param x, y coordinates of mouse click on this pageview 
 **
 ** @see AVDocClearSelection
 ** @see AVPageViewGetAVDoc
 ** @see AVPageViewDevicePointToPage
 ** @see PDPageAcquirePDEContent
 ** @see PDEContentGetNumElems
 ** @see PDEContentGetElem
 ** @see PDEObjectGetType
 ** @see PDEElementIsAtPoint
 ** @see PDEElementGetBBox
 ** @see PDDocAcquirePage
 ** @see PDPageGetDoc
 ** @see PDPageGetNumber
 ** @see ASGetErrorString
 ** @see ASGetExceptionErrorCode
 ** @see AVAlertNote
 ** @see PDPageReleasePDEContent
 ** */
ASBool SelectImageAtPoint (AVPageView pageView, AVDevCoord x, AVDevCoord y)
{
	PDEContent volatile pdeContent = NULL;
	PDEElement pdeElement;
	ASBool bImageHit = false;
	ASFixedPoint mouseClick;
	ASFixedRect bBox;
	PDPage pdPage = NULL;
	ImageSelection selection = NULL;

	AVDocClearSelection (AVPageViewGetAVDoc(pageView), true);

	DURING

		// Iterate through each kPDEImage element on the
		// page and check to see if the user clicked on it.

		pdPage = AVPageViewGetPage (pageView);
		AVPageViewDevicePointToPage (pageView, x, y, &mouseClick);
		pdeContent = PDPageAcquirePDEContent (pdPage, gExtensionID);
		ASInt32 numElems = PDEContentGetNumElems (pdeContent);

		for (ASInt32 i = 0; i < numElems; i++) {

			pdeElement = PDEContentGetElem (pdeContent, i);
			if (PDEObjectGetType((PDEObject)pdeElement) == kPDEImage)
				bImageHit = PDEElementIsAtPoint (pdeElement, mouseClick);

			if (bImageHit) {

				// Get the bounding box of the PDEElement and fill out the
				// selection structure to highlight the image.

				PDEElementGetBBox (pdeElement, &bBox);
				selection = (ImageSelection)ASmalloc(sizeof(ImageSelectionRec));

				// Acquire the page so it stays around until we have
				// highlighted the image.

				selection->page = PDDocAcquirePage (PDPageGetDoc(pdPage),
														PDPageGetNumber(pdPage));
				selection->bounds = bBox;
				AVDocSetSelection (AVPageViewGetAVDoc(pageView),
									ASAtomFromString("Image"), selection, true);
				break;
			}

		}
	HANDLER
		char errorBuf[256];
		ASGetErrorString (ASGetExceptionErrorCode(), errorBuf, 256);
		AVAlertNote (errorBuf);
	END_HANDLER

	// Release the objects that we acquired. We don't need to release
	// the page here because the LosingSelection callback does it.
	if (pdeContent)
		PDPageReleasePDEContent (pdPage, gExtensionID);

	return bImageHit;
}

/*-------------------------------------------------------
	AVTool Callbacks
-------------------------------------------------------*/

/* SelectionToolGetType
** ------------------------------------------------------
** */ 
/** Called to obtain the service type implemented by tool.
 **
 ** @return the tool type as an ASAtom.
*/
static ACCB1 ASAtom ACCB2 SelectionToolGetType (AVTool tool)
{
#ifdef MAC_PLATFORM
#pragma unused(tool)
#endif
	return ASAtomFromString ("ImageSelection");
}

/* SelectionToolAdjustCursor
** ------------------------------------------------------
** */
/** Called to obtain the cursor to be displayed. While
 ** this callback can be use to modify the cursor depending
 ** on the active context, we only ever use one.
 **
 ** @return true if we set the cursor.
 **
 ** @see AVPageViewIsAnnotAtPoint
 ** @see AVSysSetCursor
 ** */
static ACCB1 ASBool ACCB2 SelectionToolAdjustCursor (AVTool tool, AVPageView pageView,
													 AVDevCoord x, AVDevCoord y)
{
#ifdef MAC_PLATFORM
#pragma unused(tool)
#endif
	PDAnnot hitAnnot;

	/* Defer to the annotation, if any */
	if (AVPageViewIsAnnotAtPoint(pageView, x, y, &hitAnnot))
		return false;

	// Load the cursor if we haven't already.
	if (!gSelectionToolCursor) {
#if WIN_PLATFORM
		gSelectionToolCursor = (AVCursor)LoadImage (gHINSTANCE, MAKEINTRESOURCE(IDC_SELCURSOR),
											IMAGE_CURSOR, 0, 0, LR_DEFAULTSIZE);
#else
        NSCursor *selection = nil;
        CFBundleRef mainBundle = CFBundleGetBundleWithIdentifier(CFSTR("com.adobe.acrobat.sdk.SelectionServer"));
        CFURLRef resourcesURL = CFBundleCopyResourcesDirectoryURL(mainBundle);
        NSURL *resources = (NSURL*)resourcesURL;
        NSString *imagePath = @"SelectionServer.png";
        NSURL *imageURL = [resources URLByAppendingPathComponent:imagePath];
        NSImage *selectionImage = [[NSImage alloc] initWithContentsOfURL:imageURL];
        NSSize selectionImageSize = [selectionImage size];
        selection = [[NSCursor alloc] initWithImage:selectionImage hotSpot:NSMakePoint((selectionImageSize.width / 2.0), (selectionImageSize.height / 2.0))];
		gSelectionToolCursor = (AVCursor)selection;
#endif
	}

	AVSysSetCursor(gSelectionToolCursor);
	return true;
}

/* SelectionToolDoClick
** ------------------------------------------------------
** */ 
/** Called in response to mouse clicks. If the user clicked
 ** an image, we'll select it.
 **
 ** @return true if we handle the mouse click.
 ** */
static ACCB1 ASBool ACCB2 SelectionToolDoClick (AVTool tool, AVPageView pageView,
												AVDevCoord xHit, AVDevCoord yHit,
												AVFlagBits16 flags, AVTCount clickNo)
{
#ifdef MAC_PLATFORM
#pragma unused(tool, flags, clickNo)
#endif
	PDAnnot hitAnnot;

	if (AVPageViewIsAnnotAtPoint(pageView, xHit, yHit, &hitAnnot))
		return false;

	return SelectImageAtPoint (pageView, xHit, yHit);
}

/*-------------------------------------------------------
	Initialization Helper
-------------------------------------------------------*/

/* InitializeTool
** ------------------------------------------------------
**/ 
/** Registers the AVTool with Acrobat.
**
** @see AVAppRegisterTool
*/
void InitializeTool (void)
{
	// Initialize the AVToolRec callbacks that we've implemented.
	memset (&gSelectionTool, 0, sizeof(AVToolRec));
	gSelectionTool.size = sizeof(AVToolRec);
	gSelectionTool.GetType =
			ASCallbackCreateProto (GetTypeProcType, &SelectionToolGetType);
	gSelectionTool.AdjustCursor =
			ASCallbackCreateProto (AdjustCursorProcType, &SelectionToolAdjustCursor);
	gSelectionTool.DoClick =
			ASCallbackCreateProto (DoClickProcType, &SelectionToolDoClick);

	ImageSelection_K = ASAtomFromString ("ImageSelection");

	AVAppRegisterTool (&gSelectionTool);
}
