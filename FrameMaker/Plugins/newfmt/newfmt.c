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
 *	    newfmt
 *
 * General Description:
 *		Creates a new paragraph format based on a current paragraph format via 
 *		two dialogs, and adds it to the Paragraph Catalog. Changes the font size
 *		property of the new format so that it is 10 points larger than the font
 *		size in the base paragraph format.		
 *
 * Invocation:
 *		From the FDK Class Menu, choose "Add new paragraph format.
 *		Provide the first dialog with a name. Choose a pre-existing 
 *		format, from which to base the new one on, in the second
 *		dialog (scroll box).
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name newfmt>
 *			<Description Creates new paragraph format>
 *			<Directory fdk_install_dir/samples/newfmt>
 *			<CommandLine $FAPIDIR/fa.newfmt>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.newfmt>
 *		to:
 *			<SharedLibrary fa.newfmt.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		newfmt=Standard, Creates new paragraph format,
 *			fdk_install_dir\samples\newfmt\debug\newfmt.dll, all 
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
#include "fstrlist.h"
#include "fmemory.h"
#include "fmetrics.h"
#include "fencode.h"

#include "cutils.h"

F_StringsT  convertToApiList();
StringListT getListOfFormats();

#define NEW_PGF_FMT_CMD 1
#define MAXSTRING 255

VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		F_ApiBailOut();
		addToClassMenu(NEW_PGF_FMT_CMD, (StringT) "newPgfFmtCmd", (StringT) "Add new paragraph format", (StringT) "\\!NF");
		break;

	case FA_Init_Subsequent:
		F_FdeInit();
		break;
	}
}

VoidT F_ApiCommand(command)
IntT command;{
	F_ObjHandleT docId; /* active document */
	F_ObjHandleT oldPgfFmtId; /* old paragraph format */
	F_ObjHandleT newPgfFmtId; /* new paragraph format */	
	F_PropValsT props; /* paragraph format properties */
	IntT err; /* error obtained if user cancels prompt for string */
	StringT newName; /* name of new paragraph format */
	StringListT fdeFmtList;
	F_StringsT apiFmtList;
	IntT selItem;
	IntT sizeIndex;

	/* bail out when done */
	F_ApiBailOut();

	/* get active document id */
	docId = F_ApiGetId(FV_SessionId,FV_SessionId,FP_ActiveDoc);
	if(!docId){
		F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
		return;
	}
	switch(command){
	case NEW_PGF_FMT_CMD:
		err = F_ApiPromptString(&newName, (StringT) "New format name?", (StringT) "");
		if(err){
			return;
		}
		fdeFmtList = getListOfFormats(docId);
		if(F_StrListLen(fdeFmtList) == 0){
			F_ApiAlert((StringT) "No formats currently defined", FF_ALERT_CONTINUE_WARN);
			return;
		}
		if(F_StrListIndex(fdeFmtList, newName) != -1){
			F_ApiAlert((StringT) "Requested format exists, please try again.", FF_ALERT_CONTINUE_WARN);
			/* Free newName */
			if(newName != NULL)
				F_Free(newName);
			/* Free fdeFmtList */
			F_StrListFree(fdeFmtList);
			return;
		}
		apiFmtList  = convertToApiList(fdeFmtList);
		F_StrListFree(fdeFmtList);
		if(apiFmtList.len == 0){
			F_ApiAlert((StringT) "Problem in converting list, operation aborted", FF_ALERT_CONTINUE_WARN);
			/* Free newName */
			if(newName != NULL)
				F_Free(newName);
			return;
		}
		err = F_ApiScrollBox(&selItem, (StringT) "Based On?", &apiFmtList, 1);
		if(err){
			F_ApiDeallocateStrings(&apiFmtList);
			if(newName != NULL)
				F_Free(newName);
			return;
		}
		/* Create new paragraph format */
		newPgfFmtId = F_ApiNewNamedObject(docId, FO_PgfFmt, newName);
		if(!newPgfFmtId){
			/* Deallocate apiFmtList */
			F_ApiDeallocateStrings(&apiFmtList);
			/* Free newName */
			if(newName != NULL)
				F_Free(newName);
			return;
		}
		/* Get ID of old paragraph format */
		oldPgfFmtId = F_ApiGetNamedObject(docId, FO_PgfFmt, apiFmtList.val[selItem]);
		F_ApiDeallocateStrings(&apiFmtList);
		/* Get properties of old (original) paragraph format */
		props = F_ApiGetProps(docId, oldPgfFmtId);
		/* change point size property */
		sizeIndex = F_ApiGetPropIndex(&props, FP_FontSize);
		props.val[sizeIndex].propVal.u.ival += F_MetricMake(10, 1);
		/* Set the properties for the new paragraph format */
		F_ApiSetProps(docId, newPgfFmtId, &props);
		F_ApiDeallocatePropVals(&props);
		/* Free newName */
		if(newName != NULL)
			F_Free(newName);
		break;
	}
}

StringListT getListOfFormats(docId)
F_ObjHandleT docId;{
	F_ObjHandleT fmtId;
	StringListT fmtList;
	StringT fmtName;
	fmtList = F_StrListNew((UIntT) 1, (UIntT)1);
	fmtId = F_ApiGetId(FV_SessionId, docId, FP_FirstPgfFmtInDoc);
	while(fmtId){
		fmtName = F_ApiGetString(docId, fmtId, FP_Name);
		F_StrListAppend(fmtList, fmtName);
		if(fmtName != NULL)
			F_Free(fmtName);
		fmtId = F_ApiGetId(docId, fmtId, FP_NextPgfFmtInDoc);
	}
	return(fmtList);
}

F_StringsT  convertToApiList(fdeList)
StringListT fdeList;{
	IntT numFmts;
	F_StringsT list;
	IntT i, len;
	numFmts = F_StrListLen(fdeList);
	list.val = (StringT *) F_Alloc(numFmts*sizeof(StringT), NO_DSE);
	if(list.val){
		list.len = numFmts;
		for(i =0; i < numFmts; i++){
			len = F_StrLen(F_StrListGet(fdeList, i));
			list.val[i] = F_StrNew(len + 1);
			F_StrListCopy(fdeList, i, list.val[i], MAXSTRING + 1);
		}
	}
	else{
		F_ApiAlert((StringT) "Unable to allocate memory for format list", FF_ALERT_CONTINUE_WARN);
		list.val = NULL;
	}
	return(list);
}
