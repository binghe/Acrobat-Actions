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
 *	    hello
 *
 * General Description:
 *		Greets the user at product startup time.
 *
 * Invocation:
 *		Once the client is installed, launch FrameMaker.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name hello>
 *			<Description Greets user at startup.>
 *			<Directory fdk_install_dir/samples/hello>
 *			<CommandLine fdk_install_dir/fa.hello>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *		to:
 *			<CommandLine fdk_install_dir/fa.hello>
 *			<SharedLibrary fa.hello.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		hello=Standard, Greets user at startup,
 *			fdk_install_dir\samples\hello\debug\hello.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fapi.h" /* required for all FDK client programs */
#include "fencode.h"
#include "fdetypes.h"
/* Call back invoked at product startup time */
VoidT F_ApiInitialize(init)
     IntT init;
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init) {
		case FA_Init_First:
		F_ApiAlert((StringT) "Hello class!", FF_ALERT_CONTINUE_NOTE);
		break;
  }
}
