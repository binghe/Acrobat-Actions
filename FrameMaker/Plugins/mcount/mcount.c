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
 *	    mcount
 *
 * General Description:
 *		Counts markers in the active document, and reports the number
 *		back to the user.
 *
 * Invocation:
 *		In FrameMaker, choose File> Utilities> Document Reports...
 *		Select mcount and click Run.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name mcount>
 *			<Type Report>
 *			<Description Counts and reports number of markers in document.>
 *			<Directory fdk_install_dir/samples/mcount>
 *			<CommandLine $FAPIDIR/fa.mcount>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.mcount>
 *		to:
 *			<SharedLibrary fa.mcount.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		mcount=DocReport, Counts and reports number of markers in document,
 *			fdk_install_dir\samples\mcount\debug\mcount.dll, all 
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
#include "fmemory.h"
#include "fencode.h"

#define MAXSTRING 255

VoidT F_ApiInitialize(init)
IntT init;{
	StringT msg; /* alert message */
	IntT count; /* number of markers */
	F_ObjHandleT docId; /* active document */
	F_ObjHandleT markerId; /* marker ID */
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_DocReport:
		F_FdeInit(); /* initialize the FDE */
		F_ApiBailOut(); /* bail out when finished */
		count = 0; /* initialize count */
		/* Get Active Doc */
		docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
		if(!docId){
			F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		/* Get all the markers. */
		markerId = F_ApiGetId(FV_SessionId, docId, FP_FirstMarkerInDoc);
		while(markerId){
			count++;
			markerId  = F_ApiGetId(docId, markerId, FP_NextMarkerInDoc);
		}
		/* Report to user. */
		msg = F_StrNew(MAXSTRING + 1);
		F_StrCpyNEnc(msg, (StringT) "There are ", MAXSTRING+1, fdeUTF8EncodingId);
		F_StrCatIntN(msg, count, STRBUFFSIZE);
		F_StrCatNEnc(msg, (StringT) " markers in this document", MAXSTRING+1, fdeUTF8EncodingId);
		F_ApiAlert(msg, FF_ALERT_CONTINUE_NOTE);
		/* Free msg */
		if(msg != NULL)
			F_Free(msg);
		break;
	}
}
