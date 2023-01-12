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
 *	    fmversion
 *
 * General Description:
 *		Gets and displays the major/minor version number of the
 *		FrameMaker product. Makes use of string functions. For more
 *		info on the calls to getProductName(), getVersionMajor(),
 *		and getVersionMinor(), please see the included file cutils.c.
 *
 * Invocation:
 *		From the FDKClassMenu, choose "What version?".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name fmversion>
 *			<Description Displays major/minor version of FM>
 *			<Directory fdk_install_dir/samples/fmversion>
 *			<CommandLine $FAPIDIR/fa.fmversion>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.fmversion>
 *		to:
 *			<SharedLibrary fa.fmversion.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		fmversion=Standard, Displays major/minor version of FM,
 *			fdk_install_dir\samples\version\debug\fmversion.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		Windows version of client must not be named "version.dll". 
 *
 ***********************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "fmemory.h"
#include "fencode.h"

#include "cutils.h"

#define MAXSTRING 255 

#define VERSION_CMD 1

/* Call back to put up menu and menu item */
VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		F_ApiBailOut();
		addToClassMenu(VERSION_CMD, (StringT) "versionCmd", (StringT) "What version?", (StringT)"\\!WV");
		break;
	case FA_Init_Subsequent:
		F_FdeInit();
		break;
	case FA_Init_DocReport:
		F_ApiBailOut();
		warnRegistrationProblem();
		break;
	}
}

/* Callback to respond to the user choosing menu items */
VoidT F_ApiCommand(command)
IntT command;{
	StringT msg; /* your message to the user */
	StringT productName;
	IntT versionMajor; /* Frame product major version number */
	IntT versionMinor; /* Frame product minior version number */
	
	F_ApiBailOut();
	productName = getProductName();
	versionMajor = getVersionMajor();
	versionMinor = getVersionMinor();
	
	msg = F_StrNew(MAXSTRING + 1);
	F_StrTrunc(msg, 0);
	F_StrCatNEnc(msg, productName, MAXSTRING, fdeUTF8EncodingId);
	F_StrCatNEnc(msg, (StringT) " ", MAXSTRING, fdeUTF8EncodingId);
	F_StrCatIntN(msg, versionMajor, MAXSTRING);
	F_StrCatNEnc(msg, (StringT) ".", MAXSTRING, fdeUTF8EncodingId);
	F_StrCatIntN(msg, versionMinor, MAXSTRING);
	
	displayMessage(msg);
	F_Free(msg);
	
	if(productName != NULL)
		F_Free(productName);
}
