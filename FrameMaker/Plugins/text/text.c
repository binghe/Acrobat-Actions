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
 *	    text
 *
 * General Description:
 *		Gets text and prints it to console, adds text, deletes text, changes
 *		text point size and color properties.  
 *
 * Invocation:
 *		From the document you wish to add/delete/change text, bring       
 *		up TextApi	->Get Text														
 *					->Insert Text										
 *					->Delete Text										
 *					->Color Text										
 *					->Change Font Size		
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name text>
 *			<Description Manipulating text and text properties>
 *			<Directory fdk_install_dir/samples/text>
 *			<CommandLine $FAPIDIR/fa.text>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.text>
 *		to:
 *			<SharedLibrary fa.text.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		text=Standard, Manipulating text and text properties,
 *			fdk_install_dir\samples\text\debug\text.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fapi.h" 
#include "fdetypes.h"
#include "fstrings.h"
#include "futils.h"
#include "fmemory.h"

#include "utils.h"

#define TEST1 	 1
#define TEST2 	 2
#define TEST3 	 3
#define TEST4 	 4
#define TEST5 	 5

#define pts (MetricT) 65536 /* A Frame metric point. */

VoidT F_ApiInitialize(IntT initialization)
{
	F_ObjHandleT menuBarId, menuId;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(initialization)
	{
	case FA_Init_First:
		menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
		menuId = F_ApiDefineAndAddMenu(menuBarId, "APIMenu", "TextApi");
		F_ApiDefineAndAddCommand(TEST1, menuId, (StringT)"GetTextCmd", "Get Text", "\\!GT");
		F_ApiDefineAndAddCommand(TEST2, menuId, (StringT)"AddTextCmd", "Insert Text", "\\!IT");
		F_ApiDefineAndAddCommand(TEST3, menuId, (StringT)"DeleteTextCmd", "Delete Text", "\\!DT");
		F_ApiDefineAndAddCommand(TEST4, menuId, (StringT)"ColorTextCmd", "Color Text", "\\!CT");
		F_ApiDefineAndAddCommand(TEST5, menuId, (StringT)"FontSizeCmd", "Change Font Size", "\\!FT");
		F_ApiBailOut();
		break;
	default:
		break;
	}
}

VoidT F_ApiCommand(IntT command)
{
	F_ObjHandleT docId, colorId;
	StringT string = NULL;
	F_TextRangeT tr;
	F_TextItemsT textItems;
	F_PropValsT props;
	IntT i = 0;

	F_FdeInit();
	docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
	if(!docId)
		F_ApiAlert("Please selected Document.", FF_ALERT_CONTINUE_WARN);

	switch(command)
	{
	/* Get text from selection. */
	case TEST1:
		tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
		if((!tr.beg.objId)||((tr.beg.objId == tr.end.objId)&&(tr.beg.offset == tr.end.offset)))
		{
			F_ApiAlert("Please select some text and try again.", FF_ALERT_CONTINUE_WARN);
			break;
		}
		textItems = F_ApiGetTextForRange(docId, &tr, FTI_String);
		string = CreateStringFromTextItems(textItems);
		F_Printf(NULL, "String = %s\n", string);

		/* Clean up. */
		if(string != NULL)
			F_Free(string);
		break;

	/* Add text. */
	case TEST2:
		tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
		if(!tr.beg.objId)
		{
			F_ApiAlert("Please select an insertion point and try again.", FF_ALERT_CONTINUE_WARN);
			break;
		}
		if(!((tr.beg.objId == tr.end.objId)&&(tr.beg.offset == tr.end.offset)))
		{
			if(F_ApiAlert("Do you wish to overwrite the selected text?", FF_ALERT_NO_DEFAULT))
			break;
		}
		F_ApiAddText(docId, &tr.beg, (StringT)"The new CoffeeTool\011");
		break;

	/* Delete selected text. */
	case TEST3:
		tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
		if((!tr.beg.objId)||((tr.beg.objId == tr.end.objId)&&(tr.beg.offset == tr.end.offset)))
		{
			F_ApiAlert("Please select some text and try again.", FF_ALERT_CONTINUE_WARN);
			break;
		}
		
		F_ApiDeleteText(docId, &tr);
		break;

	/* Change the color of selected text to Red. */
	case TEST4:
		tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
		if((!tr.beg.objId)||((tr.beg.objId == tr.end.objId)&&(tr.beg.offset == tr.end.offset)))
		{
			F_ApiAlert("Please select some text and try again.", FF_ALERT_CONTINUE_WARN);
			break;
		}
		colorId = F_ApiGetNamedObject(docId, FO_Color, (StringT)"Red");
		props = F_ApiGetTextProps(docId, &tr.beg);
		i = F_ApiGetPropIndex(&props, FP_Color);
		props.val[i].propVal.u.ival = colorId;
		F_ApiSetTextProps(docId, &tr, &props);
		F_ApiDeallocatePropVals(&props);
		break;

	/* Change the font size of the selected text to 30 points. */
	case TEST5:
		tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
		if((!tr.beg.objId)||((tr.beg.objId == tr.end.objId)&&(tr.beg.offset == tr.end.offset)))
		{
			F_ApiAlert("Please select some text and try again.", FF_ALERT_CONTINUE_WARN);
			break;
		}
		/* Allocate memory for the property list. */
		props = F_ApiAllocatePropVals(1);
		/* Set up the properties. */
		props.val[0].propIdent.num = FP_FontSize;
		props.val[0].propVal.valType = FT_Metric;
		props.val[0].propVal.u.ival = 30 * pts;
		/* Apply the property list to the text selection. */
		F_ApiSetTextProps(docId, &tr, &props);
		/* Deallocate memory referenced by the property list. */
		F_ApiDeallocatePropVals(&props);
		break;

	default:
		break;
	}
}


