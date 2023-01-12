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
 * Program Name:
 *	    reverse
 *
*********************************************************************/

#include "fm_struct.h"
#include "fdetypes.h"
#include "fmemory.h"
#include "fstrings.h"

BoolT processingFirst;

SrwErrorT Sw_EventHandler(eventp, swObj)
     SwEventT *eventp;
     SwConvObjT swObj;
{
  StringT defName;
  SwConvObjT docObj;
  F_ObjHandleT docId;
  F_ObjHandleT firstElementId, lastElementId;
  F_ObjHandleT parentId;
  F_ObjHandleT defId;
  SrwErrorT err;
  
  switch (eventp->evtype) {
  case SW_EVT_BEGIN_ELEM:
    docObj = Sw_GetCurConvObjOfType(SW_OBJ_DOC);
    docId = Sw_GetDocId(docObj);
    parentId = eventp->fm_elemid;
    defId = F_ApiGetId(docId, parentId, FP_ElementDef);
    defName = F_ApiGetString(docId, defId, FP_Name);
    
    /* When element Name is found, tell translator not to process
     * its children. Then, call Sw_ScanElem() to process in
     * desired order 
     */
    if (F_StrIEqual(defName, (StringT) "Name")) {    
      F_Free(defName);
      err = Sw_SetProcessingFlags(swObj, SRW_DROP_ELEMENT_CONTENT);
      Sw_Convert(eventp, swObj);
      firstElementId = F_ApiGetId(docId, parentId, FP_FirstChildElement); 
      lastElementId = F_ApiGetId(docId, firstElementId, 
                                 FP_NextSiblingElement);
      
      err = Sw_ScanElem(docId, lastElementId);
      err = Sw_ScanElem(docId, firstElementId);
      
      return (0);
    }
    F_Free(defName);
  }
  return (Sw_Convert(eventp, swObj));
}
