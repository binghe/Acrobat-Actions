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
 | Inserts a new paragraph after the current paragraph. The current paragraph|
 | is specified by the objId field of the global variable insertionPoint.    |
 | Gives the new paragraph the properties specified by the global variable   |
 | par_state. Sets insertionPoint to the beginning of the new paragraph.     |
 +-------------------------------------------------------------------------- */

VoidT mmlAppendParagraph()
{
	F_TabsT       *paragraphTabs;
	F_ObjHandleT  paragraphId;

	mmlParRecordToPropVals(&pgfIndexCache, &pgfIndexCacheInitialized,
						   &par_state, &paragraphProperties);

	paragraphTabs = mmlTabStringToFTabs(hash[par_state.tabstops].name);

	paragraphId   = mmlCreateParagraph(docId,insertionPoint.objId,
									   &paragraphProperties,paragraphTabs);

	mmlFreeFTabs(paragraphTabs);

	insertionPoint.objId  = paragraphId;
	insertionPoint.offset = 0;
}


/* --------------------------------------------------------------------------+
 | Inserts a new paragraph with properties specified by paragraphProperties  |
 | and tab stops specified by paragraphTabs in the document specified by     |
 | docId, after the paragraph specified by prevParagraphId.                  |
 +-------------------------------------------------------------------------- */

F_ObjHandleT mmlCreateParagraph(docId,prevParagraphId,
								paragraphProperties,paragraphTabs)
F_ObjHandleT	docId;
F_ObjHandleT	prevParagraphId;
F_PropValsT		*paragraphProperties;
F_TabsT			*paragraphTabs;
{
	F_ObjHandleT paragraphId;

	paragraphId = F_ApiNewSeriesObject(docId,FO_Pgf,prevParagraphId);

	F_ApiSetProps(docId,paragraphId,paragraphProperties);

	F_ApiSetTabs(docId,paragraphId,FP_Tabs,paragraphTabs);

	return paragraphId;
}

/* --------------------------------------------------------------------------+
 | Sets the values in the property list propVals to the values specified by  |
 | the paragraph record parRecord.                                           |
 |                                                                           |
 | Calls mmlInitializePgfIndexCache to obtain the indexes of the properties  |
 | in the property value list if they are not already cached.                |
 +-------------------------------------------------------------------------- */

VoidT mmlParRecordToPropVals(pgfIndexCache,pgfIndexCacheInitialized,
							 parRecord,propVals)
mmlPgfIndexCacheT 	*pgfIndexCache;
BoolT				*pgfIndexCacheInitialized;
ParRecordT			*parRecord;
F_PropValsT			*propVals;
{
	FontRecordT		*fontRecord = &(parRecord->parafont);

	if (!(*pgfIndexCacheInitialized)) {
		mmlInitializePgfIndexCache(pgfIndexCache,propVals);
		*pgfIndexCacheInitialized = True;
	}

	PROPVAL(propVals,pgfIndexCache->Name,sval)			=
		F_StrCopyString(parRecord->partag);

	switch (parRecord->alignment) {
	case LEFT:
		PROPVAL(propVals,pgfIndexCache->Alignment,ival) = FV_PGF_LEFT;
		break;
	case RIGHT:
		PROPVAL(propVals,pgfIndexCache->Alignment,ival) = FV_PGF_RIGHT;
		break;
	case CENTER:
		PROPVAL(propVals,pgfIndexCache->Alignment,ival) = FV_PGF_CENTER;
		break;
	case LEFTRIGHT:
		PROPVAL(propVals,pgfIndexCache->Alignment,ival) = FV_PGF_JUSTIFIED;
		break;
	}

	PROPVAL(propVals,pgfIndexCache->FirstIndent,ival)	=
		mmlMeasureToMetric(parRecord->firstindent);

	PROPVAL(propVals,pgfIndexCache->LeftIndent,ival)	=
		mmlMeasureToMetric(parRecord->leftindent);

	PROPVAL(propVals,pgfIndexCache->RightIndent,ival)	=
		mmlMeasureToMetric(parRecord->rightindent);

	PROPVAL(propVals,pgfIndexCache->SpaceAbove,ival)	=
		mmlMeasureToMetric(parRecord->spacebefore);

	PROPVAL(propVals,pgfIndexCache->SpaceBelow,ival)	=
		mmlMeasureToMetric(parRecord->spaceafter);

	PROPVAL(propVals,pgfIndexCache->Leading,ival)		=
		mmlMeasureToMetric(parRecord->leading);

	PROPVAL(propVals,pgfIndexCache->AutoNum,ival)		= 
		parRecord->autonumber;

	mmlMapAutoNumberString(parRecord->numberformat,
						   &PROPVAL(propVals,pgfIndexCache->AutoNumString,sval));

	PROPVAL(propVals,pgfIndexCache->Hyphenate,ival)		= 
		parRecord->hyphenate;

	PROPVAL(propVals,pgfIndexCache->Start,ival)			= 
		parRecord->columntop ? FV_PGF_TOP_OF_COL : FV_PGF_ANYWHERE;

	PROPVAL(propVals,pgfIndexCache->KeepWithNext,ival)	= 
		parRecord->withnext;

	PROPVAL(propVals,pgfIndexCache->AdjHyphens,ival)	= 
		parRecord->tolerance;

	PROPVAL(propVals,pgfIndexCache->BlockLines,ival)	= 
		parRecord->blocksize;

	PROPVAL(propVals,pgfIndexCache->FontFamily,ival)	= 
		mmlMapFontFamily(fontRecord->family);

	PROPVAL(propVals,pgfIndexCache->FontSize,ival)		= 
		POINTTOMETRIC(fontRecord->pts);

	PROPVAL(propVals,pgfIndexCache->FontAngle,ival)		= 
		mmlMapFontAngle(fontRecord->italic);

	PROPVAL(propVals,pgfIndexCache->FontWeight,ival)	= 
		mmlMapFontWeight(fontRecord->bold);

	PROPVAL(propVals,pgfIndexCache->Underline,ival)		= 
		fontRecord->underline ? FV_CB_SINGLE_UNDERLINE : FV_CB_NO_UNDERLINE;

	PROPVAL(propVals,pgfIndexCache->StrikeOut,ival)		= 
		fontRecord->strike;

	switch (fontRecord->script) {
	case SUB:
		PROPVAL(propVals,pgfIndexCache->Position,ival) = FV_POS_SUB;
		break;
	case NORM:
		PROPVAL(propVals,pgfIndexCache->Position,ival) = FV_POS_NORM;
		break;
	case SUP:
		PROPVAL(propVals,pgfIndexCache->Position,ival) = FV_POS_SUPER;
		break;
	}
}

/* --------------------------------------------------------------------------+
 | Sets the values in the paragraph record parRecord to the values specified |
 | by the property list propVals.                                            |
 |                                                                           |
 | Calls mmlInitializePgfIndexCache to obtain the indexes of the properties  |
 | in the property value list if they are not already cached.                |
 +-------------------------------------------------------------------------- */

VoidT mmlPropValsToParRecord(pgfIndexCache,pgfIndexCacheInitialized,
							 propVals,parRecord)
mmlPgfIndexCacheT 	*pgfIndexCache;
BoolT				*pgfIndexCacheInitialized;
F_PropValsT			*propVals;
ParRecordT			*parRecord;
{
	FontRecordT		*fontRecord = &(parRecord->parafont);

	if (!(*pgfIndexCacheInitialized)) {
		mmlInitializePgfIndexCache(pgfIndexCache,propVals);
		*pgfIndexCacheInitialized = True;
	}

	parRecord->partag =
		F_StrCopyString(PROPVAL(propVals,pgfIndexCache->Name,sval));

	switch (PROPVAL(propVals,pgfIndexCache->Alignment,ival)) {
	case FV_PGF_LEFT:
		parRecord->alignment = LEFT;
		break;
	case FV_PGF_RIGHT :
		parRecord->alignment = RIGHT;
		break;
	case FV_PGF_CENTER:
		parRecord->alignment = CENTER;
		break;
	case FV_PGF_JUSTIFIED:
		parRecord->alignment = LEFTRIGHT;
		break;
	}

	parRecord->firstindent = 
		mmlMetricToMeasure(PROPVAL(propVals,pgfIndexCache->FirstIndent,ival));

	parRecord->leftindent =
		mmlMetricToMeasure(PROPVAL(propVals,pgfIndexCache->LeftIndent,ival));

	parRecord->rightindent =
		mmlMetricToMeasure(PROPVAL(propVals,pgfIndexCache->RightIndent,ival));

	parRecord->spacebefore = 
		mmlMetricToMeasure(PROPVAL(propVals,pgfIndexCache->SpaceAbove,ival));
		
	parRecord->spaceafter =
		mmlMetricToMeasure(PROPVAL(propVals,pgfIndexCache->SpaceBelow,ival));

	parRecord->leading =
		mmlMetricToMeasure(PROPVAL(propVals,pgfIndexCache->Leading,ival));

	parRecord->autonumber =
		PROPVAL(propVals,pgfIndexCache->AutoNum,ival);

	mmlUnMapAutoNumberString(&(parRecord->numberformat),
							 PROPVAL(propVals,pgfIndexCache->AutoNumString,sval));

	parRecord->hyphenate =
		PROPVAL(propVals,pgfIndexCache->Hyphenate,ival);

	parRecord->columntop =
		PROPVAL(propVals,pgfIndexCache->Start,ival) != FV_PGF_ANYWHERE;

	parRecord->withnext =
		PROPVAL(propVals,pgfIndexCache->KeepWithNext,ival);

	parRecord->tolerance =
		PROPVAL(propVals,pgfIndexCache->AdjHyphens,ival);

	parRecord->blocksize =
		PROPVAL(propVals,pgfIndexCache->BlockLines,ival);

	fontRecord->family =
		mmlUnMapFontFamily(PROPVAL(propVals,pgfIndexCache->FontFamily,ival));

	fontRecord->pts =
		METRICTOPOINT(PROPVAL(propVals,pgfIndexCache->FontSize,ival));

	fontRecord->italic =
		mmlUnMapFontAngle(PROPVAL(propVals,pgfIndexCache->FontAngle,ival));

	fontRecord->bold =
		mmlUnMapFontWeight(PROPVAL(propVals,pgfIndexCache->FontWeight,ival));

	fontRecord->underline =
		PROPVAL(propVals,pgfIndexCache->Underline,ival) !=  FV_CB_NO_UNDERLINE;

	fontRecord->strike =
		PROPVAL(propVals,pgfIndexCache->StrikeOut,ival);

	switch (PROPVAL(propVals,pgfIndexCache->Position,ival)) {
	case FV_POS_SUB:
		fontRecord->script = SUB;
		break;
	case FV_POS_NORM :
		fontRecord->script = NORM;
		break;
	case FV_POS_SUPER:
		fontRecord->script = SUP;
		break;
	}
}

/* --------------------------------------------------------------------------+
 | Caches the property value list indexes of the properties of an FO_Pgf     |
 | object that correspond to the fields of a ParRecordT.                     |
 |                                                                           |
 | To set a property value, you need to get its index in the property list.  |
 | A particular value, (e.g. FP_Name), will have the same index in all       |
 | property lists that refer to the same type of object, (e.g. FO_Pgf).      |
 | Thus the indexes obtained for one instance of a FO_Pgf property list may  |
 | be cached and re-used with subsequent instances of a FO_Pgf property list.|
 | They may not, however, be re-used with an instance of a property list of  |
 | another type of object, (e.g. FO_PgfFmt), even if that type of object has |
 | the same set of properties.                                               |
 +-------------------------------------------------------------------------- */

VoidT mmlInitializePgfIndexCache(pgfIndexCache,propVals)
mmlPgfIndexCacheT 	*pgfIndexCache;
F_PropValsT			*propVals;
{
	pgfIndexCache->Name			= F_ApiGetPropIndex(propVals,FP_Name);
	pgfIndexCache->Alignment	= F_ApiGetPropIndex(propVals,FP_PgfAlignment);
	pgfIndexCache->FirstIndent	= F_ApiGetPropIndex(propVals,FP_FirstIndent);
	pgfIndexCache->LeftIndent	= F_ApiGetPropIndex(propVals,FP_LeftIndent);
	pgfIndexCache->RightIndent	= F_ApiGetPropIndex(propVals,FP_RightIndent);
	pgfIndexCache->SpaceAbove	= F_ApiGetPropIndex(propVals,FP_SpaceAbove);
	pgfIndexCache->SpaceBelow	= F_ApiGetPropIndex(propVals,FP_SpaceBelow);
	pgfIndexCache->Leading		= F_ApiGetPropIndex(propVals,FP_Leading);
	pgfIndexCache->AutoNum		= F_ApiGetPropIndex(propVals,FP_PgfIsAutoNum);
	pgfIndexCache->AutoNumString= F_ApiGetPropIndex(propVals,FP_AutoNumString);
	pgfIndexCache->Hyphenate	= F_ApiGetPropIndex(propVals,FP_Hyphenate);
	pgfIndexCache->Start		= F_ApiGetPropIndex(propVals,FP_Start);
	pgfIndexCache->KeepWithNext	= F_ApiGetPropIndex(propVals,FP_KeepWithNext);
	pgfIndexCache->AdjHyphens	= F_ApiGetPropIndex(propVals,FP_AdjHyphens);
	pgfIndexCache->BlockLines	= F_ApiGetPropIndex(propVals,FP_BlockLines);
	pgfIndexCache->FontFamily	= F_ApiGetPropIndex(propVals,FP_FontFamily);
	pgfIndexCache->FontSize		= F_ApiGetPropIndex(propVals,FP_FontSize);
	pgfIndexCache->FontAngle	= F_ApiGetPropIndex(propVals,FP_FontAngle);
	pgfIndexCache->FontWeight	= F_ApiGetPropIndex(propVals,FP_FontWeight);
	pgfIndexCache->Underline	= F_ApiGetPropIndex(propVals,FP_Underlining);
	pgfIndexCache->StrikeOut	= F_ApiGetPropIndex(propVals,FP_Strikethrough);
	pgfIndexCache->Position		= F_ApiGetPropIndex(propVals,FP_Position);
}
