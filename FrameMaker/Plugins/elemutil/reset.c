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
#include "fdetypes.h"
#include "fmemory.h"

#include "elemutil.h"

/*
 * Reset_AttributeValues()
 *
 * Traverse the structure tree, resetting the attribute values for
 * each element.
 */
VoidT Reset_AttributeValues(F_ObjHandleT docId, F_ObjHandleT elemId)
{
    F_ObjHandleT    childId;

    DoResetAttrVals(docId, elemId);
    childId = F_ApiGetId(docId, elemId, FP_FirstChildElement);
    while (childId) {
        Reset_AttributeValues(docId, childId);
        childId = F_ApiGetId(docId, childId, FP_NextSiblingElement);
    }
}

/*
 * DoResetAttrVals()
 */
VoidT DoResetAttrVals(F_ObjHandleT docId, F_ObjHandleT elemId)
{
    F_AttributesT   attrs;
    UIntT           i, j;

    attrs = F_ApiGetAttributes(docId, elemId);
    for (i=0; i < attrs.len; i++) {
        for (j=0; j < attrs.val[i].values.len; j++) {
            F_Free(attrs.val[i].values.val[j]);
            attrs.val[i].values.val[j] = (StringT)NULL;
        }
        attrs.val[i].values.len = 0;
    }
    F_ApiSetAttributes(docId, elemId, &attrs);
    F_ApiDeallocateAttributes(&attrs);
}

