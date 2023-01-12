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
 * Program sumcols:
 *	    sumcols
 *
 * General Description:
 *		Sums the columns in a table. It sums only integer values.
 *		To obtain a number it looks for digits at the start of a table
 *		cell. If a non-digit is found, it looks no further. The sum is
 *		placed in a footer row at the end of the table. Values in
 *		header rows are ignored.
 *
 * Invocation:
 *		Enter integer values in Table cells. With the Table selected, from
 *		the Table menu, choose "Sum Columns".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name sumcols>
 *			<Description Sums integers in table columns>
 *			<Directory fdk_install_dir/samples/sumcols>
 *			<CommandLine $FAPIDIR/fa.sumcols>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.sumcols>
 *		to:
 *			<SharedLibrary fa.sumcols.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		sumcols=Standard, Sums integers in table columns,
 *			fdk_install_dir\samples\sumcols\debug\sumcols.dll, all 
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
#include "fcharmap.h"
#include "fstrings.h"
#include "fmemory.h"
#include "fencode.h"

#include "cutils.h"

#define SUM_COLUMNS 1  /* command constant */
#define MAXSTRING (IntT) 255 /* maximum string size */
  
IntT getLeadingNumberFromCell();
StringT getLeadingIntegerString();
VoidT sumTable();
IntT sumColumn();
VoidT clearRow();
VoidT clearCell();
VoidT writeSum();

VoidT F_ApiInitialize(init)
IntT init;{
	F_ObjHandleT tableMenuId;
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
	/* Add the TableMenu to the Maker main menu bar assuming there is no already
	 * a TableMenu some where. Once there is a table menu, add the sumCols command
	 * to it. Bail out when done.*/
		tableMenuId = addCommandToMenu((StringT) "TableMenu", SUM_COLUMNS, (StringT) "sumColsCmd", (StringT) "Sum Columns", (StringT) "\\!SC");
		F_ApiBailOut();
		break;
	case FA_Init_Subsequent:
		/* Initialize the FDE for later use */
		F_FdeInit();
		break;
	case FA_Init_DocReport:
		/* warn user of error in apiclients file */
		F_ApiAlert("Client is misregistered as document report. Check your apiclients file", FF_ALERT_CONTINUE_WARN);
		break;
	} /* end switch */
}

/* Do the column addition upon user request. */
VoidT F_ApiCommand(command)
IntT command;{
	F_ObjHandleT docId; /* active document ID */
	F_ObjHandleT tableId; /* ID of table with columns to be added */
	
	F_ApiBailOut(); /* bail out when done */
	switch(command){
	case SUM_COLUMNS:
		/* Get the active document. */
		docId = F_ApiGetId(FV_SessionId, FV_SessionId,FP_ActiveDoc);
		if(!docId){
			F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		/* Get the selected table. */
		tableId = F_ApiGetId(FV_SessionId, docId, FP_SelectedTbl);
		/* Warn the user if no table selected, otherwise proceed with column sums. */
		if(!tableId){
			F_ApiAlert((StringT) "Select a table before invoking this command.", FF_ALERT_CONTINUE_NOTE);
			return;
		}
		else  /* got table */
			sumTable(docId, tableId);
		break; /* end sumcols */
	}
}

VoidT sumTable(docId, tableId)
F_ObjHandleT docId;
F_ObjHandleT tableId;{
	F_ObjHandleT rowId; /* row ID */
	F_ObjHandleT cellId; /* cell ID */
	F_ObjHandleT sumRowId; /* ID of sum row in table */
	F_ObjHandleT sumCellId; /* ID of sum cell in sum row */
	IntT rowType; /* body, header or footer ? */
	IntT sum;
	/* Get last row in table, if it is not footer row, add footer row */
	sumRowId = F_ApiGetId(docId, tableId, FP_LastRowInTbl);
	if(!(F_ApiGetInt(docId, sumRowId, FP_RowType) == FV_ROW_FOOTING)){
		F_ApiAddRows(docId, sumRowId, FV_Footing, 1);
		sumRowId = F_ApiGetId(docId, tableId, FP_LastRowInTbl);
	}
	else{
	/*  Clear row to be used to hold sums.
	 *  Consider adding a user warning before destroying data. */
		clearRow(docId, sumRowId);
	}
	/* Get first body row */
	rowId = F_ApiGetId(docId, tableId, FP_FirstRowInTbl);
	rowType = F_ApiGetInt(docId, rowId, FP_RowType);
	while(rowType != FV_ROW_BODY){
		rowId = F_ApiGetId(docId, rowId, FP_NextRowInTbl);
		rowType = F_ApiGetInt(docId, rowId, FP_RowType);
	}
	/* Get first cell in first body row and in sum row, then sum that column.
	 * sumCellId hold result of the addition */
	cellId = F_ApiGetId(docId, rowId, FP_FirstCellInRow);
	sumCellId = F_ApiGetId(docId, sumRowId, FP_FirstCellInRow);
	while(cellId){
		sum = sumColumn(docId, cellId, sumCellId);
		writeSum(docId, sumCellId, sum);
		cellId = F_ApiGetId(docId, cellId, FP_NextCellInRow);
		sumCellId = F_ApiGetId(docId, sumCellId, FP_NextCellInRow);
	}
}

/* clear all text in row's cells */
VoidT clearRow(docId, rowId)
F_ObjHandleT docId;
F_ObjHandleT rowId;{
	F_ObjHandleT cellId;
	cellId = F_ApiGetId(docId, rowId, FP_FirstCellInRow);
	while(cellId){
		clearCell(docId, cellId);
		cellId = F_ApiGetId(docId, cellId, FP_NextCellInRow);
	}
}

/* clear all text in cell */
VoidT clearCell(docId, cellId)
F_ObjHandleT docId;
F_ObjHandleT cellId;{
	F_TextItemsT tItems;
	F_TextRangeT tRange;
	tItems = F_ApiGetText(docId, cellId, FTI_PgfEnd);
	tRange.beg.objId = tRange.end.objId = tItems.val[0].u.idata;
	tRange.beg.offset = 0;
	tRange.end.offset = tItems.val[0].offset;
	F_ApiDeleteText(docId, &tRange);
	F_ApiDeallocateTextItems(&tItems);
}

/* sum cells in column beginning with cellId and put result in sumCellId */
IntT sumColumn(docId, cellId, sumCellId)
F_ObjHandleT docId;
F_ObjHandleT cellId;
F_ObjHandleT sumCellId;{
	IntT sum;
	sum = 0;
	
	while(cellId != sumCellId){
		sum += getLeadingNumberFromCell(docId, cellId);
		cellId = F_ApiGetId(docId, cellId, FP_CellBelowInCol);
	}
	return(sum);
}

/* write sum to specified cell */
VoidT writeSum(docId, sumCellId, sum)
F_ObjHandleT docId;
F_ObjHandleT sumCellId;
IntT sum;{
	F_ObjHandleT pgfId;
	F_TextLocT textLoc; /* text location in cell */
	StringT numString; /* cell number after conversion to string */
	pgfId = F_ApiGetId(docId, sumCellId, FP_FirstPgf);
	textLoc.objId = pgfId;
	textLoc.offset = 0;
	/* Convert number from array to a string and write it to cell. */
	numString = F_StrNew(MAXSTRING + 1);
	F_StrTrunc(numString, 0);
	F_StrCatIntN(numString, sum, MAXSTRING);
	F_ApiAddText(docId, &textLoc, numString);
	if(numString != NULL)
		F_Free(numString);
}

/* Get number from table  cell. */
IntT getLeadingNumberFromCell(docId, cellId)
F_ObjHandleT docId; /* document with table */
F_ObjHandleT cellId; /* cell ID */{
	F_TextItemsT textItems; /* text items in this paragraph */
	UIntT i; /* index to text item array */
	IntT num; /* number found in cell */
	IntT cellStrLen;
	StringT cellString; /* contents of cell */
	StringT numString; /* leading number in cellString */
	/* Get text in this cell. */
	textItems = F_ApiGetText(docId, cellId, FTI_String);
	cellString = F_StrNew(MAXSTRING + 1);
	cellStrLen = 0;
	for(i=0; i<textItems.len; i++){
		F_StrCatN(cellString, textItems.val[i].u.sdata, MAXSTRING);
	}
	/* Extract numeric string if there is one. */
	numString = getLeadingIntegerString(cellString);
	num = F_StrAlphaToInt(numString);
	/* Free memory */
	if(cellString != NULL)
		F_Free(cellString);
	if(numString != NULL)
		F_Free(numString);
	F_ApiDeallocateTextItems(&textItems);
	return(num);
}

/* Extracts leading integer from the  given string. */
StringT getLeadingIntegerString(stringValue)
StringT stringValue;{
	IntT length; /* length of cell string */
	IntT index; /* index into string array */
	StringT numString; /* numeric string we are seeking */
	BoolT isNum; /* True if character is numeric */
	
	length = F_StrLen(stringValue);
	numString = F_StrNew(MAXSTRING + 1); /* allocate space for the string */
	/* If it is a number, add it to numString, otherwise stop */
	for(index =0; index< length; index++){
		isNum = F_CharIsNumeric(stringValue[index]);
		if(isNum)
			F_StrCatCharN(numString, stringValue[index], MAXSTRING);
		else
			break;
	}
	return(numString);
}
