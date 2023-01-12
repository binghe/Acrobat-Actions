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
 *	    cond
 *
 * General Description:
 *		Allows user to conditionalize a text selection with the "Comment" condition
 *		tag. Settings for the "Comment" condition remain unchanged. Or allows user to 
 *		remove the "Comment" condition from text selection.
 *
 * Invocation:
 *		Select a range of text and choose API->Add Comment Condition or choose
 *		API->Remove Comment Condition.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name cond>
 *			<Description Adds or removes "Comment" condition tag for text selection.>
 *			<Directory fdk_install_dir/samples/cond>
 *			<CommandLine $FAPIDIR/fa.cond>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.cond>
 *		to:
 *			<SharedLibrary fa.cond.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		cond=Standard,Adds or removes "Comment" condition tag for text selection,
 *			fdk_install_dir\samples\cond\debug\cond.dll, all 
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
#include "fencode.h"

/*
 *	Constants
 */
#define ADD_COND			1
#define REM_COND			2
typedef struct {
UIntT len; 
F_TypedValT *val; 
} TypedVals;

/*
 *	Prototypes
 */
VoidT DoAddCondition(F_ObjHandleT docId, F_ObjHandleT condId);
VoidT DoRemoveCondition(F_ObjHandleT docId, F_ObjHandleT condId);
VoidT RemoveCondition(F_ObjHandleT docId, F_ObjHandleT condId, TypedVals rangeList);

VoidT F_ApiInitialize(IntT initialization)
{
	F_ObjHandleT	menubarId;
	F_ObjHandleT	menuId;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	if(initialization == FA_Init_First){
		menubarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
		menuId = F_ApiDefineAndAddMenu(menubarId, "APIMenu", "API");
		F_ApiDefineAndAddCommand(ADD_COND, menuId,"AddCondCmd", "Add Comment Condition", "\\!AC");
		F_ApiDefineAndAddCommand(REM_COND, menuId,"RemCondCmd", "Remove Comment Condition", "\\!RC");
		F_ApiBailOut();
		}
}

VoidT F_ApiCommand(IntT command)
{
	F_ObjHandleT	docId;
	F_ObjHandleT	condId;
	
	docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
	if(!docId){
		F_ApiAlert("No current document.", FF_ALERT_CONTINUE_NOTE);
		return;
		}
	
	condId = F_ApiGetNamedObject(docId, FO_CondFmt, "Comment");
	if(!condId){
		F_ApiAlert("No \"Comment\" conditonal text format.", FF_ALERT_CONTINUE_NOTE);
		return;
		}
	
	switch(command){
		case ADD_COND:
		DoAddCondition(docId, condId);
		break;
		
		case REM_COND:
		DoRemoveCondition(docId, condId);
		break;
	}
}

/*
 *	Add the "Comment" condition format to the currently selected text.
 */
VoidT DoAddCondition(F_ObjHandleT docId, F_ObjHandleT condId)
{
	F_TextRangeT	tr;
	F_PropValT		prop;
	F_IntsT			conditions;
	
	conditions.len = 1;
	conditions.val = (IntT *)F_Alloc(sizeof(IntT), NO_DSE);
	
	if(conditions.val == NULL)
		return;
	
	conditions.val[0] = condId;
	
	tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
	if(!tr.beg.objId)
		return;
	
	prop.propIdent.num = FP_InCond;	
	prop.propIdent.name = NULL;
	prop.propVal.valType = FT_Ints;
	prop.propVal.u.isval = conditions;
	F_ApiSetTextPropVal(docId, &tr, &prop);
	F_ApiDeallocateInts(&conditions);
}


/*
 *	Remove the "Comment" condition format from the currently selected text.
 */
VoidT DoRemoveCondition(F_ObjHandleT docId, F_ObjHandleT condId)
{
	F_TextRangeT	tr, trItem;
	UIntT			i=0, j = 0;
	UIntT			index;
	F_TextItemsT	tis;
	F_TextLocT		loc;
	TypedVals		rangeList; 

	

	tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
	if(!tr.beg.objId)
	{
		F_ApiAlert("Please make a text selection.", FF_ALERT_CONTINUE_NOTE);
		return;
	}
	/*Get list of locations where the character properties change or a new paragraph begins.*/
	tis = F_ApiGetTextForRange(docId, &tr, FTI_PgfBegin|FTI_CharPropsChange);
	

	/*Allocate memory for a list of text ranges from one property change to the next*/
	rangeList.val = (F_TypedValT *)F_Alloc(sizeof(F_TypedValT), NO_DSE);
	/*Initialize the list*/
	rangeList.len = 0;
	if (!tis.len) /*Case of no property changes or new paragraphs within the selection*/
	{
		/*The list will have only one text range - the entire selection*/
		rangeList.val = (F_TypedValT *)F_Realloc(rangeList.val, sizeof(F_TypedValT)*(rangeList.len+1), NO_DSE);
		rangeList.val[rangeList.len].valType = FT_TextRange;
		rangeList.val[rangeList.len].u.trval = tr;
		rangeList.len++;
		/*Remove the "Comment" condition if it is applied to this range*/
		RemoveCondition(docId,condId, rangeList);

		/*Clean up*/
		F_ApiDeallocateVal(rangeList.val);
		return;
		
	}
	/*Unless selection begins with a new paragraph or property change, the index is the
	length of the text item list + 1.*/
	if ((tis.val[0].dataType==FTI_CharPropsChange)&(tr.beg.offset == tis.val[0].offset))
		index = tis.len;
	else 
		index = tis.len+1;
	trItem.beg = tr.beg;
	loc = trItem.beg;
	while (i < index)
	{

		/*If text item is a paragraph begin, set this paragraph as the objId of end 
		of the range and look at the next item in the list.*/
		while (tis.val[i].dataType == FTI_PgfBegin)
		{
			loc.objId = tis.val[i].u.idata;
			loc.offset = 0;
			i++;
		}
		/*Check to see if the property change is a change in conditions.*/
		if (tis.val[i].u.idata&FTF_CONDITIONTAG)
		{
			/*Determine the offset of the end of the range*/
			if (i < tis.len) 
				loc.offset = tis.val[i].offset;
			else 
				loc.offset = tr.end.offset;
			/*Get the text range and add to the list of ranges.*/
			trItem.end= loc;
			rangeList.val = (F_TypedValT *)F_Realloc(rangeList.val, sizeof(F_TypedValT)*(rangeList.len+1), NO_DSE);
			rangeList.val[rangeList.len].valType = FT_TextRange;
			rangeList.val[rangeList.len].u.trval  = trItem;
			rangeList.len++;
			i++;
			trItem.beg = trItem.end;
			loc.objId = trItem.end.objId;
		}
		else
		{
			/*Look at the next item on the list*/
			i++;
		}
	}
	/*Remove "Comment" condition if it exists in each of the text ranges of the list*/
	if (rangeList.len) RemoveCondition(docId,condId, rangeList);
	/*Clean up*/
	F_ApiDeallocateTextItems(&tis);
	F_ApiDeallocateVal(rangeList.val);
	return;
}

VoidT RemoveCondition(F_ObjHandleT docId, F_ObjHandleT condId, TypedVals rangeList)
{
	F_PropValsT		props;
	F_IntsT			conditions;
	F_IntsT			conds;
	UIntT			k,index, i, j = 0;
	F_TextRangeT	tr;

	for (k=0; k<rangeList.len; k++)
	{
		tr = rangeList.val[k].u.trval;
		props = F_ApiGetTextProps(docId, &tr.beg);
		if(!props.len)
			return;
		index = F_ApiGetPropIndex(&props, FP_InCond);
		if (!index)
			return;
		conditions = props.val[index].propVal.u.isval;
		if (conditions.len)
		{
			/*Allocate a list for the new conditions*/
			conds.val = (IntT *)F_Alloc(sizeof(IntT), NO_DSE);
		/*
		 *	Loop through all the conditions currently applied to
		 *	the text location. When we locate the condition that
		 *	we want to remove we skip it by not adding it to the
		 *	new list of conditional format ids.
		 */
		for(i = 0; i < conditions.len; i++){
			if(conditions.val[i] != (IntT)condId){
				conds.val = (IntT *)F_Realloc(conds.val, sizeof(IntT)*(j+1), NO_DSE);
				conds.val[j] = conditions.val[i];
				j++;
			}
		}
		conds.len = j;
		/*Set the new properties for the range*/
		props.val[index].propVal.u.isval = conds;
		F_ApiSetTextProps(docId, &tr, &props);	
		/*Clean up*/
		F_ApiDeallocatePropVals(&props);
		F_ApiDeallocateInts(&conditions);
		if (conds.len)
			F_ApiDeallocateInts(&conds);
	}
	}
}
