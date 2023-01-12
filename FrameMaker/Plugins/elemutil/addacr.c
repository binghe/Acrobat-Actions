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

/* Global variable - from eumain.c */
extern F_ObjHandleT	dlgId;

/*
 * Add_AcronymToList()
 *
 */
VoidT Add_AcronymToList(F_ObjHandleT docId)
{
	F_ObjHandleT	itemId;

    dlgId = F_ApiOpenResource(FO_DialogResource, (StringT)"addacr");
    if (dlgId) {
		itemId = F_ApiDialogItemId(dlgId, DLGITEM_ACR);
		F_ApiSetString(dlgId, itemId, FP_Text, (StringT)"");
		itemId = F_ApiDialogItemId(dlgId, DLGITEM_DEFN);
		F_ApiSetString(dlgId, itemId, FP_Text, (StringT)"");
        F_ApiModalDialog(DLG_ADDACR, dlgId);
    }
}

/*
 * FindAcrList()
 *
 * Finds the AcronymList element so that we can add the new acronym/defn
 * to it in alphabetical order.
 */
F_ObjHandleT FindAcrList(F_ObjHandleT docId, F_ObjHandleT elemId)
{
    static F_ObjHandleT acrlistId = 0;
    F_ObjHandleT        childId;
    StringT             ename;

    ename = U_GetElementName(docId, elemId);
    if (F_StrEqual(ename, (StringT)"AcronymList"))
        acrlistId = elemId;
    F_Free(ename);

    childId = F_ApiGetId(docId, elemId, FP_FirstChildElement);
    while (childId) {
        FindAcrList(docId, childId);
        childId = F_ApiGetId(docId, childId, FP_NextSiblingElement);
    }
    return (acrlistId);
}

/*
 * AddAcrToList()
 *
 * Adds the acronym/defn in alpha order to the acronym list.
 */
VoidT AddAcrToList(F_ObjHandleT docId, F_ObjHandleT listId, StringT acronym, StringT defn)
{
    F_ObjHandleT    childId;
    StringT         ename, etext;

	/* Traverse the children until we find the acronym this new one 
	   should be inserted before.  At this point we add the acronym and quit 
	   traversing. */
    childId = F_ApiGetId(docId, listId, FP_FirstChildElement);
    while (childId) {
        ename = U_GetElementName(docId, childId);
        if (F_StrEqual(ename, (StringT)"Acronym")) {
            etext = GetElementText(docId, childId);
            if (F_StrICmp(acronym, etext) < 0) {
				DoAdd(docId, listId, childId, acronym, defn);
                F_Free(ename);
                F_Free(etext);
                break;
            }
            F_Free(etext);
        }
        F_Free(ename);
        childId = F_ApiGetId(docId, childId, FP_NextSiblingElement);
    }

	/* If we didn't find a place for the new acronym add it to end of list. */ 
    if (!childId) {
		DoAdd(docId, listId, childId, acronym, defn);
    }
}

/*
 * GetElementText
 *
 * This function returns the entire text of the specified element.
 * Called so that we can compare to the text of the new acronym being added
 * to the list.
 */
StringT GetElementText(F_ObjHandleT docId, F_ObjHandleT elemId)
{
    F_TextItemsT    tis;
    StringT         tstr, cp;
    IntT            i;

    tstr = (StringT)F_Calloc(1, sizeof(UCharT), NO_DSE);
    tstr[0] = '\0';

    tis = F_ApiGetText(docId, elemId, FTI_String);
    if (tis.len == 0) return NULL;

    for (i = 0; i < (IntT) tis.len; i++) {
        cp = F_StrCopyString(tis.val[i].u.sdata);
        tstr = (StringT)F_Realloc(tstr, F_StrLen(tstr)+F_StrLen(cp)+2, NO_DSE);
        F_StrCat(tstr, cp);
        F_Free(cp);
    }
    F_ApiDeallocateTextItems(&tis);

    /* Strip forced returns and convert tabs to spaces. */
    F_StrStrip(tstr, (StringT)"\x09");
    for (i=0; i < F_StrLen(tstr); i++)
        if (tstr[i] == '\x08')
            tstr[i] = ' ';

    return tstr;
}

/*
 * DoAdd()
 *
 */
VoidT DoAdd(F_ObjHandleT docId, F_ObjHandleT listId, F_ObjHandleT childId, StringT acronym, StringT defn)
{
    F_ObjHandleT    elemId, edefId;
    F_ElementLocT   el;
    F_TextRangeT    tr;

	/* Initialize the element location. This element location will cause the new
	   element to be inserted *before* the specified childId. */
    el.parentId = listId;
    el.childId = childId;
    el.offset = 0;

	/* Get the element definition for Acronym and add at the element loc. */
    edefId = F_ApiGetNamedObject(docId, FO_ElementDef, (StringT)"Acronym");
    elemId = F_ApiNewElementInHierarchy(docId, edefId, &el);

	/* Get text range of newly inserted element, increment text range
	   offset past the begin element and add the element text. */
    tr = F_ApiGetTextRange(docId, elemId, FP_TextRange);
    tr.beg.offset++;
    F_ApiAddText(docId, &tr.beg, acronym);

	/* Get the element definition for Defn and add at the element loc. */
    edefId = F_ApiGetNamedObject(docId, FO_ElementDef, (StringT)"Defn");
    elemId = F_ApiNewElementInHierarchy(docId, edefId, &el);

	/* Get text range of newly inserted element, increment text range
	   offset past the begin element and add the element text. */
    tr = F_ApiGetTextRange(docId, elemId, FP_TextRange);
    tr.beg.offset++;
    F_ApiAddText(docId, &tr.beg, defn);
}

