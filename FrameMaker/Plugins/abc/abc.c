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
 *	    abc
 *
 * General Description:
 *	    Works with geoserver client to demonstrate how to create and maintain 
 *      a client owned inset. This client provides menu items to create 
 *      text insets.The geoserver client creates menu items to call this client
 *      to update the text insets it created.
 *
 * Invocation:
 *	    Compile and register both this client and the geoserver client.
 *	    Choose menu items provided with this client to insert the text
 *	    insets, then use the additional menu choices from the geoserver 
 *	    client to make modifications to those text insets.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name abc>
 *			<Description Calls abc client to update text insets.>
 *			<Directory fdk_install_dir/samples/abc>
 *			<CommandLine $FAPIDIR/fa.abc>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.abc>
 *		to:
 *			<SharedLibrary fa.abc.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your product.ini (for example, maker.ini) file:
 *
 *		abc=Standard,Call abc client to update insets,
 *			c:\fdk_install_dir\samples\abc\debug\abc.dll, all 
 *
 *		Replace c:\fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "futils.h"
#include "fstrings.h"
#include "fprogs.h"
#include "fmemory.h"

#include "cutils.h"

/* These are inset types supported by this client */
#define A_INSET_CMD 1
#define B_INSET_CMD 2
#define C_INSET_CMD 3

#define MAXSTRING 255

/* global variables to maintain current value of insets */
StringT aPlace;
StringT bPlace;
StringT cPlace;

VoidT updateInset();
VoidT updateMyInsetType();

VoidT F_ApiInitialize(init)
     IntT init;
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

  switch (init)  {
  case FA_Init_First:
    F_FdeInit();
    addToClassMenu(A_INSET_CMD, (StringT) "ainsetCmd", 
                     (StringT) "Add A Inset", (StringT) "\\!AI");
    addToClassMenu(B_INSET_CMD, (StringT) "binsetCmd", 
                     (StringT) "Add B Inset", (StringT) "\\!BI");
    addToClassMenu(C_INSET_CMD, (StringT) "cinsetCmd", 
                     (StringT) "Add C Inset", (StringT) "\\!CI");

    /* request notifiction that all insets are being updated */
    F_ApiNotification(FA_Note_UpdateAllClientTi, True);
    
    /* request notifcation of client calls */
    F_ApiNotification(FA_Note_ClientCall, True);
  }
  
  /* establish default values for each inset */
  aPlace = F_StrNew(MAXSTRING + 1);
  F_StrCpy(aPlace, (StringT) "A_Place");
  bPlace = F_StrNew(MAXSTRING + 1);
  F_StrCpy(bPlace, (StringT) "B_Place");
  cPlace = F_StrNew(MAXSTRING + 1);
  F_StrCpy(cPlace, (StringT) "C_Place");
} 

VoidT F_ApiCommand(command)
     IntT command;
{
  F_ObjHandleT docId;
  F_ObjHandleT insetId;
  F_TextRangeT tRange;
  StringT clientName;
  
  /* get the ID of the active document */
  docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
  if (!docId) {
    F_ApiAlert((StringT) "Please open a document before invoking this command.", 
               FF_ALERT_CONTINUE_WARN);
    return;
  }
  /* determine/get the location of the current insertion point or text */
  tRange = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
  /* create a new inset at the location you got from the previous command */
  insetId = F_ApiNewAnchoredObject(docId, FO_TiApiClient, &tRange.beg);
  /* increment the text location to move inside the inset */
  tRange.beg.offset++; /* move inside inset */
  F_ApiSetInt(docId, insetId, FP_TiLocked, False); /* unlock inset */

  /* Add appropriate text to inset and set client data to appropriate value */
  switch(command) {
  case A_INSET_CMD:
    F_ApiAddText(docId, &tRange.beg, aPlace);
    F_ApiSetString(docId, insetId, FP_TiClientData, (StringT) "A");
    break;

  case B_INSET_CMD:
    F_ApiAddText(docId, &tRange.beg, bPlace);
    F_ApiSetString(docId, insetId, FP_TiClientData, (StringT) "B");
    break;

  case C_INSET_CMD:
	 /* add code to add text to the inset C */
    F_ApiAddText(docId, &tRange.beg, cPlace);
    F_ApiSetString(docId, insetId, FP_TiClientData, (StringT) "C");
    break;
  }

  /* Relock the inset */
  F_ApiSetInt(docId, insetId, FP_TiLocked, True);
  
  /* restore the insertion point */
  tRange.beg.offset--;
  tRange.end = tRange.beg; 
  F_ApiSetTextRange(FV_SessionId, docId, FP_TextSelection, &tRange);
  
  /* mark this inset with name of client that owns it */
  clientName = F_ApiClientName();
  if (clientName) {
    F_ApiSetString(docId, insetId, FP_TiClientName, clientName);
  }
}

VoidT F_ApiNotify(notification, docId, sparm, iparm)
     IntT notification;
     F_ObjHandleT docId;
     StringT sparm;
     IntT iparm; /* inset identifier */
{
  F_ObjHandleT insetId = 0;
  StringT clientName;
  StringT type;
  StringT s= NULL, place=NULL;
  StringT tiName;
  
  clientName = F_ApiClientName();
  switch(notification) {
    
    /* update all insets that belong to this client */
  case FA_Note_UpdateAllClientTi:
    insetId = F_ApiGetId(FV_SessionId, docId, FP_FirstTiInDoc);
    tiName = F_ApiGetString(docId, insetId, FP_TiClientName);
    while (insetId) {
      if ((F_ApiGetObjectType(docId, insetId)== FO_TiApiClient) &&
          (F_StrEqual(tiName, clientName)) ) {
        type = F_ApiGetString(docId, insetId, FP_TiClientData);
        if (F_StrEqual(type, (StringT) "A")) 
          updateInset(docId, insetId, aPlace);
        else if (F_StrEqual(type, (StringT) "B"))
          updateInset(docId, insetId, bPlace);
        else if (F_StrEqual(type, (StringT) "C"))
          updateInset(docId, insetId, cPlace);
      }
      insetId = F_ApiGetId(docId, insetId, FP_NextTiInDoc);
    }
    F_Free(tiName);
    break;
  case FA_Note_ClientCall:
    
    s = F_StrTok(sparm, (StringT) " ");      
    place = F_StrTok(NULL, (StringT) " ");
    docId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc);
    
    if (F_StrEqual(s, (StringT) "A")) {
      F_StrCpy(aPlace, place);
      updateMyInsetType(docId, (StringT) "A");
    }
    else if (F_StrEqual(s, (StringT) "B")){
      F_StrCpy(bPlace, place);
      updateMyInsetType(docId, (StringT) "B");
    }
    else if (F_StrEqual(s, (StringT) "C")) {
      F_StrCpy(cPlace, place);
      updateMyInsetType(docId, (StringT) "C");
    }
    break;
  }
}

VoidT updateInset(docId, insetId, value)
     F_ObjHandleT docId;
     F_ObjHandleT insetId;
     StringT value;
{
  F_TextRangeT tRange;
  F_TextLocT tLoc;
  
  tRange = F_ApiGetTextRange(docId, insetId, FP_TextRange);
  F_ApiSetInt(docId, insetId, FP_TiLocked, False);
  F_ApiDeleteTextInsetContents(docId, insetId);
  tRange.beg.offset++;
  tLoc = F_ApiAddText(docId, &tRange.beg, value);
  F_ApiSetInt(docId, insetId, FP_TiLocked, True);
}

VoidT updateMyInsetType(docId, type)
     F_ObjHandleT docId;
     StringT type;
{
  F_ObjHandleT insetId;
  StringT clientName;
  
  clientName = F_ApiClientName();
  insetId = F_ApiGetId(FV_SessionId, docId, FP_FirstTiInDoc);
  while (insetId) {
    if ((F_ApiGetObjectType(docId, insetId)== FO_TiApiClient) &&
        (F_StrEqual(F_ApiGetString(docId, insetId, FP_TiClientName), clientName)) 
        && (F_StrEqual(F_ApiGetString(docId, insetId, FP_TiClientData), type))) {
      if (F_StrEqual(type, (StringT) "A"))
        updateInset(docId, insetId, aPlace);
      else if (F_StrEqual(type, (StringT) "B"))
        updateInset(docId, insetId, bPlace);
      else if (F_StrEqual(type, (StringT) "C"))
        updateInset(docId, insetId, cPlace);
    }
    insetId = F_ApiGetId(docId, insetId, FP_NextTiInDoc);
  }
  F_Free(clientName);
}