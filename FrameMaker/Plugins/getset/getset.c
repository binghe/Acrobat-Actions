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
 *	    getset
 *
 *   General Description:
 *	    1. BORDERS_CMD- Toggles Borders on and off.
 *	    2. ZOOM_CMD-	Sets a document's zoom factor. Allows you to
 *					choose vaules between 25% & 1600%.
 *	    3. HOST_CMD-	Returns the machine Host Name by querying the
 *					active session's FP_HostName property.
 *
 *   Invocation:
 *	    From the FDK Class Menu, choose "Toggle borders", "Set zoom factor",
 *	    or "Host name?".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name getset>
 *			<Description Toggles Borders, sets Zoom factor,
 *                 or returns the machine host name.>
 *			<Directory fdk_install_dir/samples/getset>
 *			<CommandLine $FAPIDIR/fa.getset>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.getset>
 *		to:
 *			<SharedLibrary fa.getset.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		Getset=Standard,Set properties or return machine hostname,
 *			fdk_install_dir\samples\getset\debug\getset.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *   Exceptions:
 *	    None.
*
***************************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fmetrics.h"
#include "fstrings.h"
#include "fmemory.h"
#include "fencode.h"

#include "cutils.h"

#define MAXSTRING 255 /* maximum size of message string */

/* menu command constants */ 
#define BORDERS_CMD 1
#define ZOOM_CMD 2
#define HOST_CMD 3

VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		addToClassMenu(BORDERS_CMD, (StringT) "bordersCmd", (StringT) "Toggle borders", (StringT) "\\!TB");
		addToClassMenu(ZOOM_CMD, (StringT) "zoomCmd", (StringT) "Set zoom factor", (StringT) "\\!SZ");
		addToClassMenu(HOST_CMD, (StringT) "hostCmd", (StringT) "Host name?", (StringT) "\\!HN");
		break;
	case FA_Init_Subsequent:
		F_FdeInit();
		break;
	}
}

VoidT F_ApiCommand(command)
IntT command;{
	F_ObjHandleT docId;
	BoolT borderState; /* state of borders */
	IntT err; /* error value returned by prompt routine */
	IntT ires; /* integer result */
	MetricT zoom; /* zoom factor in points */
	StringT name; /*host computer name */
	StringT msg; /* message to user */
	
	F_ApiBailOut(); /* bail out when done */
	/* get active document id */
	switch(command){
		/* toggle borders */
	case BORDERS_CMD:
		docId = F_ApiGetId(FV_SessionId, FV_SessionId,FP_ActiveDoc);
		if(!docId){
			F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		borderState = F_ApiGetInt(FV_SessionId, docId, FP_ViewBorders);
		F_ApiSetInt(FV_SessionId, docId, FP_ViewBorders, !borderState);
		break;
	case ZOOM_CMD:
		docId = F_ApiGetId(FV_SessionId, FV_SessionId,FP_ActiveDoc);
		if(!docId){
			F_ApiAlert((StringT) "Please open a document before invoking this command.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		/* Prompt user for zoom factor */
		err = F_ApiPromptInt(&ires, (StringT) "Zoom percentage?", (StringT) "100 %");
		/* Make sure user chooses a valid zoom factor between 25% & 1600% */
		while(ires <= 24 || ires >= 1601){
			F_ApiAlert("Zoom Factor Must Be Between 25% and 1600%", FF_ALERT_CONTINUE_NOTE);
			err = F_ApiPromptInt(&ires, (StringT) "Zoom percentage?", (StringT) "100 %");
		}
		/* 100 % consititues a zoom factor of one */
		zoom = F_MetricMake(ires, 100);
		if(!err){
			F_ApiSetMetric(FV_SessionId, docId, FP_Zoom, zoom);
		}
		break;
	/* set the host name */
	case HOST_CMD:
		name = F_ApiGetString(FV_SessionId, FV_SessionId, FP_HostName);
		msg = F_StrNew(MAXSTRING + 1);
		F_StrCpyNEnc(msg, (StringT) "Host name is ", MAXSTRING, fdeUTF8EncodingId);
		F_StrCatNEnc(msg, name, MAXSTRING, fdeUTF8EncodingId);
		F_ApiAlert(msg, FF_ALERT_CONTINUE_NOTE);
		/* Free Strings */
		if(name != NULL)
			F_Free(name);
		if(msg != NULL)
			F_Free(msg);
		break;
	}
}   