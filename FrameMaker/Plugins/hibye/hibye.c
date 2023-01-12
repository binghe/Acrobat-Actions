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
 *	    hibye
 *
 * General Description:
 *		Notification driven greeting.
 *
 *		Upon receiption of FA_Note_PostOpenDoc, client calls the function
 *		sayHello() which puts up a dialog.
 *		Upon receiption of FA_Note_PreQuitDoc, client calls the function
 *		sayGoodby() which puts up a dialog.
 *		These additional functions are described in the file "cutils.c", 
 *		included with this sample client.
 *
 * Invocation:
 *		With the client installed, open a document (new or existing), then
 *		close that document.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name hibye>
 *			<Description Greets user at file open and again at close.>
 *			<Directory fdk_install_dir/samples/hibye>
 *			<CommandLine $FAPIDIR/fa.hibye>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.hibye>
 *		to:
 *			<SharedLibrary fa.hibye.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		hibye=Standard, Greets user at file open and again at close,
 *			fdk_install_dir\samples\hibye\debug\hibye.dll, all 
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
#include "fencode.h"
#include "cutils.h"
#include "fdetypes.h"

VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
	F_FdeInitFontEncs("UTF-8");

	/* set up menus then free system resources by bailing out */
	switch(init){
		/* request notification after document opens and when document closed */
	case FA_Init_First:
		F_ApiBailOut();
		F_ApiNotification(FA_Note_PostOpenDoc, True);
		F_ApiNotification(FA_Note_PreQuitDoc, True);
		break;
		/* check for misregistered client file */
	case FA_Init_DocReport:
		F_ApiBailOut();
		warnRegistrationProblem();
		break;
	}
}

/* Callback to handle registered events */
VoidT F_ApiNotify(notification, docId, sparm, iparm)
IntT notification;
F_ObjHandleT docId;
StringT sparm;
IntT iparm;{
	F_ApiBailOut();
	switch(notification){
	case FA_Note_PostOpenDoc:
		sayHello();
		break;
	case FA_Note_PreQuitDoc:
		sayGoodby();
		break;
	}
}

