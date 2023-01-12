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
#include "fdk_env.h"

#ifndef MACINTOSH
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#endif

#include "fapi.h"
#include "futils.h"
#include "cutils.h"
#include "fencode.h"

IntT CountWordsInDoc FARGS((F_ObjHandleT docId));

#define SprintfInt(tostr, initstr, num)		F_Sprintf(tostr, initstr, num)
