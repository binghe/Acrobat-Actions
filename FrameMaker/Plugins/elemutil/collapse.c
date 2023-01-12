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
 *********************************************************************/

#include "fapi.h"
#include "elemutil.h"

/*
 * Collapse_Structure()
 *
 * Recursive function to collapse/expand each element in the tree.
 */
VoidT Collapse_Structure(F_ObjHandleT docId, F_ObjHandleT elemId, BoolT command)
{
    F_ObjHandleT    childId;

    F_ApiSetInt(docId, elemId, FP_ElementIsCollapsed, command);
    childId = F_ApiGetId(docId, elemId, FP_FirstChildElement);
    while (childId) {
        Collapse_Structure(docId, childId, command);
        childId = F_ApiGetId(docId, childId, FP_NextSiblingElement);
    }
}
