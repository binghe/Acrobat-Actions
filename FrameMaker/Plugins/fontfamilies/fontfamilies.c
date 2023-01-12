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
 *	    fontfamilies
 * 
 *  General Description: 
 *	    Writes to the console a list of fonts that are visible in the 
 *		paragraph designer.
 *
 *  Invocation:
 *	    Choose "Display Selectable Fonts" from the API Menu. Note 
 *	    the font family names that display in the console
 *	    are those which are also visible in the Paragraph
 *	    Designer.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name fontfamilies>
 *			<Description Lists fonts available for use in FrameMaker.>
 *			<Directory fdk_install_dir/samples/fontfamilies>
 *			<CommandLine $FAPIDIR/fa.fontfamilies>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.fontfamilies>
 *		to:
 *			<SharedLibrary fa.fontfamilies.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		FontFamilies=Standard,List fonts available to FrameMaker,
 *			fdk_install_dir\samples\fontfamilies\debug\fontfamilies.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
********************************************************************/

#include "fapi.h"
#include "futils.h"
#include "fstrings.h"
#include "fdetypes.h"

#define Item1 1

VoidT F_ApiInitialize(IntT init)
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	if(init == FA_Init_First)
	{
		F_ObjHandleT MenuBarId, MenuId;

		MenuBarId=F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
		MenuId=F_ApiDefineAndAddMenu(MenuBarId, "Api Menu", "API");
		F_ApiDefineAndAddCommand(Item1, MenuId, "FntFamlyCmd", "Display Selectable Fonts", "");
		F_ApiBailOut();
	}
}

VoidT F_ApiCommand(IntT command)
{
	IntT j = 0;
	UIntT i;
	F_IntsT attributes;
	F_StringsT strings;
	
	/* Get name of each FontFamily and display it based on whether it is visible 
	 * in PGF Designer. */
	strings = F_ApiGetStrings(0, FV_SessionId, FP_FontFamilyNames);
	attributes = F_ApiGetInts(0, FV_SessionId, FP_FontFamilyAttributes);
	for(i=0; i<attributes.len; i++){
		j = attributes.val[i];
		if(j & FV_FAMILY_VISIBLE)
		F_Printf(NULL,"Family %s\n", strings.val[i]);
	}
	/* Free allocated memory */
	F_ApiDeallocateStrings(&strings);
	F_ApiDeallocateInts(&attributes);
}


