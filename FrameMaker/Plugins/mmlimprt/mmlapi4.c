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

/* --------------------------------------------------------------------------+
 | Inserts the string text at the current insertion point using the current  |
 | character format.  The current insertion point is specified by the global |
 | variable insertionPoint. The document that contains the current insertion |
 | point is specified by the global variable docId. The current character    |
 | format is specified by the global variable font_state. Sets insertionPoint|
 | to the end of the inserted text.                                          |
 +-------------------------------------------------------------------------- */

VoidT mmlAppendText(text)
StringT			text;
{
	mmlFontRecordToPropVals(&fontIndexCache,&fontIndexCacheInitialized,
							&font_state,&characterProperties);

	mmlInsertText(docId,insertionPoint,text,&characterProperties);

	insertionPoint.offset += F_StrLen(text);
}

/* --------------------------------------------------------------------------+
 | Inserts the string text with properties specified by characterProperties  |
 | at the location specified by insertion point in the document specified by |
 | docId.                                                                    |
 +-------------------------------------------------------------------------- */

VoidT mmlInsertText(docId,insertionPoint,text,characterProperties)
F_ObjHandleT	docId;
F_TextLocT      insertionPoint;
StringT			text;
F_PropValsT		*characterProperties;
{
	F_TextRangeT insertionRange;

	insertionRange = mmlLocAndLenToRange(insertionPoint,F_StrLen(text));
	F_ApiAddText(docId,&insertionPoint,text);
	F_ApiSetTextProps(docId,&insertionRange,characterProperties);
} 

/* -------------------------------------------------------------------------+
 | Returns a text range that begins at location loc and is of length len.   |
 |                                                                          |
 | This function works only if the entire text range is contained within    |
 | a single paragraph.                                                      |
 +------------------------------------------------------------------------- */

F_TextRangeT mmlLocAndLenToRange(loc,len)
F_TextLocT	loc;
IntT		len;
{
		F_TextRangeT	textRange;
		textRange.beg.objId  = loc.objId;
		textRange.beg.offset = loc.offset;
		textRange.end.objId  = loc.objId;
		textRange.end.offset = loc.offset + len;
		return textRange;
}

/* --------------------------------------------------------------------------+
 | Sets the values in the property list propVals to the values specified by  |
 | the font record fontRecord.                                               |
 |                                                                           |
 | Calls mmlInitializeFontIndexCache to obtain the indexes of the properties |
 | in the property value list if they are not already cached.                |
 +-------------------------------------------------------------------------- */

VoidT mmlFontRecordToPropVals(fontIndexCache,fontIndexCacheInitialized,
							  fontRecord,propVals)
mmlFontIndexCacheT	*fontIndexCache;
BoolT				*fontIndexCacheInitialized;
FontRecordT			*fontRecord;
F_PropValsT			*propVals;
{
	if (!(*fontIndexCacheInitialized)) {
		mmlInitializeFontIndexCache(fontIndexCache,propVals);
		*fontIndexCacheInitialized = True;
	}


	PROPVAL(propVals,fontIndexCache->FontFamily,ival)    = 
		mmlMapFontFamily(fontRecord->family);

	PROPVAL(propVals,fontIndexCache->FontSize,ival)      = 
		POINTTOMETRIC(fontRecord->pts);

	PROPVAL(propVals,fontIndexCache->FontAngle,ival)     = 
		mmlMapFontAngle(fontRecord->italic);

	PROPVAL(propVals,fontIndexCache->FontWeight,ival)    = 
		mmlMapFontWeight(fontRecord->bold);

	PROPVAL(propVals,fontIndexCache->Underline,ival)     = 
		fontRecord->underline ? FV_CB_SINGLE_UNDERLINE : FV_CB_NO_UNDERLINE;

	PROPVAL(propVals,fontIndexCache->StrikeOut,ival)     = 
		fontRecord->strike;

	switch (fontRecord->script) {
	case SUB:
		PROPVAL(propVals,fontIndexCache->Position,ival) = FV_POS_SUB;
		break;
	case NORM:
		PROPVAL(propVals,fontIndexCache->Position,ival) = FV_POS_NORM;
		break;
	case SUP:
		PROPVAL(propVals,fontIndexCache->Position,ival) = FV_POS_SUPER;
		break;
	}
}

/* --------------------------------------------------------------------------+
 | Caches the property value list indexes of the properties of text that     |
 | correspond to the fields of a FontRecordT.                                |
 |                                                                           |
 | To set a property value, you need to get its index in the property list.  |
 | A particular value, (e.g. FP_FontFamily), will have the same index in all |
 | property lists that refer to the same type of object, (e.g. text).        |
 | Thus the indexes obtained for one instance of a text property list may    |
 | be cached and re-used with subsequent instances of a text property list.  |
 | They may not, however, be re-used with an instance of a property list of  |
 | another type of object, (e.g. FO_PgfFmt), even if that type of object has |
 | a superset of the properties of text.                                     |
 +-------------------------------------------------------------------------- */

VoidT mmlInitializeFontIndexCache(fontIndexCache,propVals)
mmlFontIndexCacheT	*fontIndexCache;
F_PropValsT			*propVals;
{
	fontIndexCache->FontFamily	= F_ApiGetPropIndex(propVals,FP_FontFamily);
	fontIndexCache->FontSize	= F_ApiGetPropIndex(propVals,FP_FontSize);
	fontIndexCache->FontAngle	= F_ApiGetPropIndex(propVals,FP_FontAngle);
	fontIndexCache->FontWeight	= F_ApiGetPropIndex(propVals,FP_FontWeight);
	fontIndexCache->Underline	= F_ApiGetPropIndex(propVals,FP_Underlining);
	fontIndexCache->StrikeOut	= F_ApiGetPropIndex(propVals,FP_Strikethrough);
	fontIndexCache->Position	= F_ApiGetPropIndex(propVals,FP_Position);
}
