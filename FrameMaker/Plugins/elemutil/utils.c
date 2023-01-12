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
#include "utils.h"

/*
 * U_GetHighestElemId()
 *
 */
F_ObjHandleT U_GetHighestElemId(F_ObjHandleT docId)
{
    F_TextRangeT    tr;
    F_ObjHandleT    tframeId, flowId, highestElemId;

    tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
    if (tr.beg.objId) {
        tframeId = F_ApiGetId(docId, tr.beg.objId, FP_InTextFrame);
        flowId = F_ApiGetId(docId, tframeId, FP_Flow);
    }
    else
        flowId = F_ApiGetId(FV_SessionId, docId, FP_MainFlowInDoc);

    highestElemId = F_ApiGetId(docId, flowId, FP_HighestLevelElement);

    return (highestElemId);
}

/*
 * U_GetElementName()
 *
 */
StringT U_GetElementName(F_ObjHandleT docId, F_ObjHandleT elemId)
{
	F_ObjHandleT	edefId;
	StringT			ename;

	edefId = F_ApiGetId(docId, elemId, FP_ElementDef);
	ename = F_ApiGetString(docId, edefId, FP_Name);
	return (ename);
}

