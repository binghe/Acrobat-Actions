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
\file SelectionServer.cpp

 - The SelectionServer plug-in implements a selection server to handle
   images. The image selection tool allows users to select images by calling
   AVDocSetSelection() with a selection type of "Image".

   This call passes control to the selection server, which proceeds to
   highlight the image.

 - The selection server functionality is limited to getting, showing, and
   losing a selection.

*********************************************************************/

#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif
#include "SelectionServer.h"
#include "DebugWindowHFT.h"

/*-------------------------------------------------------
	Constants/Declarations
-------------------------------------------------------*/

static ASAtom Image_K;
static AVPageViewDrawProc cbDrawImageSelection;
static AVDocSelectionServerRec imageSelectionServer;

/*-------------------------------------------------------
	AVDocSelectionServer Callbacks
-------------------------------------------------------*/

/* SelectionServerGetType
** ------------------------------------------------------
** */ 
/** We're registering a selection server of type "Image".
**
** @return the selection server type.
** */
static ACCB1 ASAtom ACCB2 SelectionServerGetType ()
{
	return ASAtomFromString ("Image");
}

/* SelectionServerGettingSelection
** ------------------------------------------------------
** */ 
/** This is the selection server's callback for when a
**  selection is registered. 
**
** @param selData pointer to an ImageSelectionRec allocated 
** through ASmalloc. The LosingSelection callback will call 
** ASfree() on it.
**
** @see AVAppRegisterForPageViewDrawing
** */
static ACCB1 void ACCB2 SelectionServerGettingSelection (AVDoc doc, void *selData,
															  ASBool highlight)
{
	AVPageView pageView = AVDocGetPageView(doc);
	ImageSelection isel = (ImageSelection)selData;

	if (gDebugWindowHFT)
		DebugEmitString("ImageSelectionServer: GettingSelection");

	// Draw the selection. It will only be drawn if the page
	// holding the selection is being displayed.

	DrawImageSelection (pageView, NULL, selData);

	// Register the AVPageViewDrawProc so we can redraw the selection
	// when the page is updated.

	AVAppRegisterForPageViewDrawing (cbDrawImageSelection, isel);
}

/* SelectionServerLosingSelection
** ------------------------------------------------------
** */ 
/** This is called whenever we have an active selection
 ** and the Viewer is attempting to change the selection
 ** to something else.
 **
 ** @see AVDocGetPageView
 ** @see AVAppUnregisterForPageViewDrawing
 ** @see PDPageGetNumber
 ** @see AVPageViewGetFirstVisiblePageNum
 ** @see AVPageViewGetLastVisiblePageNum
 ** @see AVPageViewRectToDevice
 ** @see AVPageViewInvalidateRect
 ** @see AVPageViewDrawNow
 ** @see PDPageRelease
 ** @see ASFree
 */
static ACCB1 void ACCB2 SelectionServerLosingSelection (AVDoc doc, void *selData,
															 ASBool highlight)
{
	AVPageView pageView = AVDocGetPageView(doc);
	ImageSelection isel = (ImageSelection)selData;

	if (gDebugWindowHFT)
		DebugEmitString ("ImageSelectionServer: LosingSelection");

	// Make sure that an exception doesn't prevent us from
	// releasing the PDPage.

	DURING

		// Unregister the AVPageViewDrawProc; there's no selection
		// to draw any more.

		AVAppUnregisterForPageViewDrawing (cbDrawImageSelection);

		// Update the pageview to erase the selection.
		ASInt32 pageNum = PDPageGetNumber (isel->page);

		if ((pageNum >= AVPageViewGetFirstVisiblePageNum(pageView)) &&
			(pageNum <= AVPageViewGetLastVisiblePageNum(pageView)) && highlight) {

			AVDevRect viewRect;
			AVPageViewRectToDevice (pageView, &isel->bounds, &viewRect);
			AVPageViewInvalidateRect (pageView, &viewRect);
			AVPageViewDrawNow (pageView);
		}
	HANDLER
	END_HANDLER;

	// Release the page.
	PDPageRelease (isel->page);

	// Free the selection data. Note that anyone calling AVDocSetSelection
	// for our selection server must have used ASmalloc to allocate the
	// memory, or this won't work.

	ASfree (isel);
}

/* SelectionServerShowSelection
** ------------------------------------------------------
** */ 
/** If the user has strayed to a page different from the
 ** selection, this callback will take the user to the
 ** correct page and scroll the selection into view.
 **
 ** @see AVPageViewBeginOperation
 ** @see AVPageViewGoTo
 ** @see AVPageViewRectToDevice
 ** @see AVPageViewScrollToRect
 ** @see AVPageViewEndOperation
 **/
static ACCB1 void ACCB2 SelectionServerShowSelection (AVDoc doc, void *selData)
{
	ImageSelection isel = (ImageSelection)selData;

	if (gDebugWindowHFT)
		DebugEmitString ("ImageSelectionServer: ShowSelection");

	if (selData) {

		AVPageView pageView = AVDocGetPageView(doc);
		AVDevRect selBounds;

		// We only want to push one frame on the go-back stack
		// for this operation; thus we wrap everything up with
		// AVPageViewBegin/EndOperation.

		AVPageViewBeginOperation (pageView);

		DURING

			// We don't care much about errors, but it's vital that
			// we call AVPageViewEndOperation, or the go-back stack
			// will be permanently suspended.

			AVPageViewGoTo (pageView, PDPageGetNumber(isel->page));
			AVPageViewRectToDevice (pageView, &isel->bounds, &selBounds);
			AVPageViewScrollToRect (pageView, &selBounds, true, true, 5);

		HANDLER
		END_HANDLER;

		// Push one frame onto the go-back stack.
		AVPageViewEndOperation (pageView);
	}
}

/* InitializeSelectionServer
** ------------------------------------------------------
** */ 
/** Create and register the selection server for images.
 **
 ** @see ASAtomFromString
 ** @see AVDocRegisterSelectionServer
 ** */
void InitializeSelectionServer (void)
{
	// Initialize our supporting globals.
	Image_K = ASAtomFromString("Image");
	cbDrawImageSelection = ASCallbackCreateProto (AVPageViewDrawProc, DrawImageSelection);

	// Set up the image selection server.
	memset (&imageSelectionServer, 0, sizeof(AVDocSelectionServerRec));
	imageSelectionServer.size = sizeof(AVDocSelectionServerRec);

	// Currently, we only implement Getting, Losing and Showing selections.
	imageSelectionServer.GetType =
		ASCallbackCreateProto (AVDocSelectionGetTypeProc, &SelectionServerGetType);
	imageSelectionServer.GettingSelection =
		ASCallbackCreateProto (AVDocSelectionGettingSelectionProc, &SelectionServerGettingSelection);
	imageSelectionServer.LosingSelection =
		ASCallbackCreateProto (AVDocSelectionLosingSelectionProc, &SelectionServerLosingSelection);
	imageSelectionServer.ShowSelection =
		ASCallbackCreateProto (AVDocSelectionShowSelectionProc, &SelectionServerShowSelection);

	AVDocRegisterSelectionServer (&imageSelectionServer);
}


