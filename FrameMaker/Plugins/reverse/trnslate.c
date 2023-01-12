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
 *	    reverse
 *
 * General Description:
 *		The ReverseTranslator reverses the order of two elements upon
 *		translation from SGML or XML to FrameMaker and vice versa.
 *
 *		Upon export, it takes FrameMaker data which contains the element 
 *		First followed by the element Last and creates an SGML or XML
 *		document with First following Last.
 *
 *		This sample illustrates the use of Sw_ScanElem().
 *
 * Invocation:
 *		Register the client. Restart FrameMaker. Open structapps.fm. File>Structure
 *		Tools>Read Application Definitions. Then open either "import.sgm" or 
 *		"import.xml". Or save "export.fm" using either the XML or the SGML 
 *		application.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name reverse>
 *			<Description Reverses order of First and Last elements>
 *			<Directory fdk_install_dir/samples/reverse>
 *			<CommandLine $FAPIDIR/fa.reverse>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.reverse>
 *		to:
 *			<SharedLibrary fa.reverse.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		reverse=Standard, Reverses order of First and Last elements,
 *			fdk_install_dir\samples\reverse\debug\reverse.dll, structured 
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


