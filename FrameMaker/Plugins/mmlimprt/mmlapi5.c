/*************************************************************************
*
* ADOBE SYSTEMS INCORPORATED
* Copyright 1986 - 2005 Adobe Systems Incorporated
* All Rights Reserved.
*
* NOTICE: Adobe permits you to use, modify, and distribute this file in
* accordance with the terms of the Adobe license agreement accompanying it.
* If you have received this file from a source other than Adobe, then your
* use, modification, or distribution of it requires the prior written
* permission of Adobe.
**************************************************************************/
#include "fapi.h"
#include "mml.h"
#include "mmlproto.h"

/* --------------------------------------------------------------------------+
 | Inserts a marker of type markerType and text markerText at the current    |
 | insertion point. The current insertion point is specified by the global   |
 | variable insertionPoint. The document that contains the current insertion |
 | point is specified by the global variable docId. Sets insertionPoint to   |
 | after the marker.                                                         |
 +-------------------------------------------------------------------------- */

VoidT mmlAppendMarker(markerType,markerText)
IntT			markerType;
StringT			markerText;
{
	mmlInsertMarker(docId,insertionPoint,markerType,markerText);
	++insertionPoint.offset;
}

/* --------------------------------------------------------------------------+
 | Inserts a marker of type markerType and text markerText at the location   |
 | specified by insertionPoint in the document specified by docId.           |
 +-------------------------------------------------------------------------- */

VoidT mmlInsertMarker(docId,insertionPoint,markerType,markerText)
F_ObjHandleT	docId;
F_TextLocT      insertionPoint;
IntT			markerType;
StringT			markerText;
{
	IntT markerId = F_ApiNewAnchoredObject(docId,FO_Marker,&insertionPoint);
	F_ApiSetInt   (docId,markerId,FP_OldTypeNum,markerType);
	F_ApiSetString(docId,markerId,FP_OldTypeNum,markerText);
}

