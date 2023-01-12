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
 *		addstructrow
 *	
 *	General Description:
 *		Sample program which allows the user to select a table element (not 
 *		necessarily named table, but the element which represents an FM table) 
 *		and add a body row at the top of the table body. Requires a structured 
 *		document as it is based on element selection rather than table selection.
 *
 *	Invocation:
 *		Open FM structured document and select a table element. Click Table on 
 *		the Main Menu and then click "Add Row to Element".
 *
 *   Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name addstructrow>
 *			<Description Adds body row to top of table body in a table element.>
 *			<Directory fdk_install_dir/samples/addstructrow>
 *			<CommandLine $FAPIDIR/fa.addstructrow>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.addstructrow>
 *		to:
 *			<SharedLibrary fa.addstructrow.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your product.ini (for example, maker.ini) file:
 *
 *		addstructrow=Standard,Add a row to structured table element, 
 *			fdk_install_dir\samples\addstructrow\debug\addstructrow.dll, structured 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 *********************************************************************************************/


#include "fapi.h"
#include "fstrings.h"
#include "futils.h"
#include "fdetypes.h"

#define ITEM1 1


VoidT AddRowToTable(F_ObjHandleT docId, F_ObjHandleT elementId);

VoidT F_ApiInitialize(IntT init){
	F_ObjHandleT tableMenuId, cmdId;

	/*Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");
	
	switch(init){
		case FA_Init_First:
			tableMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "TableMenu");
			cmdId = F_ApiDefineAndAddCommand(ITEM1, tableMenuId, "ADDTBLROW", "Add Row to Element", "");
			/*One can't add a row to a table w/o a doc open so let's disable the command
			unless a doc is open.*/ 
			F_ApiSetInt(tableMenuId, cmdId, FP_EnabledWhen,FV_ENABLE_NEEDS_DOCP_ONLY);
			F_ApiBailOut();
		break;
	}
	return;
}

VoidT F_ApiCommand(command)
{
	F_ObjHandleT docId, elementId;
	IntT elementType;
	F_ElementRangeT elementRange;

	docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);

	switch(command){
	case ITEM1:

		/*Get the element range for the selection*/ 
		elementRange = F_ApiGetElementRange(0, docId, FP_ElementSelection);

		/*Make sure that it's a table that is selected*/
		elementId = elementRange.beg.childId;
		elementType = F_ApiGetInt(docId, elementId, FP_ElementType);
		if(elementType != FV_FO_TBL)
		{
			F_ApiAlert("Please select a table element!", FF_ALERT_CONTINUE_WARN);
		return;
		}
		else
			/*Call the function to add a body row before the first body row in the table*/
			AddRowToTable(docId, elementId);
			return;
		break;
	
	default:
		break;
	}
	return;
}

VoidT AddRowToTable(F_ObjHandleT docId, F_ObjHandleT elementId)
{
	F_ObjHandleT tableId, rowId;
	IntT rowType;
	
	/*Get the table object Id using the table element Id
	Table element Id and table object Id are not the same. Table properties like
	FP_FirstRowInTbl are properties of table objects not table elements.*/
	tableId = F_ApiGetId(docId, elementId, FP_Object);

	/*Get the Id for the first row in the table.*/
	rowId = F_ApiGetId(docId, tableId, FP_FirstRowInTbl);

	/* - Note - If you wanted to add a row to the bottom of a table body, you could do so 
	at this point with "	F_ApiAddRows(docId, rowId, FV_Body, 1);"

	But this exercise is to add a body row to the top of a table body, which requires us
	to know the ID of the current first body row of the table 

	Check to see if first row is a body row.*/

	rowType = F_ApiGetInt(docId, rowId, FP_RowType);
	if (rowType == FV_ROW_BODY)
	{
		/*Add a body row above the current first row and we're done.*/
		F_ApiAddRows(docId, rowId, FV_Above, 1);
		return;
	}

	/*First row is heading row. Continue checking next row until a body row is reached.*/
	rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl);
	rowType = F_ApiGetInt(docId, rowId, FP_RowType);

	while (rowType != FV_ROW_BODY)
	{
		rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl);
		rowType = F_ApiGetInt(docId, rowId, FP_RowType);
	}

	/*add a body row above the original first row of the table body.*/ 
	F_ApiAddRows(docId, rowId, FV_Above, 1);
	return;
}
