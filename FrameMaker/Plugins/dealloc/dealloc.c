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
 *	    dealloc
 *
 * General Description:
 *		Builds a list of the paragraph formats available in a document.
 *		After determining the size of the list, it displays the count
 *		using an alert. Demonstrates use of F_Free() and F_StrListFree() 
 *		to free resources allocated during string function calls.
 *
 * Invocation:
 *		From the FDKClassMenu choose "Count formats".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name dealloc>
 *			<Description Calls dealloc client to update text insets.>
 *			<Directory fdk_install_dir/samples/dealloc>
 *			<CommandLine $FAPIDIR/fa.dealloc>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.dealloc>
 *		to:
 *			<SharedLibrary fa.dealloc.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your product.ini (for example, maker.ini) file:
 *
 *		dealloc=Standard,Call dealloc client to update insets,
 *			fdk_install_dir\samples\dealloc\debug\dealloc.dll, all 
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
#include "fmemory.h"
#include "futils.h"
#include "fstrings.h"
#include "fstrlist.h"
#include "fprogs.h"

#include "cutils.h"

#define FMTCNT_CMD 2
#define MAXSTRING 255

VoidT F_ApiInitialize(init)
     IntT init;
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

  switch (init) {
  case FA_Init_First:
    addToClassMenu(FMTCNT_CMD, (StringT) "formatCntCmd", 
                     (StringT) "Count formats", (StringT) "\\!CF");
    F_ApiBailOut();
    break;
  }
}

VoidT F_ApiCommand(command)
     IntT command;
{
  StringT msg2;
  StringT name;
  StringListT fmtList;
  IntT numFmts;
  F_ObjHandleT docId;
  F_ObjHandleT fmtId;
  
  F_ApiBailOut();
  
  switch(command) {

  case FMTCNT_CMD:
    docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
    if (!docId) {
      F_ApiAlert((StringT) "Please open a document before invoking this command.", 
                 FF_ALERT_CONTINUE_WARN);
      return;
    } 
    fmtList = F_StrListNew(10, 10);
    fmtId = F_ApiGetId(FV_SessionId, docId, FP_FirstPgfFmtInDoc);
    while (fmtId) {
      name = F_ApiGetString(docId, fmtId, FP_Name);
      F_StrListAppend(fmtList, name);
      F_Free(name);
      fmtId = F_ApiGetId(docId, fmtId, FP_NextPgfFmtInDoc);
    }
    numFmts = F_StrListLen(fmtList);
    msg2 = F_StrNew(MAXSTRING + 1);
    F_StrTrunc(msg2, 0);
    F_StrCatIntN(msg2, numFmts, MAXSTRING);
    F_StrCatNEnc(msg2, (StringT) " formats in this document", MAXSTRING-F_StrLen(msg2), fdeUTF8EncodingId);
    displayMessage(msg2);
    F_Free(msg2);
    F_StrListFree(fmtList);
    break;
  }
} 