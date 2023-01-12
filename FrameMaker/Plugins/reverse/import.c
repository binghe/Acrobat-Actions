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
#include "fstrings.h"
#include "futils.h"
#include "fmemory.h"
#include "fstrlist.h"

#define MAXSTRING 255

F_ObjHandleT docId; /* document being translated */
SrInsertLocT insertLoc; /* insert location at start of element Last */

SrwErrorT Sr_EventHandler(eventp, srObj)
     SrEventT *eventp;
     SrConvObjT srObj;
{
  SrwErrorT err;
  F_ObjHandleT lastNameId, parentId;
  
  switch (eventp->evtype) {
    
    /* Save Id of document beging translated as global */
  case SR_EVT_BEGIN_DOC:
    Sr_Convert(eventp, srObj);
    docId = Sr_GetDocId(srObj);    
    return(0);
    break;
    
    /* If this is the element Last, convert it.
     * Get the Id of element created.
     * Get insertion location just before this element.
     */
  case SR_EVT_END_ELEM:
    if (F_StrIEqual((StringT) "Last", eventp->u.tag.gi)) {
      Sr_Convert(eventp, srObj);
      lastNameId = Sr_GetFmElemId(srObj);
      if (!lastNameId) {
        F_Printf(NULL, (StringT) "Cannot get Last's parent element id\n");
        return(0);
      }
      parentId = F_ApiGetId(docId, lastNameId, FP_ParentElement);
      insertLoc.pos = SR_LOC_ELEMENT;
      insertLoc.u.elemLoc.parentId = parentId;
      insertLoc.u.elemLoc.childId = lastNameId;
      insertLoc.u.elemLoc.offset = 0;
      return(0);
    }
    break;
    
    /* If this is element First, set insertion point to 
     * location previously saved. Then convert the element.
     */
  case SR_EVT_BEGIN_ELEM: 
    if (F_StrIEqual((StringT) "First", eventp->u.tag.gi))
      err = Sr_SetInsertLoc(srObj, &insertLoc);
    break;
    
  default:
    break;
  }
  return(Sr_Convert(eventp, srObj));
}

