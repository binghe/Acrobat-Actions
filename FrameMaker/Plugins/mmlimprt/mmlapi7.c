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
#include "mml.h"
#include "mmlproto.h"

/* --------------------------------------------------------------------------+
 | mmlCreateDocument is called to create a new document when an mml file is  |
 | opened, rather than imported. The id of the new document is stored in the |
 | global variable docId. This variable is used throughout the program to    |
 | specify this document in API calls. The new document initially contains an|
 | empty "dummy paragraph". The id of this paragraph is stored in the global |
 | variable firstParagraphId so that the "dummy paragraph" may be deleted    |
 | after the document is completed. The global variable insertionPoint is set|
 | to the begining of the new document. Thus, the first "real" paragraph will|
 | be inserted after the "dummy paragraph". mmlCreateDocument is called      |
 | after the mml document layout section has been parsed, but before the     |
 | document text section is parsed. The width, height, margins, number of    |
 | columns, column gap, first page number, page number style, double         |
 | sidedness, and first page side are all obtained from global variables     |
 | that were set by the mml parser while parsing the document layout section.|
 | mmlDeleteAllParFormats is called to clear the paragraph catalog of the    |
 | new document. Finally, mmlCreateHeaderAndFooter is called to add headers  |
 | and footers to the new document.                                          |
 +-------------------------------------------------------------------------- */

VoidT mmlCreateDocument()
{
	F_ObjHandleT	firstFlowId;
	F_ObjHandleT	firstTextColumnId;
	IntT			sidedness;
	IntT			pageNumberStyle;

	sidedness = doublesided
		? (firstpageleft ? FF_Custom_FirstPageLeft : FF_Custom_FirstPageRight)
		: FF_Custom_SingleSided;


	docId = F_ApiCustomDoc(mmlMeasureToMetric(pagewidth),
						   mmlMeasureToMetric(pageheight),
						   columns,
						   mmlMeasureToMetric(columngap),
						   mmlMeasureToMetric(topmargin),
						   mmlMeasureToMetric(bottommargin),
						   mmlMeasureToMetric(leftmargin),
						   mmlMeasureToMetric(rightmargin),
						   sidedness,
						   False);

	F_ApiSetInt(FV_SessionId,docId,FP_FirstPageNum,firstpagenumber);

	switch (headerpagenumberstyle) {
	case arabic:
		pageNumberStyle = FV_PAGE_NUM_NUMERIC;
		break;
	case lcroman:
		pageNumberStyle = FV_PAGE_NUM_ROMAN_LC;
		break;
	case ucroman:
		pageNumberStyle = FV_PAGE_NUM_ROMAN_UC;
		break;
	case lcalpha:
		pageNumberStyle = FV_PAGE_NUM_ALPHA_LC;
		break;
	case ucalpha:
		pageNumberStyle = FV_PAGE_NUM_ALPHA_UC;
		break;
	}

	F_ApiSetInt(FV_SessionId,docId,FP_PageNumStyle,pageNumberStyle);

	firstFlowId          = F_ApiGetId(FV_SessionId,docId,FP_MainFlowInDoc);
	firstTextColumnId    = F_ApiGetId(docId,firstFlowId,FP_FirstTextFrameInFlow);
	firstParagraphId     = F_ApiGetId(docId,firstTextColumnId,FP_FirstPgf);

	insertionPoint.objId  = firstParagraphId;
	insertionPoint.offset = 0;

	mmlDeleteAllParFormats(docId);
	mmlDeleteHeadersAndFooters(docId);
	mmlCreateHeaderAndFooter();

	F_ApiSetInt(FV_SessionId,docId,FP_ViewTextSymbols,False);
	F_ApiSetInt(FV_SessionId,docId,FP_ViewBorders,False);
}


local IntT def_columns        = 1;

local BoolT def_doublesided   = False;
local BoolT def_firstpageleft = False;

#define MEASUREUNDEFINED(m)  ((m).munit == UNDEFINED)
#define INTUNDEFINED(i)      ((i) == UNDEFINED)
#define BOOLUNDEFINED(b)     ((b) == UNDEFINED)

/* --------------------------------------------------------------------------+
 | fillin_doc_undefineds tests each of the document layout global variables  |
 | to see if they are undefined. If a variable is undefined it is set to its |
 | default value. A variable, (e.g. pageheight), starts out undefined. When  |
 | the mml parser processes the corresponding mml statement,                 |
 | (e.g. <PageHeight 11 in>), the variable becomes defined. If the mml       |
 | parser never encounters the corresponding statement, the variable remains |
 | undefined and is set to its default value by fillin_doc_undefineds.       |
 | fillin_doc_undefineds is called after the document layout section has     |
 | been processed, but before mmlCreateDocument is called.                   |
 +-------------------------------------------------------------------------- */

VoidT fillin_doc_undefineds()
{

		 if (MEASUREUNDEFINED(pagewidth))
			 pagewidth = def_pagewidth;
		 if (MEASUREUNDEFINED(pageheight))
			 pageheight = def_pageheight;

         if (INTUNDEFINED(columns))
             columns = def_columns;
		 if (MEASUREUNDEFINED(columngap))
			 columngap = def_columngap;

		 if (MEASUREUNDEFINED(topmargin))
			 topmargin = def_topmargin;
		 if (MEASUREUNDEFINED(bottommargin))
			 bottommargin = def_bottommargin;
		 if (MEASUREUNDEFINED(leftmargin))
			 leftmargin = def_leftmargin;
		 if (MEASUREUNDEFINED(rightmargin))
			 rightmargin = def_rightmargin;

         if (BOOLUNDEFINED(doublesided))
             doublesided = def_doublesided;
         if (BOOLUNDEFINED(firstpageleft))
             firstpageleft = def_firstpageleft;

		 if (MEASUREUNDEFINED(headertopmargin))
			 headertopmargin = def_headertopmargin;
		 if (MEASUREUNDEFINED(headerbottommargin))
			 headerbottommargin = def_headerbottommargin;
		 if (MEASUREUNDEFINED(headerleftmargin))
			 headerleftmargin = def_headerleftmargin;
		 if (MEASUREUNDEFINED(headerrightmargin))
			 headerrightmargin = def_headerrightmargin;

		 if (INTUNDEFINED(firstpagenumber))
			 firstpagenumber = 1;

		 if (INTUNDEFINED(headerpagenumberstyle))
			 headerpagenumberstyle = arabic;

		 if (INTUNDEFINED(leftheader))
			 leftheader   = emptyStringHashIndex;

		 if (INTUNDEFINED(centerheader))
			 centerheader = emptyStringHashIndex;

		 if (INTUNDEFINED(rightheader))
			 rightheader  = emptyStringHashIndex;

		 if (INTUNDEFINED(leftfooter))
			 leftfooter   = emptyStringHashIndex;

		 if (INTUNDEFINED(centerfooter))
			 centerfooter = emptyStringHashIndex;

		 if (INTUNDEFINED(rightfooter))
			 rightfooter  = emptyStringHashIndex;

		 fillin_font_undefineds(&headerfont);

         if (BOOLUNDEFINED(firstpageheader))
             firstpageheader = True;
         if (BOOLUNDEFINED(firstpagefooter))
             firstpagefooter = True;
}
