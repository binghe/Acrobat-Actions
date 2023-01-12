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

#ifndef __UTILS_H__
#define __UTILS_H__
 
F_ObjHandleT U_GetHighestElemId(F_ObjHandleT docId);
StringT U_GetElementName(F_ObjHandleT docId, F_ObjHandleT elemId);
#endif	/* __UTILS_H__ */
