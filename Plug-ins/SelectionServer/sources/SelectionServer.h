/*********************************************************************

 ADOBE SYSTEMS INCORPORATED
 Copyright (C) 1994-2006 Adobe Systems Incorporated
 All rights reserved.

 NOTICE: Adobe permits you to use, modify, and distribute this file
 in accordance with the terms of the Adobe license agreement
 accompanying it. If you have received this file from a source other
 than Adobe, then your use, modification, or distribution of it
 requires the prior written permission of Adobe.

 ---------------------------------------------------------------------

 SelectionServer.h

*********************************************************************/

#ifndef SELECTIONSERVER_H
#define SELECTIONSERVER_H

/* ImageSelection
** ------------------------------------------------------
**
** This is the structure used to store selection data for
** selections of type "Image". All callbacks in our
** AVDocSelectionServer can assume that selData is a
** pointer to one of these.
*/
typedef struct _t_ImageSelection
{
	PDPage page; // The page that holds the selection.
	ASFixedRect bounds; // Bounding rect of the currently selected image.
} ImageSelectionRec, *ImageSelection;

// Image selection/highlight methods. These methods are
// shared between the selection server and the AVTool.

ACCB1 void ACCB2 DrawImageSelection (AVPageView pageView, AVDevRect *updateRect, void *data);

#endif // !SELECTIONSERVER_H
