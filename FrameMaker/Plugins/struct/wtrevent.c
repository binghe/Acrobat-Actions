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

#include "fm_sgml.h"

/*
 * Sample event handler for structure Writer
 */

SrwErrorT Sw_EventHandler(eventp, swObj)
SwEventT *eventp;
SwConvObjT swObj;
{
	return (Sw_Convert(eventp, swObj));
}

