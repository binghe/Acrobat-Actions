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
 | mmlDeleteAllParFormats deletes all of the paragraph formats in the        |
 | paragraph catalog of the document specified by docId.                     |
 +-------------------------------------------------------------------------- */

VoidT mmlDeleteAllParFormats(docId)
F_ObjHandleT	docId;
{
	F_ObjHandleT parFormatId;

	while (parFormatId = F_ApiGetId(FV_SessionId,docId,FP_FirstPgfFmtInDoc)) {
		F_ApiDelete(docId,parFormatId);
	}
}

/* --------------------------------------------------------------------------+
 | mmlAddAllParFormats adds to the paragraph catalog all the paragraph       |
 | formats in the global hash table hash that were defined in the mml file   |
 | by <!DefinePar > statements. These paragraph formats are distinguished in |
 | the hash table by a type == PAR_DEF. Paragraph formats that were obtained |
 | from an importing document via <!DefineTag > statements have a type ==    |
 | PAR_REF. These paragraph formats are not added back to the importing      |
 | document. If they were, information could be lost. This is because the    |
 | ParRecordT type stores only the subset of the paragraph format supported  |
 | by mml.                                                                   |
 +-------------------------------------------------------------------------- */

VoidT mmlAddAllParFormats()
{
	IntT i;

	for (i = 0; i < MAX_HASH_SIZE; i++) {
		if (hash[i].name != NULL && hash[i].type == PAR_DEF &&
			!StrEqual(hash[i].name,"Paragraph"))
		{
			mmlAddParFormat(docId,(ParRecordT *)(hash[i].modifier));
		}
	}
}

/* --------------------------------------------------------------------------+
 | mmlAddParFormat creates a new paragraph catalog entry in the document     |
 | specified by docId. The new paragraph catalog entry's properties          |
 | correspond to the properties specified in parRecord. The name of the      |
 | new paragraph catalog entry is specified by the paragraph tag property    |
 | parRecord->partag. If the paragraph catalog already contains an entry     |
 | with that name, that entry is replaced by the new entry, (the existing    |
 | entry is deleted). It is a fatal error if the paragraph catalog entry     |
 | cannot be created. Since a property value list must be obtained from an   |
 | instance of a particular type, rather than from the type itself, the      |
 | property value list parFormatProperties is obtained when the first        |
 | paragraph format is added to the paragraph catalog, to ensure that an     |
 | instance exists from which to obtain a property value list.               |
 | hash[parRecord->tabstops].name contains the string respresentation of the |
 | tabstops specified in parRecord.                                          |
 +-------------------------------------------------------------------------- */

VoidT mmlAddParFormat(docId,parRecord)
F_ObjHandleT	docId;
ParRecordT		*parRecord;
{
	static BoolT		firstCall = True;
	static F_PropValsT	parFormatProperties;
	F_TabsT				*paragraphTabs;
	F_ObjHandleT		parFormatId;

	if (parFormatId = F_ApiGetNamedObject(docId,FO_PgfFmt,parRecord->partag)) {
		F_ApiDelete(docId,parFormatId);
	}

	parFormatId = F_ApiNewNamedObject(docId,FO_PgfFmt,parRecord->partag);
	mmlAssertFatal(parFormatId, MML_CANT_ADD_PAR_FORMAT);

	if (firstCall) {
		parFormatProperties = F_ApiGetProps(docId,parFormatId);
		mmlDeleteStableFontNameProperties(&parFormatProperties);
	}

	mmlParRecordToPropVals(&pgfFmtIndexCache, &pgfFmtIndexCacheInitialized,
						   parRecord, &parFormatProperties);

	F_ApiSetProps(docId,parFormatId,&parFormatProperties);

	paragraphTabs = mmlTabStringToFTabs(hash[parRecord->tabstops].name);
	F_ApiSetTabs(docId,parFormatId,FP_Tabs,paragraphTabs);
	mmlFreeFTabs(paragraphTabs);
}

/* --------------------------------------------------------------------------+
 | Get the paragraph catalog entry named by paragraphTag from the document   |
 | specified by docId. Set parRecord to correspond to the properties of the  |
 | paragraph catalog entry. Set tabString to the hash table string           |
 | representation of the tab stops specified by the paragraph catalog entry. |
 | If the paragraph format named by paragraphTag is not in the paragraph     |
 | catalog, return False and do not set parRecord or tabString.              |
 +-------------------------------------------------------------------------- */

BoolT mmlGetParFormat(docId,paragraphTag,parRecord,tabString)
F_ObjHandleT	docId;
StringT			paragraphTag;
ParRecordT		*parRecord;
StringT			*tabString;
{
	F_ObjHandleT	parFormatId;
	F_PropValsT		parFormatProperties;
	F_TabsT			paragraphTabs;

	parFormatId = F_ApiGetNamedObject(docId,FO_PgfFmt,paragraphTag);

	if (parFormatId != 0) {

		parFormatProperties = F_ApiGetProps(docId,parFormatId);

		mmlPropValsToParRecord(&pgfFmtIndexCache, &pgfFmtIndexCacheInitialized,
							   &parFormatProperties, parRecord);

		F_ApiDeallocatePropVals(&parFormatProperties);

		paragraphTabs = F_ApiGetTabs(docId,parFormatId,FP_Tabs);

		*tabString = mmlFTabsToTabString(&paragraphTabs);
	}

	return parFormatId != 0;
}

