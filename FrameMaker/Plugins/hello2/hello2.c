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
 *  Program Name:
 *		hello2
 *
 *  General Description:
 *		Provides a menu driven greeting.
 *	
 *  Invocation:
 *		From the FDK Class Menu, choose either "Hello World",
 *		or "Goodby World".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name hello2>
 *			<Description Provides a menu-driven greeting.>
 *			<Directory fdk_install_dir/samples/hello2>
 *			<CommandLine $FAPIDIR/fa.hello2>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.hello2>
 *		to:
 *			<SharedLibrary fa.hello2.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your product.ini (for example, maker.ini) file:
 *
 *		hello2=Standard,Provides menu-driven greeting,
 *			fdk_install_dir\samples\hello2\debug\hello2.dll, all 
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
#include "cutils.h"
#include "fencode.h"
#include "fdetypes.h"

#define HELLO_WORLD_CMD 1
#define GOODBY_WORLD_CMD 2

/* Call back to put up HELLO and GOODBY menu items */
VoidT F_ApiInitialize(init)
     IntT init;
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

  switch(init) {
  case FA_Init_First:
    F_ApiBailOut();
    addToClassMenu(HELLO_WORLD_CMD, (StringT) "helloWorldCmd", 
                     (StringT) "Hello World", (StringT) "\\!HW");
    addToClassMenu(GOODBY_WORLD_CMD, (StringT) "goodbyWorldCmd", 
                     (StringT) "Goodby World", (StringT) "\\!GW");
    break;
  case FA_Init_DocReport:
    F_ApiBailOut();
    warnRegistrationProblem();
    break;
  case FA_Init_Subsequent:
    /* nothing to do but do not bail out */
    break;
  }
}

/* Callback to respond to the user choosing menu items */
VoidT F_ApiCommand(command)
     IntT command;
{
  F_ApiBailOut();
  switch(command) {
  case HELLO_WORLD_CMD:
    sayHello();
    break;
  case GOODBY_WORLD_CMD:
    sayGoodby();
    break;
  }
}
