/*************************************************************************
*
* ADOBE SYSTEMS INCORPORATED
* Copyright 1986 - 2005 Adobe Systems Incorporated
* All Rights Reserved.
*
* NOTICE: Adobe permits you to use, modify, and distribute this file in
* accordance with the terms of the Adobe license agreement accompanying it.
* If you have received this file from a source other than Adobe, then your 
* use, modification, or distribution of it requires the prior written 
* permission of Adobe.
**************************************************************************/
#include "fapi.h"
#include "fstrings.h"
#include "mml.h"
#include "mmlproto.h"


F_ObjHandleT		docId;
F_ObjHandleT		firstParagraphId;
F_TextLocT      	insertionPoint;
F_PropValsT			paragraphProperties;
F_PropValsT			characterProperties;
F_PropValsT			headerFooterCharProperties;
mmlFontIndexCacheT	fontIndexCache;
BoolT				fontIndexCacheInitialized	= False;
mmlPgfIndexCacheT	pgfFmtIndexCache;
BoolT				pgfFmtIndexCacheInitialized	= False;
mmlPgfIndexCacheT	pgfIndexCache;
BoolT				pgfIndexCacheInitialized	= False;


