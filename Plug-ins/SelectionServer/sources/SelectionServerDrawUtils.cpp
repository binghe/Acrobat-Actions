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
\file SelectionServerDrawUtils.cpp

 - Implementation to draw the highlight around the selected image.

*********************************************************************/

#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif
#include "SelectionServer.h"
#include "Resource.h"

/*-------------------------------------------------------
	Helper Methods
-------------------------------------------------------*/

/* DrawImageSelectionHighlight
** ------------------------------------------------------
** */ 
/** Draws the selection on the pageview. Simply draws a
 ** rectangle around the image.
 **
 ** @see AVPageViewSetColor
 ** @see AVPageViewDrawRectOutline
 ** */
static void DrawImageSelectionHighlight (AVPageView pageView, const AVDevRect *selBounds)
{
	PDColorValueRec colorVal;

	// Define the color for our selection. Blue.
	colorVal.space = PDDeviceRGB;
	colorVal.value[0] = colorVal.value[1] = 0;
	colorVal.value[2] = ASInt32ToFixed(1);

	// Set the drawing color for the pageview.
	AVPageViewSetColor (pageView, &colorVal);

	// Draw the highlight.
	AVPageViewDrawRectOutline (pageView, selBounds, 1, NULL, 0);
}

/* DrawImageSelection
** ------------------------------------------------------
** */ 
/** This is the AVPageViewDrawProc that draws the current
 ** selection. It is registered whenever the selection server's
 ** GettingSelection callback is called, and unregistered when
 ** the LosingSelection callback is called. The callback is
 ** created in InitializeSelectionServer().
 **
 ** @see AVPageViewGetFirstVisiblePageNum
 ** @see AVPageViewGetLastVisiblePageNum
 ** @see AVPageViewRectToDevice
 ** */
ACCB1 void ACCB2 DrawImageSelection (AVPageView pageView, AVDevRect *updateRect, void *data)
{
	ImageSelection isel = (ImageSelection)data;
	ASInt32 pageNum = PDPageGetNumber (isel->page);
	AVDevRect viewRect;

	DURING
		if ((pageNum >= AVPageViewGetFirstVisiblePageNum(pageView)) &&
				(pageNum <= AVPageViewGetLastVisiblePageNum(pageView))) {

			// Convert the image's bounding rect to device space.
			AVPageViewRectToDevice (pageView, &isel->bounds, &viewRect);
			DrawImageSelectionHighlight (pageView, &viewRect);
		}
	HANDLER

	END_HANDLER
}

