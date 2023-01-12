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

#ifndef ELEMUTIL_H
#define ELEMUTIL_H

#define COLLAPSE_ALL    1
#define EXPAND_ALL      2

#define BOLD            4
#define UL              5
#define ITAL            6

#define ADD_ACRONYM     7
#define RESET_ATTR      8

#define DLG_ADDACR      1
#define DLGITEM_ACR     2
#define DLGITEM_DEFN    4
#define DLGITEM_OK      6
#define DLGITEM_CANCEL  7

F_ObjHandleT U_GetHighestElemId FARGS((F_ObjHandleT docId));
StringT U_GetElementName FARGS((F_ObjHandleT docId, F_ObjHandleT elemId));
VoidT Apply_FormatInfo FARGS((F_ObjHandleT docId, IntT command));
VoidT Set_StringAttrVal FARGS((F_ObjHandleT docId, F_ObjHandleT elemId, StringT aname, StringT aval));
VoidT Collapse_Structure FARGS((F_ObjHandleT docId, F_ObjHandleT elemId, BoolT command));
VoidT Reset_AttributeValues FARGS((F_ObjHandleT docId, F_ObjHandleT elemId));
VoidT DoResetAttrVals FARGS((F_ObjHandleT docId, F_ObjHandleT elemId));
VoidT Add_AcronymToList FARGS((F_ObjHandleT docId));
F_ObjHandleT FindAcrList FARGS((F_ObjHandleT docId, F_ObjHandleT elemId));
VoidT AddAcrToList FARGS((F_ObjHandleT docId, F_ObjHandleT listId, StringT acronym, StringT def));
StringT GetElementText FARGS((F_ObjHandleT docId, F_ObjHandleT elemId));
VoidT DoAdd FARGS((F_ObjHandleT docId, F_ObjHandleT listId, F_ObjHandleT childId, StringT acronym, StringT defn));
#endif /* ELEMUTIL_H */
