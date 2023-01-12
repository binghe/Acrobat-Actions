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
 *   Program Name:
 *		tag
 *
 *   General Description:
 *		Applies the emphasis character tag to text with Italic style.
 *
 *   Invocation:
 *		Open a document and apply Italic format to various text selections. 
 *		From the FDK Class Menu, choose "Tag italic text".
 *
 *   Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name tag>
 *			<Description Replaces adhoc italic formatting with emphasis 
 *			 character tag.>
 *			<Directory fdk_install_dir/samples/tag>
 *			<CommandLine $FAPIDIR/fa.tag>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.tag>
 *		to:
 *			<SharedLibrary fa.tag.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		tag=Standard,Replaces adhoc italic formatting with emphasis 
 *		character tag, fdk_install_dir\samples\tag\debug\tag.dll, all			 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *

************************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "fprogs.h"
#include "fencode.h"

#include "cutils.h"

#define MAXSTRING 255
#define TAG_ITALIC_CMD 1

VoidT tagText(F_ObjHandleT, F_ObjHandleT, IntT);
IntT getItalicIndex();
BoolT getItalicStatus(F_ObjHandleT, F_ObjHandleT, IntT, IntT);

VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		addToClassMenu(TAG_ITALIC_CMD, (StringT) "tagItalicCmd", (StringT) "Tag italic text", (StringT) "\\!TI");
		F_ApiBailOut();
		break;
	case FA_Init_DocReport:
		F_ApiBailOut();
		F_ApiAlert((StringT) "Client is misregistered as document report.", FF_ALERT_CONTINUE_WARN);
		break;
	}
}

VoidT F_ApiCommand(command)
IntT command;{
	F_ObjHandleT docId, parId; /* active document */
	F_ObjHandleT graphicId; /* graphic object ID */
	IntT objType; /* type of graphic object */
	IntT italicIndex;
	
	F_ApiBailOut();
	switch(command){
	case TAG_ITALIC_CMD:
		/*Get the index number for Italic style from FP_FontAngleNames list*/ 
		italicIndex = getItalicIndex();
		
		if(italicIndex !=99)
		{
			docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
			if(!docId){
				F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
				return;
			}
			/*Walk through the list of paragraphs in the doc, find each italicized string
			and set the FP_CharTag to "Emphasis".*/
			parId = F_ApiGetId(FV_SessionId, docId, FP_FirstPgfInDoc);
			while (parId)
			{
				tagText(docId, parId, italicIndex);
				parId = F_ApiGetId(docId, parId, FP_NextPgfInDoc);
			}
			/*Find each italicized string in each textline and set FP_CharTag to "Emphasis".*/
			graphicId = F_ApiGetId(FV_SessionId, docId, FP_FirstGraphicInDoc);
			while(graphicId){
				objType = F_ApiGetObjectType(docId, graphicId);
				if(objType == FO_TextLine)
					tagText(docId, graphicId,  italicIndex);
				graphicId = F_ApiGetId(docId, graphicId, FP_NextGraphicInDoc);
			}
		}
		else
			F_ApiAlert((StringT) "Italic style is unavailable. Unable to proceed.", FF_ALERT_CONTINUE_WARN);
		break;
	}
}

/* returns index of italic style if one is available, otherwise 99 */
IntT getItalicIndex(){
	/* Determine index of italic in the list of font angle names */
	F_StringsT angleNames;	/* font angle names */
	UIntT italicIndex; /* index into array of font angles */
	
	angleNames = F_ApiGetStrings(FV_SessionId, FV_SessionId, FP_FontAngleNames);
	for (italicIndex=0; italicIndex<angleNames.len && !F_StrEqual((StringT) "Italic", angleNames.val[italicIndex]); italicIndex++);
	F_ApiDeallocateStrings(&angleNames);
	if (italicIndex == angleNames.len)
		italicIndex = 99;
	return(italicIndex);
}

/* Returns True if text object passed in is italic at offset stated. */
/* Object is textline or paragraph */
BoolT getItalicStatus(F_ObjHandleT docId, F_ObjHandleT objId, IntT offset, IntT italicIndex)
	{
	F_PropValsT textProps;
	F_TextLocT textLoc;
	IntT propIndex; /* index into property list */

	/* set text location */
	textLoc.objId = objId;
	textLoc.offset = offset;
	/* get characteristics at location specified */
	textProps = F_ApiGetTextProps(docId, &textLoc);
	/* get the index of the font angle property */
	propIndex = F_ApiGetPropIndex(&textProps, FP_FontAngle);
	/* determine whether font angle is Italic */
	if(textProps.val[propIndex].propVal.u.ival == italicIndex)
	{
		F_ApiDeallocatePropVals(&textProps);
		return True;
	}
	else
	{
		F_ApiDeallocatePropVals(&textProps);
		return False;
	}
}

/*Applies "Emphasis" character tag to italicized text.*/
VoidT tagText(F_ObjHandleT docId, F_ObjHandleT objId, IntT italicIndex)
{
	F_TextRangeT textRange; 
	F_TextItemsT textItems; 
	F_TextItemT item; 
	F_ObjHandleT varId, xrefId;
	UIntT i; 
	IntT strLength;
	F_TypedValT setVal;

	
	setVal.valType = FT_String;
	setVal.u.sval = F_StrCopyString((StringT) "Emphasis");

	/*Get text items with text */
	textItems = F_ApiGetText(docId, objId, FTI_String | FTI_VarBegin | FTI_XRefBegin);
	/*Walk through the list of text items and apply Emphasis tag to italicized text.*/
	for(i=0; i<textItems.len; i++)
	{
		item = textItems.val[i];
		switch(item.dataType)
		{
		case FTI_String:
			/*Set beginning of text range for this item.*/ 
			textRange.beg.objId = objId;
			textRange.beg.offset = item.offset;
			/*Check to see if item is Italic.*/
			if ((getItalicStatus(docId, textRange.beg.objId, textRange.beg.offset, italicIndex)==True))
			{
				/*If item is Italic, set the Text Range for the item and apply Emphasis tag.*/
				strLength = F_StrLen(item.u.sdata);
				textRange.end.objId = objId;
				textRange.end.offset = textRange.beg.offset + strLength;
				F_ApiSetTextVal(docId, &textRange, FP_CharTag, &setVal);
			}
			break;

		case FTI_VarBegin:
			/*Set beginning of text range for this item.*/ 
			textRange.beg.objId = objId;
			textRange.beg.offset = item.offset;
			/*Check to see if item is Italic.*/
			if ((getItalicStatus(docId, textRange.beg.objId, textRange.beg.offset, italicIndex)==True))
			{
				/*If item is Italic, set the Text Range for the item and apply Emphasis tag.*/
				varId = item.u.idata;
				textRange = F_ApiGetTextRange(docId, varId, FP_TextRange);
				textRange.end.offset = textRange.end.offset +1;
				F_ApiSetTextVal(docId, &textRange, FP_CharTag, &setVal);
			}
			break;
		case FTI_XRefBegin:
			/*Set beginning of text range for this item.*/
			textRange.beg.objId = objId;
			textRange.beg.offset = item.offset;
			/*Check to see if item is Italic.*/
			if ((getItalicStatus(docId, textRange.beg.objId, textRange.beg.offset, italicIndex)==True))
			{
				/*If item is Italic, set the Text Range for the item and apply Emphasis tag.*/
				xrefId = item.u.idata;
				textRange = F_ApiGetTextRange(docId, xrefId, FP_TextRange);
				textRange.end.offset = textRange.end.offset + 1;
				F_ApiSetTextVal(docId, &textRange, FP_CharTag, &setVal);
			}
			break;
		}
	}
	F_ApiDeallocateTextItems(&textItems);
	F_ApiDeallocateVal(&setVal);
}