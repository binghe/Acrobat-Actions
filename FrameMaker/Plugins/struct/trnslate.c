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
 *	    struct
 *
 * General Description:
 *		This client illustrates the most elementary form a structured api client
 *		can take. Like the default client, FmTranslator, most clients contain 
 *		routines for both import and export, and most clients also call the 
 *		structured API conversion routines to convert event/conversion object 
 *		pairs. The code is divided into three modules; one for import events 
 *		(rdrevent.c), one for export events (wtrevent.c), and one to call the 
 *		structured API callbacks from within the standard FDK callback routines 
 *		(trnslate.c). This client is useful as a shell to begin creation of a 
 *		structured API client. It doesn't add any functionality.
 *
 * Invocation:
 *		Register the client. To test the client set the "Api Client" element 
 *		value in an XML or SGML application to the name of this client ("struct" if you register 
 *		the client as described below), and click File>Structure Tools>Read 
 *		Application Definitions. This causes the application to use this client 
 *		rather than the default "FmTranslator".
 *		If you aren't familiar with setting up structure applications, see the
 *		"Adobe FrameMaker Structure Application Developer's Guide" online manual
 *		in the OnlineManuals subdirectory of the FrameMaker product installation
 *		for information. You can use the sample DocBook application which ships
 *		with the product if you haven't developed a client yet.
 *
 *		Open an XML or SGML document or save a structured document to XML or SGML. 
 *		The results should be the same as when you use the FmTranslator, since 
 *		this elementary client simply passes each event/conversion object 
 *		pair through to the default event handler. You can add functionality by 
 *		adding code to the rdrevent.c or wtrevent.c modules. 
 * 
 *		For examples of structure clients which add functionality, see the "reverse"
 *		sample in the FDK sample set or the DocBook application which ships with
 *		FrameMaker.
 
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name struct>
 *			<Description Elementary shell for a structure client>
 *			<Directory fdk_install_dir/samples/struct>
 *			<CommandLine $FAPIDIR/fa.struct>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.struct>
 *		to:
 *			<SharedLibrary fa.struct.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		struct=Standard, Elementary shell for a structure client,
 *			fdk_install_dir\samples\struct\debug\struct.dll, structured 
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
#include "fdetypes.h"

/*<trnslate.c<*/
/*>trnslate.c>*/


extern VoidT Structured_ApiEmergency FARGS((VoidT));
extern VoidT Structured_ApiInitialize FARGS((IntT init));
extern VoidT Structured_ApiCommand FARGS((IntT command));
extern VoidT Structured_ApiNotify FARGS((IntT notification, F_ObjHandleT docId, StringT sparm, IntT iparm));
extern VoidT Structured_ApiDialogEvent FARGS((IntT dlgNum, IntT itemNum, IntT mods));


VoidT F_ApiEmergency()
{
	Structured_ApiEmergency();
}


VoidT F_ApiInitialize(init)
IntT init;
{
		/* Making it unicode enabled. */
		F_FdeInit();
		F_ApiEnableUnicode(True);
  		F_FdeInitFontEncs("UTF-8");

		Structured_ApiInitialize(init);
}



VoidT F_ApiCommand(command)
IntT command;
{
	Structured_ApiCommand(command);
}


VoidT F_ApiNotify(notification, docId, sparm, iparm)
IntT notification;
F_ObjHandleT docId;
StringT sparm;
IntT iparm;
{
	Structured_ApiNotify(notification, docId, sparm, iparm);
}


VoidT F_ApiDialogEvent(dlgNum, itemNum, mods)
IntT dlgNum;
IntT itemNum; 
IntT mods;
{
	Structured_ApiDialogEvent(dlgNum, itemNum, mods);
}


