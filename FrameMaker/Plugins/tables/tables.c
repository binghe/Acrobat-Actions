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
 * Program tables:
 *	    tables
 *
 * General Description:
 *	1. ITEM1-	Deletes Text in a single table cell that is either
 *				selected or has an insertion point.
 *	2. ITEM2-	Gets the Row, Col position of a single selected cell.
 *	3. ITEM3-	Gets the Integer value representing the position of 
 *				the last Body Row.
 *	4. ITEM4-	Gets the Integer value representing the position of
 *				the first Body Row.
 *	5. ITEM5-	Determines whether a cell is set to Straddled or not.
 *	6. ITEM6-	Places the cursor at the end of the paragraph
 *				(within a cell) that it is currently inserted in.
 *
 * Invocation:
 *		Choose menu Items for each of the above choices. Menu Items will
 *		appear under the Table Menu
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name tables>
 *			<Description Additional table functionality>
 *			<Directory fdk_install_dir/samples/tables>
 *			<CommandLine $FAPIDIR/fa.tables>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.tables>
 *		to:
 *			<SharedLibrary fa.tables.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		tables=Standard, Additional table functionality,
 *			fdk_install_dir\samples\tables\debug\tables.dll, all 
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
#include "fstrings.h"
#include "futils.h"
#include "fdetypes.h"

#define ITEM1 1
#define ITEM2 2
#define ITEM3 3
#define ITEM4 4
#define ITEM5 5
#define ITEM6 6

VoidT DeleteTextInCell(F_ObjHandleT docId, F_ObjHandleT cellId);
F_ObjHandleT FindCellId(F_ObjHandleT docId, F_ObjHandleT tableId, IntT row, IntT col);
StringT GetCellLocation(F_ObjHandleT docId, F_ObjHandleT tableId);
IntT GetEndBodyRowNum(F_ObjHandleT docId, F_ObjHandleT tableId);
F_ObjHandleT GetCellId(F_ObjHandleT docId);
IntT GetRowNum(F_ObjHandleT docId, F_ObjHandleT tableId, F_ObjHandleT rowId);
IntT GetStartBodyRowNum(F_ObjHandleT docId, F_ObjHandleT tableId);
IntT CellIsStraddled(F_ObjHandleT docId, F_ObjHandleT cellId);
BoolT SetInsertionPointInCell(F_ObjHandleT docId, F_ObjHandleT cellId);

VoidT F_ApiInitialize(IntT init){
	F_ObjHandleT tableMenuId;
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		tableMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "TableMenu");
		if(tableMenuId){
			F_ApiDefineAndAddCommand(ITEM1, tableMenuId, "DELTEXTCMD", "Delete Text In Selected Cell", "");
			F_ApiDefineAndAddCommand(ITEM2, tableMenuId, "GETCELLPOSCMD", "Get Position of Selected Cell", "");
			F_ApiDefineAndAddCommand(ITEM3, tableMenuId, "GETENDBODYROWCMD", "Get Position of Last Body Row", "");
			F_ApiDefineAndAddCommand(ITEM4, tableMenuId, "GETSTARTBODYROWCMD", "Get Start of Body Row Position", "");
			F_ApiDefineAndAddCommand(ITEM5, tableMenuId, "ISCELLSTRADCMD", "Is Cell Straddled?", "");
			F_ApiDefineAndAddCommand(ITEM6, tableMenuId, "PUTINSERTCMD", "Put Insertion Point at End of Cell PGF1", "");
		}
		else
			F_ApiAlert("Problem in Finding Table Menu", FF_ALERT_CONTINUE_WARN);
		F_ApiBailOut();
		break;
	}
}

VoidT F_ApiCommand(command){
	F_ObjHandleT docId, cellId, tableId;
	StringT s;
	IntT endRowNum, strtRowNum, isStraddle;
	BoolT insertSet;
	
	docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
	if(!docId){
		F_ApiAlert("Please Open a Document Before Invoking this Command", FF_ALERT_CONTINUE_WARN);
		return;
	}

	switch(command){
	case ITEM1:
		cellId = GetCellId(docId);
		if(cellId == -1)
			F_ApiAlert("Please Select a Table Cell!", FF_ALERT_CONTINUE_WARN);
		else
			DeleteTextInCell(docId, cellId);
		break;
	case ITEM2:
		tableId = F_ApiGetId(FV_SessionId, docId, FP_SelectedTbl);
		if(F_ApiGetObjectType(docId, tableId) == FO_Tbl){
			s = GetCellLocation(docId, tableId);
			if(s == NULL)
				F_ApiAlert("Please Select a Single Cell", FF_ALERT_CONTINUE_WARN);
			else
				F_Printf(NULL, "Cell Location is %s\n", s);
		}
		else
			F_ApiAlert("No Table Selected!", FF_ALERT_CONTINUE_WARN);
		break;
	case ITEM3:
		tableId = F_ApiGetId(FV_SessionId, docId, FP_SelectedTbl);
		if(F_ApiGetObjectType(docId, tableId) == FO_Tbl){
			endRowNum = GetEndBodyRowNum(docId, tableId);
			F_Printf(NULL, "End Body Row Num is %d\n", endRowNum);
		}
		else
			F_ApiAlert("No Table Selected!", FF_ALERT_CONTINUE_WARN);
		break;
	case ITEM4:
		tableId = F_ApiGetId(FV_SessionId, docId, FP_SelectedTbl);
		if(F_ApiGetObjectType(docId, tableId) == FO_Tbl){
			strtRowNum = GetStartBodyRowNum(docId, tableId);
			F_Printf(NULL, "Start Body Row Num is %d\n", strtRowNum);
		}
		else
			F_ApiAlert("No Table Selected!", FF_ALERT_CONTINUE_WARN);
		break;
	case ITEM5:
		cellId = GetCellId(docId);
		if(cellId == -1)
			F_ApiAlert("Please Select a Table Cell!", FF_ALERT_CONTINUE_WARN);
		else{
			isStraddle = CellIsStraddled(docId, cellId);
			if(isStraddle != 4)
				F_ApiAlert("Cell Is Straddled!", FF_ALERT_CONTINUE_WARN);
			else
				F_ApiAlert("Cell Is Not Straddled!", FF_ALERT_CONTINUE_WARN);
		}			
		break;
	case ITEM6:
		cellId = GetCellId(docId);
		if(cellId == -1)
			F_ApiAlert("Please Select a Table Cell!", FF_ALERT_CONTINUE_WARN);
		else{
			insertSet = SetInsertionPointInCell(docId, cellId);
			if(insertSet == True)
				F_ApiAlert("Insertion Point Moved to End!", FF_ALERT_CONTINUE_WARN);
			else
				F_ApiAlert("Insertion Point Not Moved!", FF_ALERT_CONTINUE_WARN);
		}
		break;
	default:
		break;
	}
}

VoidT DeleteTextInCell(F_ObjHandleT docId, F_ObjHandleT cellId)
{
	F_ObjHandleT pgfIdFirst, pgfIdLast;
	F_TextRangeT tr;
	F_TextItemsT ti;

	pgfIdFirst = F_ApiGetId(docId, cellId, FP_FirstPgf);
	pgfIdLast = F_ApiGetId(docId, cellId, FP_LastPgf);

	tr.beg.objId = pgfIdFirst;
	tr.beg.offset = 0;
	tr.end.objId = pgfIdLast;
	ti = F_ApiGetText(docId, pgfIdLast, FTI_PgfEnd);
	tr.end.offset = ti.val[0].offset;
	F_ApiDeallocateTextItems(&ti);

	F_ApiDeleteText(docId, &tr);
}

F_ObjHandleT FindCellId(F_ObjHandleT docId, F_ObjHandleT tableId, IntT row, IntT col)
{
	F_ObjHandleT cellId, rowId;
	UIntT i = 0;

	rowId = F_ApiGetId(docId, tableId, FP_FirstRowInTbl);
	for(i = 0; i < (UIntT)row; i++)
		rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl);

	cellId = F_ApiGetId(docId, rowId, FP_FirstCellInRow);
	for(i = 0; i < (UIntT)col; i++)
		cellId = F_ApiGetId(docId, cellId, FP_NextCellInRow);
	return(cellId);
}

StringT GetCellLocation(F_ObjHandleT docId, F_ObjHandleT tableId)
{
	F_ObjHandleT bottomRowId, topRowId;
	IntT row = 0, firstCol = 0, lastCol = 0, num = 0, i = 0;
	StringT s = NULL;

	firstCol = F_ApiGetInt(docId, tableId, FP_LeftColNum);
	lastCol = F_ApiGetInt(docId, tableId, FP_RightColNum);
	if(firstCol != lastCol)
		return(NULL);
  
	bottomRowId = F_ApiGetId(docId, tableId, FP_BottomRowSelection);
	topRowId = F_ApiGetId(docId, tableId, FP_TopRowSelection);
	if(topRowId != bottomRowId)
   	return(NULL);

	row = GetRowNum(docId, tableId, topRowId);
	if(row == -1)
   	return(NULL);

	s = F_StrNew(256);
	i = F_Sprintf(s, "R%d", row + 1);
	i += F_Sprintf(s + i, " C%d", firstCol + 1);

	return(s);
}

IntT GetEndBodyRowNum(F_ObjHandleT docId, F_ObjHandleT tableId)
{
	F_ObjHandleT rowId;
	IntT count = 0;

	rowId = F_ApiGetId(docId, tableId, FP_FirstRowInTbl);
	if(!rowId)
		return(-1);

	while(F_ApiGetInt(docId, rowId, FP_RowType) == FV_ROW_HEADING)
	{
		rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl);
		count++;
	}

	while(F_ApiGetInt(docId, rowId, FP_RowType) == FV_ROW_BODY)
	{
		rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl);
		count++;
	}
  
	return(count -1);
}

F_ObjHandleT GetCellId(F_ObjHandleT docId)
{
	F_ObjHandleT cellId, tableId, bottomRowId, topRowId;
	IntT firstCol, lastCol, row;
	F_TextRangeT tr;
	
	tr = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
	cellId = F_ApiGetId(docId, tr.beg.objId, FP_InTextObj);
	if(F_ApiGetObjectType(docId, cellId) != FO_Cell)
	{
		tableId = F_ApiGetId(FV_SessionId, docId, FP_SelectedTbl);
		if(!tableId)
			return(-1);

		firstCol = F_ApiGetInt(docId, tableId, FP_LeftColNum);
		lastCol = F_ApiGetInt(docId, tableId, FP_RightColNum);
		if(firstCol != lastCol)
			return(-1);

		bottomRowId = F_ApiGetId(docId, tableId, FP_BottomRowSelection);
		topRowId = F_ApiGetId(docId, tableId, FP_TopRowSelection);
		if(topRowId != bottomRowId)
			return(-1);

		row = GetRowNum(docId, tableId, topRowId);
		cellId = FindCellId(docId, tableId, row, firstCol);
		if(!cellId)
			return(-1);
	}
	return(cellId);
}

IntT GetRowNum(F_ObjHandleT docId, F_ObjHandleT tableId, F_ObjHandleT rowId)
{
	F_ObjHandleT firstRowId;
	IntT count = 0;

	firstRowId = F_ApiGetId(docId, tableId, FP_FirstRowInTbl);
	if(!firstRowId)
		return(-1);
	
	if(!rowId)
		return(-1);

	while(rowId != firstRowId)
	{
		count++;
		firstRowId = F_ApiGetId(docId, firstRowId, FP_NextRowInTbl);
	}

	return(count);
}

IntT GetStartBodyRowNum(F_ObjHandleT docId, F_ObjHandleT tableId)
{
	F_ObjHandleT rowId;
	IntT count = 0;

	rowId = F_ApiGetId(docId, tableId, FP_FirstRowInTbl);
	if(!rowId)
		return(-1);

	while(F_ApiGetInt(docId, rowId, FP_RowType) == FV_ROW_HEADING)
	{
		rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl);
		count++;
	}

	return(count);
}

IntT CellIsStraddled(F_ObjHandleT docId, F_ObjHandleT cellId)
{
	/*
	 * If the cell is in a straddle but not the first cell return 1.
    * If the cell is the first cell in a straddle, or it is not in a 
    * straddle go to next check.
    */ 
	if(F_ApiGetInt(docId, cellId, FP_CellIsStraddled) == True)
		return(1);
	
	/* 
	 * If the cell is the first cell in a horizontal straddle, 
    * return 2.
    */
	if(F_ApiGetInt(docId, cellId, FP_CellNumColsStraddled) > 1)
		return(2);

	/*
	 * If the cell is the first cell in a vertical straddle, 
    * return 3.
    */
	if(F_ApiGetInt(docId, cellId, FP_CellNumRowsStraddled) > 1)
		return(3);

	/* If the cell is not in a straddle return 4. */
	return(4);
}

BoolT SetInsertionPointInCell(F_ObjHandleT docId, F_ObjHandleT cellId)
{
	F_ObjHandleT pgfId;
	F_TextRangeT tr;
	F_TextItemsT tis;

	pgfId = F_ApiGetId(docId, cellId, FP_FirstPgf);
	tr.beg.objId = tr.end.objId = pgfId;
	tis = F_ApiGetText(docId, pgfId, FTI_PgfEnd);
	if(tis.len > 0)
		tr.beg.offset = tr.end.offset = tis.val[0].offset;
	else
	{
		F_ApiDeallocateTextItems(&tis);
		return(False);
	}

	F_ApiDeallocateTextItems(&tis);
	F_ApiSetTextRange(FV_SessionId, docId, FP_TextSelection, &tr);
	return(True);
}
