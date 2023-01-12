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
 *	    geoserver
 *
 * General Description:
 *	    Works with abc client to demonstrate how to create and maintain a 
 *      client owned inset. The abc client provides menu items to create 
 *      text insets.This client creates menu items to call abc to update 
 *      the text insets it created.
 *
 * Invocation:
 *	    Compile and register both this client and the abc client.
 *	    Choose menu items provided with the abc client to insert the text
 *	    insets, then use the additional menu choices from this client
 *	    to make modifications to those text insets.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name geoserver>
 *			<Description Calls abc client to update text insets.>
 *			<Directory fdk_install_dir/samples/geoserver>
 *			<CommandLine $FAPIDIR/fa.geoserver>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.geoserver>
 *		to:
 *			<SharedLibrary fa.geoserver.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		Geoserver=Standard,Call abc client to update insets,
 *			fdk_install_dir\samples\geoserver\debug\geoserver.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 *********************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "futils.h"
#include "fstrings.h"
#include "fmemory.h"

#include "cutils.h"

#define MAXSTRING 255
#define CLIENT (StringT) "abc"
#define A_PLACE_CMD 1
#define B_PLACE_CMD 2
#define C_PLACE_CMD 3

VoidT updateInsets();

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
		addToClassMenu(A_PLACE_CMD, (StringT) "aPlaceCmd", (StringT) "Choose A Place", 
					   (StringT) "\\!CBP");
		addToClassMenu(B_PLACE_CMD, (StringT) "bPlaceCmd", (StringT) "Choose B Place", 
					   (StringT) "\\!CBP");
		addToClassMenu(C_PLACE_CMD, (StringT) "cPlaceCmd", (StringT) "Choose C Place", 
					   (StringT) "\\!CCP");
		F_ApiBailOut();
		break;
  }
}

VoidT F_ApiCommand(command)
     IntT command;
{
	IntT err;
	StringT aPlace, bPlace, cPlace;
	StringT msg;

	F_ApiBailOut();
	msg = F_StrNew(MAXSTRING + 1);
	switch(command) {
	case A_PLACE_CMD:
		err = F_ApiPromptString(&aPlace, (StringT) "Choose a A Place?", 
								(StringT) "Australia");
		if (!err) {
			F_StrCpy(msg, (StringT) "A ");
			F_StrCat(msg, aPlace);
			if(aPlace != NULL)
				F_Free(aPlace);
			F_ApiCallClient(CLIENT, msg);
		}
		break;

	case B_PLACE_CMD:
    err = F_ApiPromptString(&bPlace, (StringT) "Choose a B Place?", 
                            (StringT) "Buffalo");
    if (!err) {
		F_StrCpy(msg, (StringT) "B ");
		F_StrCat(msg, bPlace);
		if(bPlace != NULL)
			F_Free(bPlace);
		F_ApiCallClient(CLIENT, msg);
    }
    break;

	case C_PLACE_CMD:
	err = F_ApiPromptString(&cPlace, (StringT) "Choose a c place?", 
							(StringT) "China");
	if (!err) {
		F_StrCpy(msg, (StringT) "C ");
		F_StrCat(msg, cPlace);
		if(cPlace != NULL)
			F_Free(cPlace);
		F_ApiCallClient(CLIENT, msg);
	}
	break;
  }
	if(msg != NULL)
		F_Free(msg);
}