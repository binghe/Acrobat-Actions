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
 | mmlCreateHeaderAndFooter creates the document's headers and footers.      |
 | The headers' and footers' properties are obtained from global variables   |
 | set by the mml parser when processing the document layout section of the  |
 | mml file. The global variables firstpagefooter and firstpageheader        |
 | specify whether or not a header or footer will appear on the first page.  |
 | If the header and/or footer are to be suppressed on the first page, a     |
 | special master page is created. This master page will will be the same as |
 | the left and right master pages except that the header and/or footer will |
 | be omitted. This special master page will be applied to the first page of |
 | the document after the document is completed. The id of the special       |
 | master page is stored in the global variable firstPageMasterPageId.       |
 | It is a fatal error if the special master page cannot be created.         |
 | mmlCreateHeader loops through each of the master pages, (left, right, and |
 | first page), calling mmlCreateHeaderOrFooter to add headers and footers   |
 | as required.                                                              |
 +-------------------------------------------------------------------------- */

VoidT mmlCreateHeaderAndFooter()
{
	MetricT headerFooterLeft   = mmlMeasureToMetric(headerleftmargin);

	MetricT headerFooterWidth  = mmlMeasureToMetric(pagewidth) -
                                 mmlMeasureToMetric(headerleftmargin) - 
                                 mmlMeasureToMetric(headerrightmargin);

	MetricT headerFooterHeight = POINTTOMETRIC(headerfont.pts);

	MetricT headerTop          = mmlMeasureToMetric(headertopmargin);

	MetricT footerTop          = mmlMeasureToMetric(pageheight) - 
                                 mmlMeasureToMetric(headerbottommargin) - 
                                 (2 * POINTTOMETRIC(headerfont.pts)) / 3;

	F_ObjHandleT firstPageMasterPageId;
	F_ObjHandleT masterPageId;

	headerFooterCharProperties = F_ApiGetTextProps(docId,&insertionPoint);
	mmlDeleteStableFontNameProperties(&headerFooterCharProperties);

	mmlFontRecordToPropVals(&fontIndexCache, &fontIndexCacheInitialized,
							&headerfont, &headerFooterCharProperties);

	if (!firstpageheader || !firstpagefooter) {
		firstPageMasterPageId = mmlCreateFirstPageMasterPage(docId);
	}

	masterPageId = F_ApiGetId(FV_SessionId,docId,FP_FirstMasterPageInDoc);

	while (masterPageId) {

		if (firstpageheader || (masterPageId != firstPageMasterPageId)) {
			mmlCreateHeaderOrFooter(docId, masterPageId,
									headerFooterLeft,  headerTop,
									headerFooterWidth, headerFooterHeight,
									hash[leftheader  ].name, 
									hash[centerheader].name,
									hash[rightheader ].name, 
									&headerFooterCharProperties);
		}

		if (firstpagefooter || (masterPageId != firstPageMasterPageId)) {
			mmlCreateHeaderOrFooter(docId, masterPageId,
									headerFooterLeft,  footerTop,
									headerFooterWidth, headerFooterHeight,
									hash[leftfooter  ].name,
									hash[centerfooter].name,
									hash[rightfooter ].name, 
									&headerFooterCharProperties);
		}

		masterPageId = F_ApiGetId(docId,masterPageId,FP_PageNext);
	}
}

/* --------------------------------------------------------------------------+
 | mmlCreateHeaderOrFooter creates a text column of width width and height   |
 | height at coordinates x,y on master page pageId in document docId. The    |
 | text column has exactly one paragraph. This paragraph has a center tab    |
 | in the center of the text column and a right tab at the right edge of     |
 | the text column. The text of the paragraph consists of the leftString     |
 | followed by a tab followed by the center string, followed by a tab,       |
 | followed by the right string. The effect is to left align the leftString, |
 | center the centerString, and right align the rightString. The character   |
 | properties characterProperties are then applied to the entire paragraph.  |
 +-------------------------------------------------------------------------- */

VoidT mmlCreateHeaderOrFooter(docId, pageId, x, y, width, height,
							  leftString, centerString, rightString,
							  characterProperties)
F_ObjHandleT docId;
F_ObjHandleT pageId;
MetricT      x;
MetricT      y;
MetricT      width;
MetricT      height;
StringT      leftString;
StringT      centerString;
StringT      rightString;
F_PropValsT  *characterProperties;
{
	F_ObjHandleT textColumnId;
	F_ObjHandleT paragraphId;

	F_TabsT      tabStruct;
	F_TabT       tabArray[2];

	F_TextLocT   insertionPoint;
	F_TextRangeT textRange;

	IntT         leftStringLength   = F_StrLen(leftString);
	IntT         centerStringLength = F_StrLen(centerString);
	IntT         rightStringLength  = F_StrLen(rightString);

	StringT      leftCenterRightString;

	UCharT       *startOfRun;
	UCharT       *endOfRun;

	F_ObjHandleT pageNumberId;
	F_TextRangeT pageNumberRange;
	IntT         pageNumberLength;

	textColumnId = mmlCreateTextColumn(docId, pageId, x, y, width, height);

	paragraphId  = F_ApiGetId(docId, textColumnId, FP_FirstPgf);

	tabStruct.len = 2;
	tabStruct.val = tabArray;

	tabArray[0].type      = FV_TAB_CENTER;
	tabArray[0].x         = width / 2;
	tabArray[0].leader    = (StringT)"";

	tabArray[1].type      = FV_TAB_RIGHT;
	tabArray[1].x         = width;
	tabArray[1].leader    = (StringT)"";

	F_ApiSetTabs(docId, paragraphId, FP_Tabs, &tabStruct);

	insertionPoint.objId  = paragraphId;
	insertionPoint.offset = 0;

	textRange.beg = insertionPoint;

	leftCenterRightString = 
		myalloc(leftStringLength+1+centerStringLength+1+rightStringLength+1);

	F_StrCpy(leftCenterRightString,leftString);
	leftCenterRightString[leftStringLength] = '\010';
	F_StrCpy(leftCenterRightString+leftStringLength+1,centerString);
	leftCenterRightString[leftStringLength+1+centerStringLength] = '\010';
	F_StrCpy(leftCenterRightString+leftStringLength+1+centerStringLength+1,
			 rightString);

	startOfRun = endOfRun = leftCenterRightString;

	for (;;) {
		if (*endOfRun == '#') {
			*endOfRun = '\0';
			F_ApiAddText(docId, &insertionPoint, startOfRun);
			insertionPoint.offset += (endOfRun - startOfRun);
			pageNumberId     = 
				F_ApiNewAnchoredFormattedObject(docId,FO_Var,"Current Page #",
												&insertionPoint);
			pageNumberRange  = 
				F_ApiGetTextRange(docId,pageNumberId,FP_TextRange);
			pageNumberLength = 
				pageNumberRange.end.offset - pageNumberRange.beg.offset + 1;
			insertionPoint.offset += pageNumberLength;
			startOfRun = endOfRun = endOfRun + 1;
		} else if (*endOfRun == '\0') {
			F_ApiAddText(docId, &insertionPoint, startOfRun);
			insertionPoint.offset += (endOfRun - startOfRun);
			break;
		} else {
			endOfRun++;
		}
	}

	myfree(leftCenterRightString);

	textRange.end = insertionPoint;

	F_ApiSetTextProps(docId, &textRange, characterProperties);
}

/* --------------------------------------------------------------------------+
 | mmlCreateTextColumn creates a text column of width width and height       |
 | height at coordinates x,y on master page pageId of document docId.        |
 +-------------------------------------------------------------------------- */

F_ObjHandleT mmlCreateTextColumn(docId, pageId, x, y, width, height)
F_ObjHandleT docId;
F_ObjHandleT pageId;
MetricT      x;
MetricT      y;
MetricT      width;
MetricT      height;
{
	F_ObjHandleT pageFrameId;
	F_ObjHandleT textColumnId;

	pageFrameId  = F_ApiGetId(docId, pageId, FP_PageFrame);
	textColumnId = F_ApiNewGraphicObject(docId, FO_TextFrame, pageFrameId);

	F_ApiSetMetric(docId, textColumnId, FP_LocX,   x);
	F_ApiSetMetric(docId, textColumnId, FP_LocY,   y);
	F_ApiSetMetric(docId, textColumnId, FP_Width,  width);
	F_ApiSetMetric(docId, textColumnId, FP_Height, height);

	return textColumnId;
}

/* --------------------------------------------------------------------------+
 | mmlDeleteHeadersAndFooters deletes all text columns in docId that are     |
 | contained on master pages and that have a flow that is not autoconnected. |
 | This function is designed to be called immediately after mmlCreateDocument|
 | If it is called on an arbitrary document, there may be text columns that  |
 | are not headers or footers, but have un-autoconnected flows.              |
 +-------------------------------------------------------------------------- */

VoidT mmlDeleteHeadersAndFooters(docId)
F_ObjHandleT docId;
{
	F_ObjHandleT masterPageId;
	F_ObjHandleT pageFrameId;
	F_ObjHandleT graphicId;
	F_ObjHandleT nextGraphicId;
	F_ObjHandleT flowId;

	for (masterPageId = F_ApiGetId(FV_SessionId,docId,FP_FirstMasterPageInDoc);
		 masterPageId;
		 masterPageId = F_ApiGetId(docId,masterPageId,FP_PageNext))
	{
		pageFrameId = F_ApiGetId(docId,masterPageId,FP_PageFrame);
		graphicId   = F_ApiGetId(docId,pageFrameId, FP_FirstGraphicInFrame);

		while (graphicId) {
			nextGraphicId = F_ApiGetId(docId,graphicId,FP_NextGraphicInFrame);

			if (F_ApiGetObjectType(docId,graphicId) == FO_TextFrame) {
				flowId = F_ApiGetId(docId,graphicId,FP_Flow);
				if (!F_ApiGetInt(docId,flowId,FP_FlowIsAutoConnect)) {
					F_ApiDelete(docId,graphicId);
				}
			}

			graphicId = nextGraphicId;
		}
	}
}

/* --------------------------------------------------------------------------+
 | Creates a new master page and returns the new page's id. The new page is  |
 | intended to be applied to the first body page. The new page contains the  |
 | same graphic objects as the page on which it is based. If the document is |
 | single-sided, the new page is based on the first, (only), master page.    |
 | If the document is double-sided, and FirstPageVerso is False, the new     |
 | page is based on the first, (left), master page. If the document is       |
 | double-sided, and FirstPageVerso is True, the new page is based on the    |
 | second, (right), master page.                                             |
 +-------------------------------------------------------------------------- */

F_ObjHandleT mmlCreateFirstPageMasterPage(docId)
F_ObjHandleT docId;
{
	F_ObjHandleT currentPageId;
	F_ObjHandleT masterPageId;
	F_ObjHandleT pageFrameId;
	F_ObjHandleT graphicId;
	F_ObjHandleT flowId;
	F_ObjHandleT newMasterPageId;
	F_ObjHandleT newFlowId;

	currentPageId   = F_ApiGetId(FV_SessionId,docId,FP_CurrentPage); 

	newMasterPageId = 
		F_ApiNewNamedObject(docId, FO_MasterPage, "firstPage");

	mmlAssertFatal(newMasterPageId != 0, MML_CANT_ADD_MASTER_PAGE);

	if (F_ApiGetInt(FV_SessionId,docId,FP_DocIsDoubleSided) &&
		F_ApiGetInt(FV_SessionId,docId,FP_FirstPageVerso))
	{
		masterPageId = F_ApiGetId(docId,
								  F_ApiGetId(FV_SessionId,docId,FP_FirstMasterPageInDoc),
								  FP_PageNext);
	} else {
		masterPageId = F_ApiGetId(FV_SessionId,docId,FP_FirstMasterPageInDoc);
	}

	pageFrameId = F_ApiGetId(docId,masterPageId,FP_PageFrame);

	graphicId   = F_ApiGetId(docId,pageFrameId,FP_FirstGraphicInFrame);
	flowId      = F_ApiGetId(docId,graphicId,FP_Flow);
	for (;graphicId;
		 graphicId = F_ApiGetId(docId,graphicId,FP_NextGraphicInFrame))
	{
		F_ApiSetInt(docId,graphicId,FP_GraphicIsSelected,True);
	}

	F_ApiSetId(FV_SessionId,docId,FP_CurrentPage,masterPageId); 

	F_ApiCopy(docId,0);

	graphicId   = F_ApiGetId(docId,pageFrameId,FP_FirstGraphicInFrame);
	for (;graphicId;
		 graphicId = F_ApiGetId(docId,graphicId,FP_NextGraphicInFrame))
	{
		F_ApiSetInt(docId,graphicId,FP_GraphicIsSelected,False);
	}

	F_ApiSetId(FV_SessionId,docId,FP_CurrentPage,newMasterPageId);

	F_ApiPaste(docId,0);

	pageFrameId = F_ApiGetId(docId,newMasterPageId,FP_PageFrame);

	graphicId   = F_ApiGetId(docId,pageFrameId,FP_FirstGraphicInFrame);
	newFlowId   = F_ApiGetId(docId,graphicId,FP_Flow);
	for (;graphicId;
		 graphicId = F_ApiGetId(docId,graphicId,FP_NextGraphicInFrame))
	{
		F_ApiSetInt(docId,graphicId,FP_GraphicIsSelected,False);
	}
	F_ApiSetInt(docId,newFlowId,FP_FlowIsAutoConnect,True);
	F_ApiSetString(docId,newFlowId,FP_Name,
				   F_ApiGetString(docId,flowId,FP_Name));

	F_ApiSetId(FV_SessionId,docId,FP_CurrentPage,currentPageId); 

	return newMasterPageId;
}

