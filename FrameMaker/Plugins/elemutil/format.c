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
#include "fstrings.h"
#include "fmemory.h"
#include "futils.h"

#include "elemutil.h"

/*
 * Apply_FormatInfo()
 *
 * Demonstrates how to wrap text in an element or insert a new element
 * then to manipulate an attribute value.
 */
VoidT Apply_FormatInfo(F_ObjHandleT docId, IntT command)
{
    F_ElementRangeT er;
    F_TextRangeT    tr;
    F_ObjHandleT    edefId, elemId;

    /* Get the text selection, if any. */
    tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
    if (tr.beg.objId == 0) {
        F_ApiAlert("Make a text selection and try again,", FF_ALERT_CONTINUE_NOTE);
        return;
    }
    else if (tr.beg.objId != tr.end.objId) {
        F_ApiAlert("Format applies to text range only.", FF_ALERT_CONTINUE_NOTE);
        return;
    }

    /* Get the "Emph" element definition then determine if the text selection
       is an insertion point or a text range. */
    edefId = F_ApiGetNamedObject(docId, FO_ElementDef, (StringT)"Emph");
    if (!edefId) {
        F_ApiAlert("\"Emph\" element definition not found.", FF_ALERT_CONTINUE_NOTE);
        return;
    }

	/* Wrap text selection in Emph element or insert new Emph element. */
    if (tr.beg.offset != tr.end.offset) {
        F_ApiWrapElement(docId, edefId);
        er = F_ApiGetElementRange(FV_SessionId, docId, FP_ElementSelection);
        /* We know that the wrapped element is selected and that "Emph" will
           be the beginning child element. */
        elemId = er.beg.childId;
		    /* Now, set the "Type" attribute value appropriately. */
    switch (command) {
        case BOLD :
            Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Bold");
            break;
        case UL :
            Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Ul");
            break;
        case ITAL :
            Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Ital");
            break;
    }
	return;
    }
    else {
		/* Insert new element. */
        elemId = F_ApiNewElement(docId, edefId, &tr.beg);
		    /* Now, set the "Type" attribute value appropriately. */
		switch (command) {
			case BOLD :
				Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Bold");
				break;
			case UL :
				Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Ul");
				break;
			case ITAL :
				Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Ital");
				break;
		}

		/* Put insertion point inside the new element. */
		tr = F_ApiGetTextRange(docId, elemId, FP_TextRange);
		tr.beg.offset++;

		F_ApiSetTextRange(FV_SessionId, docId, FP_TextSelection, &tr);
		return;
    }

    /* Now, set the "Type" attribute value appropriately. */
    switch (command) {
        case BOLD :
            Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Bold");
            break;
        case UL :
            Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Ul");
            break;
        case ITAL :
            Set_StringAttrVal(docId, elemId, (StringT)"Type", (StringT)"Ital");
            break;
    }
	return;
}

/*
 * Set_StringAttrVal()
 *
 */
VoidT Set_StringAttrVal(F_ObjHandleT docId, F_ObjHandleT elemId, StringT aname, StringT aval)
{
    F_AttributesT   attrs;
    UIntT           i;

    attrs = F_ApiGetAttributes(docId, elemId);

    for (i=0; i < attrs.len; i++) {
        if (F_StrIEqual(attrs.val[i].name, aname)) {
            /* First, if the attribute is already set then we need to free
               it's previous value. */
            if (attrs.val[i].values.len == 1) {
                F_Free(attrs.val[i].values.val[0]);
            }

            /* Now, we allocate a new value. */
            attrs.val[i].values.len = 1;
            attrs.val[i].values.val = (StringT *)F_Alloc(sizeof(StringT), NO_DSE);

            if (attrs.val == NULL) {
                F_Printf(NULL, (StringT)"Unable to allocate memory.\n");
                break;
            }
            /* And finally, set the new value. */
            attrs.val[i].values.val[0] = F_StrCopyString(aval);
            F_ApiSetAttributes(docId, elemId, &attrs);
            break;
        }
    }
    F_ApiDeallocateAttributes(&attrs);
}

