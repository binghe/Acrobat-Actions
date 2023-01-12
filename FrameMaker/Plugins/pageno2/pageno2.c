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
 *	Program Name: 
 *		pageno2
 *	
 *	General Description:
 *		Sample program which locates a particular flow, deletes any existing text 
 *		and inserts a string of text with the page number and total number of pages 
 *		in the document for each body page. Used to provide a second numbering 
 *		sequence for documents which are numbered continuously in a book. A sample 
 *		document with a flow called "docPgCnt" is provided. Only the case of Arabic 
 *		numbering is coded.
 *
 *	Invocation:
 *		The client is called each time a document is saved.
 *
 *   Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name pageno2>
 *			<Description Adds numbering text in a specified text frame 
 *			 on each page of a document.>
 *			<Directory fdk_install_dir/samples/pageno2>
 *			<CommandLine $FAPIDIR/fa.pageno2>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.pageno2>
 *		to:
 *			<SharedLibrary fa.pageno2.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		pageno2=Standard,Adds numbering text in a specified text frame on 
 *		each page of a document, fdk_install_dir\samples\pageno2\debug\pageno2.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 *******************************************************************************************/


#include "fapi.h"
#include "fstrings.h"
#include "fdetypes.h"
#include "futils.h"
#include "fstrlist.h"

F_TextRangeT selectAllinFlow( F_ObjHandleT docId, F_ObjHandleT flowId);
F_ObjHandleT getTextFrameWithFlow(F_ObjHandleT docId, F_ObjHandleT pageId, StringT flowname);
StringT intToString(IntT number);
StringT getFileName(F_ObjHandleT docId);
StringT makeString(StringListT list);


VoidT F_ApiInitialize(IntT init) 
{	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch (init) 
	{
	case FA_Init_First:
				
		/*Catch notification of save of document in order to update numbering.*/
		F_ApiNotification(FA_Note_PreSaveDoc, True);
		break;
	}
}

VoidT F_ApiNotify (IntT notification, F_ObjHandleT docId, StringT sparm, IntT iparm)
{
	F_ObjHandleT textframeId, pageId, flowId, pgfId, lastpageId;
	StringT flowName, fileName, pageNo, lastpageNoString, text;
	F_TextRangeT tr;
	F_TextLocT newtextLoc;
	IntT pageCount = 0, lastpageNo;
	StringListT list;

	switch (notification)
	{
	case FA_Note_PreSaveDoc:

		/*Create string for particular flow in the test document.*/
		flowName = F_StrCopyString((StringT) "docPgCnt");
		/*Find the flow, return if not found.*/
		pageId = F_ApiGetId(0, docId,FP_FirstBodyPageInDoc);
		if ((textframeId = getTextFrameWithFlow(docId, pageId, flowName)) == 0)
		{			
			F_Printf(NULL, "Flow named , %s, was not found on page 1.\n", flowName);
			return;
		}
		/*Delete existing text from this flow. Do a simple save to get correct pagination.*/
		flowId = F_ApiGetId(docId, textframeId, FP_Flow);
		tr = selectAllinFlow(docId, flowId);
		F_ApiDeleteText(docId, &tr);
		fileName = F_StrCopyString(sparm);
		F_ApiSimpleSave(docId, fileName, False);

		/*Set insertion point to beginning of flow*/
		pgfId = F_ApiGetId(docId, textframeId, FP_FirstPgf);
		tr.beg.objId = pgfId;
		tr.beg.offset = 0;
		tr.end.objId = pgfId;
		tr.end.offset = 0;

		/*Get the base file name (no path)*/
		fileName = getFileName(docId);
		
		/*Get number of pages in document as a string as well as an integer.*/
		lastpageId = F_ApiGetId(0, docId, FP_LastBodyPageInDoc);
		lastpageNo = F_ApiGetInt(docId, lastpageId, FP_PageNum) + 1;
		lastpageNoString = intToString(lastpageNo);

		/*Change first page number to string*/
		pageCount = 1;
		pageNo = intToString(pageCount);

		/*Create string list with pieces of text to be create page number text.*/
		list = F_StrListNew((UIntT)1, (UIntT)1);
		F_StrListAppend(list, (StringT) "Page ");
		F_StrListAppend(list, pageNo);
		F_StrListAppend(list, (StringT) " of ");
		F_StrListAppend(list, lastpageNoString);
		F_StrListAppend(list, (StringT) " in ");
		F_StrListAppend(list, fileName);

		/*Use string list to create a single string of text.*/
		text = makeString(list);
 
		/*Add the text to the flow and return the new cursor location.*/
		newtextLoc = F_ApiAddText(docId, &tr.end, text);

		F_Free(text);

		/*Loop through the number of pages in the document. First make a new 
		paragraph in the flow. Then modify the string list for each page, make 
		a new text string and add it to the flow.*/
		while (pageCount < lastpageNo)
		{
			/*Line feed causes new paragraph to be inserted.*/
			newtextLoc = F_ApiAddText(docId, &newtextLoc, (StringT) "\n");

			/*Change value of pageNo in string list.*/
			pageCount++;
			pageNo = intToString(pageCount);
			F_StrListSetString(list, pageNo, (UIntT)1);

			/*Make the new text string and add to the flow*/
			text = makeString(list);
			newtextLoc = F_ApiAddText(docId, &newtextLoc, text);
			F_Free(text);

		}
		break;
	}
	F_Free(flowName);
	F_StrListFree(list);
	return;
}

/*Selects all the text in flow, and returns the selection*/
F_TextRangeT selectAllinFlow( F_ObjHandleT docId, F_ObjHandleT flowId)
{
	F_ObjHandleT pgfId, textframeId;
	F_TextRangeT tr;
	F_TextItemsT ti;
	
	/*Get the beginning of the first paragraph in the flow.*/
	textframeId = F_ApiGetId(docId, flowId, FP_FirstTextFrameInFlow);
	pgfId = F_ApiGetId(docId, textframeId, FP_FirstPgf);
	/*Set beginning of text selection.*/
	tr.beg.objId = pgfId;
	tr.beg.offset = 0;

	/*Set the end of text selection to the offset of the end of the last paragraph.*/
	ti = F_ApiGetText(docId, flowId, FTI_PgfEnd);
	tr.end.offset = ti.val[ti.len-1].offset;
	tr.end.objId = ti.val[ti.len-1].u.idata;

	F_ApiDeallocateTextItems(&ti);
	return tr;
}
/*Find a text frame on a page which contains a particular flow.*/
F_ObjHandleT getTextFrameWithFlow(F_ObjHandleT docId, F_ObjHandleT pageId, StringT flowName)

{
	F_ObjHandleT pageframeId, lastGraphic, textframeId, newtextframeId, flowId;
	StringT tempName=NULL;
	
	pageframeId = F_ApiGetId(docId, pageId, FP_PageFrame);
	textframeId = F_ApiGetId(docId, pageframeId, FP_FirstGraphicInFrame);
	lastGraphic = F_ApiGetId(docId, pageframeId, FP_LastGraphicInFrame);
	
	do
	{
		/*Store textframe ID to test if this is the last textframe on the page*/
		newtextframeId = textframeId;
		/*Is the graphic object a textframe?*/
		if (F_ApiGetObjectType(docId, textframeId) == FO_TextFrame)
		{
			/*If yes, check to see if it has the desired flow.*/
			flowId = F_ApiGetId(docId, textframeId, FP_Flow);
			tempName = F_ApiGetString(docId, flowId, FP_Name);
		}

		/*Get the next graphic to test.*/
		textframeId = F_ApiGetId(docId, textframeId, FP_NextGraphicInFrame);
	}
	
	/*Check to see if we have processed the last graphic or if we have found a match.*/
	while ((newtextframeId != lastGraphic) && (F_StrCmp(flowName, tempName) != 0));
	
	/*Check to see if the loop exit was due to last graphic or match.*/
	if (F_StrCmp(flowName, tempName) == 0)
	{
		F_Free(tempName);
		return newtextframeId; /*Textframe with flow was found.*/
	}
	else
	{
		F_Free(tempName);
		return 0; /*No textframe with flow was found.*/
	}
}
/*Convert an integer to a string.*/
StringT intToString(IntT number)
{
	StringT str;
	UCharT buf[10];
	IntT i, j;
		
	i = F_Sprintf(buf, "%d",number);
	str = F_StrCopyString((StringT) "");
	str = F_Realloc(str, i+1, NO_DSE);
	for (j=0;j <i; j++)
		str[j] = buf[j];
	F_StrTrunc(str, i);
	return str;
}
/*Returns the name of the document - no path - just the filename.*/
StringT getFileName(F_ObjHandleT docId)
{
	StringT baseName, filePathName;
	FilePathT *path;

	filePathName = F_ApiGetString(FV_SessionId, docId, FP_Name);
	path = F_PathNameToFilePath(filePathName, NULL, FDefaultPath);
	baseName = F_FilePathBaseName(path);
	F_FilePathFree(path);
	F_Free(filePathName);
	return baseName;
}
/*Concatenate a list of strings and return the single string.*/
StringT makeString(StringListT list)
{
	StringT str, addStr;
	IntT i;

	str = F_StrCopyString((StringT) "");
	for (i = 0; i<F_StrListLen(list); i++)
	{
		addStr = F_StrListGet(list, (UIntT) i);
		str = F_Realloc(str, F_StrLen(str)+F_StrLen(addStr)+1, NO_DSE);
		F_StrCat(str,addStr);
	}
	return str;
}


