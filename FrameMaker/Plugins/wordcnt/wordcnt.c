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
 * Program Name:                                                     
 *    fa.wordcount                                                       
 *                                                                   
 * General Description:                                              
 *    Please see the description in wcmain.c                         
 *                                                                   
 *********************************************************************/      

#include "wordcnt.h"


/* 
 * char_map[] is used to determine which characters from the FrameMaker
 * character set are considered 'in word' or 'not in word' characters
 */
CharT char_map[] = {
/* 00 */  0,0,0,0,1,1,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 
/* 20 */  0,0,0,0,0,0,0,1, 0,0,0,0,0,0,0,0, 1,1,1,1,1,1,1,1, 1,1,0,0,0,0,0,0,
/* 40 */  0,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,0,0,0,0,1,
/* 60 */  0,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,0,0,0,0,0,
/* 80 */  1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,
/* A0 */  0,0,0,0,0,0,0,0, 0,0,0,0,0,0,1,1, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,1,1,
/* C0 */  0,0,0,0,0,0,0,0, 0,0,0,1,1,1,1,1, 0,0,0,0,0,1,0,0, 1,1,0,0,0,0,1,1,
/* E0 */  0,0,0,0,0,1,1,1, 1,1,1,1,1,1,1,1, 0,1,1,1,1,1,0,0, 0,0,0,0,0,0,0,0};

#define CharIsInWord(ch)  (char_map[(UCharT)ch] == (CharT)1)

IntT wc, inText, gotSpaceLast;



/*****************************  Prototypes  ******************************/
VoidT CountObjTextWords FARGS((F_ObjHandleT docId, F_ObjHandleT objId, F_ObjHandleT gline));
IntT GetPageType FARGS((F_ObjHandleT docId, F_ObjHandleT objectId));
VoidT CountWords FARGS((IntT docId, F_TextItemT *ip, BoolT gline));
VoidT CountWordsInTable FARGS((F_ObjHandleT docId, F_ObjHandleT tblId));
BoolT CharIsDelimiter FARGS((StringT cp));
 
 /*Place-holder for the function to check whether the UTF-8
 char is a delimiter or not.
 In future, it may be replaced by a function which returns true if the
 UTF8 character pointed by cp is a word delimiter, False otherwise.*/
 BoolT CharIsDelimiter(cp)
 StringT cp;
 {
 	IntT c32 = 0;
 	c32 = F_CharUTF8ToUTF32(cp);
 
 	/*Assuming that only those characters are delimiters which were 
 	considered delimiters in ascii char set.*/
 	if ( c32 < 256 )
 	{
 		return !CharIsInWord(c32);
 	}
 	return False;
 }
 


/*
* CountWordsInDoc()
* This functions counts the number of words in a document.
* It reads flows in the document.  For each flow which starts on a
* body page, it reads each paragraph in the flow and calls
* CountObjTextWords() to count the words.
* After flows, it reads all graphic text lines in the document. For
* each one found on a body page, it calls CountObjTextWords() to count the
* words in the text line.
* Finally it returns the number of words found to the caller.
*/
IntT CountWordsInDoc(docId)
F_ObjHandleT docId;
{
	F_ObjHandleT pgfId,  flowId, objectId;
	IntT pageType;

	wc = 0;
	flowId = F_ApiGetId(FV_SessionId,docId,FP_FirstFlowInDoc);
	while (flowId)
	{
		objectId = F_ApiGetId(docId,flowId,FP_FirstTextFrameInFlow);
		while (objectId)
		{
			/* what sort of page is this on */
			pageType = GetPageType(docId,objectId);
			if (pageType != FO_BodyPage)
				break;

			pgfId = F_ApiGetId(docId,objectId,FP_FirstPgf);
			while (pgfId)
			{
				CountObjTextWords(docId, pgfId, False);
				pgfId = F_ApiGetId(docId,pgfId,FP_NextPgfInFlow);
			}
			objectId = 0;
		}
		flowId = F_ApiGetId(docId,flowId,FP_NextFlowInDoc);
	}
	/* Now count Text Lines */
	objectId = F_ApiGetId(FV_SessionId,docId,FP_FirstGraphicInDoc);
	while (objectId)
	{
		IntT objType;

		objType  = F_ApiGetObjectType(docId,objectId);	
		if (objType == FO_TextLine)
		{
			/* text from text line - body pages only */

			pageType = GetPageType(docId,objectId);
			if (pageType == FO_BodyPage)
			{
				CountObjTextWords(docId,objectId,True);
			}    
		}    

		objectId = F_ApiGetId(docId,objectId,FP_NextGraphicInDoc);
	}
	return (wc);
}

/*
* CountObjTextWords() 
* gets the text items for a paragraph or a graphic text line (gline) 
* and passes each of those items to CountWords
*/
VoidT CountObjTextWords(docId, objId, gline)
F_ObjHandleT docId;
F_ObjHandleT objId;
F_ObjHandleT gline;
{
	F_TextItemsT tis;   
	F_TextItemT *ip;
	UIntT i;
	IntT flags;

	flags = FTI_String | FTI_LineEnd | FTI_PgfBegin | FTI_PgfEnd 
					| FTI_FnAnchor | FTI_TblAnchor;
	tis = F_ApiGetText(docId,objId,flags);
	for (i=0; i<tis.len; i++)
	{
		ip = &tis.val[i];
		CountWords(docId, ip, gline);
	}    
	F_ApiDeallocateTextItems(&tis);
}


/*
* GetPageType() 
* Used to determine the page type of the page containing a given object.
* It works by finding successive parent frames, starting with the object,
* until a parent of type page is located.
*/
IntT GetPageType(docId, objectId)
F_ObjHandleT docId, objectId;
{
	F_ObjHandleT parentId, oldParentId;
	IntT parentType;

	parentId = objectId;
	parentType = FO_TextFrame;
	while (parentType != FO_BodyPage && 
			parentType != FO_MasterPage &&
				parentType != FO_RefPage && parentType != FO_HiddenPage)
	{
		oldParentId = parentId;
		parentId = F_ApiGetId(docId,parentId,FP_FrameParent);
		if (!parentId)
		{
			parentId = F_ApiGetId(docId,
								oldParentId,FP_PageFramePage);
			if (!parentId)
				break;
		}
		parentType = F_ApiGetObjectType(docId,parentId);
	}

	return parentType;
}

/*
* CountWords()
* This is the function which does the actual wordcounting.
* It takes a text item and acts according to the type of 
* that text item.
*/
VoidT CountWords(docId, ip, gline)
IntT docId;
F_TextItemT *ip;
BoolT gline;
{
	StringT cp;
	F_ObjHandleT id,pgfId,lastPgfId;
	BoolT saveInText,saveGotSpaceLast;
	IntT flags;

	switch ((IntT)ip->dataType)
	{
	case FTI_PgfEnd:
		/* Paragraph end item - count a word only in the case where   */
		/* we started counting a word in the paragraph but didn't end */
		/* that word.												  */
		if (inText && !gotSpaceLast)
			wc++;
		inText = gotSpaceLast = False;
		break;

	case FTI_LineEnd:
		/* Line end item - count a line is the line end is a hard line */
		/* line end, and we've started a word but haven't ended it.    */
		/* Soft (automatic) line ends are not considered word breaks.  */
		flags = ip->u.idata;
		if ((flags == FTI_HardLineEnd) || gline)
		{
			if (inText && !gotSpaceLast)
				wc++;
			inText = gotSpaceLast = False;
		}
		break;

	case FTI_PgfBegin:
		/* Start of paragraph - reset for counting                     */
		inText = gotSpaceLast = False;
		break;

	case FTI_String:
		/* String - for each word character, start a new word if we're */
		/* not already in a word, ignore it otherwise.  For a non-word */
		/* character, end a word if we're in one, ignore otherwise     */
		cp = ip->u.sdata;
		for (cp = ip->u.sdata; *cp; F_UTF8NextChar(&cp))
		{
			if (!CharIsDelimiter(cp)) 
			{
				inText = True;
				gotSpaceLast = False;
			}
			else
			{
				if (inText)
				{
					wc++;
					inText = False;
				}
				gotSpaceLast = True;
			}
		}
		break;

	case FTI_FnAnchor:

		/* Footnote - save current position. For each paragraph in the  */
		/* footnote, call CountObjTextWords to count those words.       */
		/* Restore current position (whether in a word or not) on       */
		/* return.                                                      */

		saveInText = inText;
		saveGotSpaceLast = gotSpaceLast;
		inText = gotSpaceLast = False;
		id = ip->u.idata;
		pgfId = F_ApiGetId(docId, id, FP_FirstPgf);
		lastPgfId = F_ApiGetId(docId, id, FP_LastPgf);
		while (pgfId)
		{
			CountObjTextWords(docId, pgfId, False);
			if (pgfId == lastPgfId)
				break;
			pgfId = F_ApiGetId(docId, pgfId,FP_NextPgfInFlow);
		}
		inText = saveInText;
		gotSpaceLast = saveGotSpaceLast;
		break;

	case FTI_TblAnchor:
		/* Table - save current position as for footnote and call       */
		/* CountWordsInTable to count table text                        */

		saveInText = inText;
		saveGotSpaceLast = gotSpaceLast;
		inText = gotSpaceLast = False;
		CountWordsInTable(docId, ip->u.idata);
		inText = saveInText;
		gotSpaceLast = saveGotSpaceLast;
		break;

	default:
		break;
	}
}

VoidT CountWordsInTable(docId, tblId)
F_ObjHandleT docId;
F_ObjHandleT tblId;
{
	F_ObjHandleT rowId, cellId, pgfId;

	if (!tblId)
		return;

	/* Get the text in the table title - if any - and count it first */
	for (pgfId = F_ApiGetId(docId, tblId, FP_FirstPgf); pgfId;
			pgfId = F_ApiGetId(docId, pgfId,FP_NextPgfInFlow))
	{
		CountObjTextWords(docId, pgfId, False);
	}

	/* Now get the rows, check each row to make sure it's not an      */
	/* undisplayed conditional row. For each displayed row, get the   */
	/* cells.  For each cell, get the paragraphs and count the words. */

	for (rowId = F_ApiGetId(docId, tblId, FP_FirstRowInTbl); rowId;
			rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl))
	{
		if (!F_ApiGetInt(docId, rowId, FP_RowIsShown))
			continue;
		for (cellId = F_ApiGetId(docId, rowId, FP_FirstCellInRow); cellId;
				cellId = F_ApiGetId(docId, cellId, FP_NextCellInRow))
		{
			for (pgfId = F_ApiGetId(docId, cellId, FP_FirstPgf); pgfId;
					pgfId = F_ApiGetId(docId, pgfId,FP_NextPgfInFlow))
			{
				CountObjTextWords(docId, pgfId, False);
			}
		}
	}
}

