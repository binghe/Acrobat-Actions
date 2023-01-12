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
 *	    uservar
 *
 * General Description:
 *		Writes a user name into a variable named "User Name", when an
 *		FA_Note_PostOpenDoc is received. User name is acquired via
 *		the session property FP_UserName.
 *
 * Invocation:
 *		Create a test document with a variable named "User Name", and
 *		insert the variable. Save and close the document. Re-open the
 *		document.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name uservar>
 *			<Description Sets User Name variable to current user>
 *			<Directory fdk_install_dir/samples/uservar>
 *			<CommandLine $FAPIDIR/fa.uservar>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.uservar>
 *		to:
 *			<SharedLibrary fa.uservar.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		uservar=Standard, Sets User Name variable to current user,
 *			fdk_install_dir\samples\uservar\debug\uservar.dll, all 
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
#include "fencode.h"
#include "futils.h"

VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
		/* request notification after document opens */
	case FA_Init_First:
		F_ApiNotification(FA_Note_PostOpenDoc, True);
		F_ApiBailOut();
		break;
	}
}

/* Callback to handle registered events */
VoidT F_ApiNotify(notification, docId, sparm, iparm)
IntT notification;
F_ObjHandleT docId;
StringT sparm;
IntT iparm;{
	F_ObjHandleT varFmtId;
	StringT userName;
	
	F_ApiBailOut();
	switch(notification){
		/* verify if you received a FA_NotePostOpenDoc */
	case FA_Note_PostOpenDoc:
		/* get the id of User Name variable format */
		varFmtId = F_ApiGetNamedObject(docId, FO_VarFmt, (StringT) "User Name");
		if(varFmtId){
			/* determine the name of the FP_UserName session property */
			userName = F_ApiGetString(FV_SessionId, FV_SessionId, FP_UserName);
			F_Printf(NULL, "User Name : %s", userName);
			/* set the FP_Fmt property of the varFmtId to userName */
			F_ApiSetString(docId, varFmtId, FP_Fmt, userName);
			F_ApiUpdateVariables(docId);
			
			if(userName != NULL)
				F_Free(userName);
		}
		break;
	}
}
