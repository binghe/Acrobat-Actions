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
#include "fdetypes.h"
#include "fchannel.h"
#include "futils.h"


/* --------------------------------------------------------------------------+
 | Inserts an anchored frame at the current insertion point. The current     |
 | insertion point is specified by the global variable insertionPoint.       |
 | The document that contains the current insertion point is specified by    |
 | the global variable docId. Sets insertionPoint to after the anchored      |
 | frame. The anchored frame is specified in mif. This code intercepts the   |
 | mif and writes it to a temporary file, rather than proceesing it with the |
 | mml parser. The temporary mif file is then opened as a FrameMaker         |
 | document. The document contains only a marker which represents the        |
 | anchored frame. The marker, (and with it, the anchored frame), is         |
 | copied to the clipboard. The temporary file is closed. The marker,        |
 | (and the anchored frame), are pasted at the insertion point. The          |
 | temporary file is deleted.                                                |
 +-------------------------------------------------------------------------- */

VoidT mmlAppendAnchoredFrame()
{
	BoolT	 		wroteMIF;
	ChannelT 		tempChannel;
	FilePathT		*currPathp, *pathp = NULL;
	F_ObjHandleT	tempDocId;

	currPathp = current_input_file();
	pathp = GenerateUniqueFilePath(currPathp);		/* Get path in directory with source file */
	F_FilePathFree(currPathp);

	if (!pathp) {									/* Well, that didn't work. Maybe the source file is in a place we can't write to */
		tempChannel = F_ChannelMakeTmp(1);			/* Just make a path somewhere we can write to */
		if (tempChannel) {
			pathp = F_GetFilePath(tempChannel);
			F_ChannelCloseTmp(tempChannel);
		}
	}
	if (pathp)
		tempChannel = F_ChannelOpen(pathp, "w+");

	if (!pathp || !tempChannel) {
		if (pathp)
			F_FilePathFree(pathp);
		mmlAssertFatal(False, MML_CANT_CREATE_TEMP_MIF_FILE);
	}

	wroteMIF = mmlWriteAnchoredFrameMIFToFile(tempChannel);
	F_ChannelClose(tempChannel);
	if (!wroteMIF) {
		F_DeleteFile(pathp);
		F_FilePathFree(pathp);
		mmlAssertFatal(False, MML_EOF_IN_MIF);
	}

	tempDocId = mmlOpenMIFFile(pathp);
	if (!tempDocId) {
		F_DeleteFile(pathp);
		F_FilePathFree(pathp);
		mmlAssertFatal(False, MML_CANT_OPEN_TEMP_MIF_FILE);
	}

	mmlCopyEverythingToClipboard(tempDocId);

	F_ApiClose(tempDocId, True);
	F_DeleteFile(pathp);
	F_FilePathFree(pathp);

	mmlAppendClipboard();
}


/* --------------------------------------------------------------------------+
 | Generates a unique file name for a temporary file in the directory        |
 | containing the supplied anchor path based on the supplied file name.      |
 +-------------------------------------------------------------------------- */
FilePathT *GenerateUniqueFilePath(pathp)
FilePathT *pathp;
{
	ErrorT	err;
	IntT 	counter = 0;
	FilePathT *anchorPathp, *newPathp = NULL;
	StringT fileName;
	StrBuffT fullName;

	anchorPathp = F_FilePathParent(pathp, &err);
	if (err || !anchorPathp)
		return(NULL);

	fileName = F_FilePathBaseName(pathp);

	loop {
		F_Sprintf(fullName, "%s%d", fileName, counter);
		newPathp = F_PathNameToFilePath(fullName, anchorPathp, FDefaultPath);
		if (!newPathp)
			break;

		if (F_FilePathProperty(newPathp, FF_FilePathExist) != FF_FilePathExist)
			break;

		F_FilePathFree(newPathp);
		counter++;
	}
	F_StrFree(fileName);
	F_FilePathFree(anchorPathp);
	return(newPathp);
}


/* --------------------------------------------------------------------------+
 | Writes the mif fragment from the input stream to the file named filename. |
 | The run of characters that constitute the mif fragment is determined by   |
 | the counting open brackets, '<', and close brackets, '>'. When the number |
 | of close brackets equals the number of open brackets, the end of the mif  |
 | fragment has been encountered. The bracket nesting depth is initialized   |
 | to 1 because the mml parser has already read 1 open bracket prior to      |
 | calling mmlAppendAnchoredFrame. Note that the open and close brackets     |
 | appear as the tokens STARTS_MACRO and ENDS_MACRO, rather than as the      |
 | characters '<' and '>'. The wrapper "<AFrames <Frame <ID 1>" ... ">>"     |
 | defines the anchored frame and gives it the identifier 1. The string      |
 | "<Para <ParaLine <AFrame 1>>>" creates a paragraph with a marker that     |
 | references the anchored frame, (by the identifier 1).                     |
 | If the temp file cannot be opened or if an end of file is encountered in  |
 | the middle of the mif, a fatal error occurs.                              |
 +-------------------------------------------------------------------------- */

BoolT mmlWriteAnchoredFrameMIFToFile(channel)
ChannelT channel;
{
	BoolT wroteMIF = True;
	IntT bracketNestingDepth = 1;

	if (!channel) return(True);			/* Make sure we get a channel here. It's successful if we don't because we nothing needs to be written to a channel that doesn't exist. */

	start_par();
	finish_string();

	F_Printf(channel, "<MIFFile 1.01> <AFrames <Frame <ID 1> <FrameType Below> \n");

	while (bracketNestingDepth > 0) {
		next_char();
		if (cur_type == STARTS_MACRO) {
			bracketNestingDepth++;
			F_Printf(channel, "%c", '<');
		} else if (cur_type == ENDS_MACRO) {
			bracketNestingDepth--;
			F_Printf(channel, "%c", '>');
		} else if (cur_char == EOF) {
			wroteMIF = False;
			break;
		} else {
			F_Printf(channel, "%c", cur_char);
		}
	}

	F_Printf(channel, "> <Para <ParaLine <AFrame 1>>> \n");
	F_ChannelFlush(channel);
	return(wroteMIF);
}

/* --------------------------------------------------------------------------+
 | Opens the mif file named filename as a FrameMaker document. Returns the   |
 | id of the document. It is a fatal error if the mif file cannot be opened. |
 +-------------------------------------------------------------------------- */

F_ObjHandleT mmlOpenMIFFile(pathp)
FilePathT *pathp;
{
	F_ObjHandleT fileId;
	StringT filename ;
	F_PropValsT paramsp, *returnParamsp = NULL;
	IntT i;

	paramsp = F_ApiGetOpenDefaultParams();

	/* open temporary doc invisibly */
	i = F_ApiGetPropIndex(&paramsp, FS_MakeVisible);
	paramsp.val[i].propVal.u.ival = False;

	i = F_ApiGetPropIndex(&paramsp, FS_RefFileNotFound);
	paramsp.val[i].propVal.u.ival = FV_AllowAllRefFilesUnFindable;

	i = F_ApiGetPropIndex(&paramsp, FS_ShowBrowser);
	paramsp.val[i].propVal.u.ival = False;

	filename = F_FilePathToPathName(pathp, FDefaultPath); 
	fileId = F_ApiOpen(filename, &paramsp, &returnParamsp);

	F_ApiDeallocatePropVals(&paramsp);
	F_ApiDeallocatePropVals(returnParamsp);

	return(fileId);
}

/* --------------------------------------------------------------------------+
 | The temporary FrameMaker document specified by docId contains an anchored |
 | frame. This anchored frame is represented by a marker at the beginning of |
 | the document. mmlCopyEverythingToClipboard copies the anchored frame to   |
 | the clipboard by selecting the marker and copying it to the clipboard.    |
 +-------------------------------------------------------------------------- */

VoidT mmlCopyEverythingToClipboard(docId)
F_ObjHandleT docId;
{
	F_ObjHandleT	firstFlowId;
	F_ObjHandleT	firstTextColumnId;
	F_ObjHandleT	firstParagraphId;
	F_TextRangeT	textRange;

	firstFlowId       = F_ApiGetId(FV_SessionId,docId,FP_MainFlowInDoc);
	firstTextColumnId = F_ApiGetId(docId,firstFlowId,FP_FirstTextFrameInFlow);
	firstParagraphId  = F_ApiGetId(docId,firstTextColumnId,FP_FirstPgf);

	textRange.beg.objId  = firstParagraphId;
	textRange.beg.offset = 0;
	textRange.end.objId  = firstParagraphId;
	textRange.end.offset = 1;

	F_ApiSetTextRange(docId,docId,FP_TextSelection,&textRange);

	F_ApiCopy(docId,0);
}

/* --------------------------------------------------------------------------+
 | Pastes the clipboard at the current insertion point. The current          |
 | insertion point is specified by the global variable insertionPoint.       |
 | The document that contains the current insertion point is specified by    |
 | the global variable docId. Advances insertionPoint by one character.      |
 | Therefore, the clipboard must contain exactly one character when          |
 | mmlAppendClipboard is called. This one character is the marker that       |
 | references the anchored frame to be included.                             |
 +-------------------------------------------------------------------------- */

VoidT mmlAppendClipboard()
{
	mmlInsertClipboard(docId,insertionPoint);
	++insertionPoint.offset;
}

/* --------------------------------------------------------------------------+
 | Pastes the clipboard at the location specified by insertionPoint in the   |
 | document specified by docId.                                              |
 +-------------------------------------------------------------------------- */

VoidT mmlInsertClipboard(docId,insertionPoint)
F_ObjHandleT	docId;
F_TextLocT      insertionPoint;
{
	F_TextRangeT textRange;

	textRange.beg = insertionPoint;
	textRange.end = insertionPoint;

	F_ApiSetTextRange(docId, docId, FP_TextSelection, &textRange);
	F_ApiPaste(docId, 0);
}

/*--------------------------------------------------------------------------+
| Opens up a channel where filename is specified by "filename".
+---------------------------------------------------------------------------*/
ChannelT  mmlChanOpen(filename, flag)
StringT   filename;
StringT   flag;
{
	PathEnumT plat;
	FilePathT *fp;
	ChannelT ch;
	
	plat = F_PathNameType(filename);
	if (!(fp = F_PathNameToFilePath(filename,(FilePathT *)NULL, plat)))
		return(NULL);
	
	ch = F_ChannelOpen(fp, flag);
	F_FilePathFree(fp);
	return (ch);
}
