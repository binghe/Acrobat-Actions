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
 *	Program Name: 
 *
 *		openxmldoc
 *	
 *	General Description:
 *
 *	Sample program which opens an XML document.It allows the user to select a file.
 *	As written, the XML document to be opened should be based on the docbookx DTD.
 *	A suitable sample XML document file is included. The XDocBook sample XML
 *	application provided with FrameMaker will be used when opening the XML doc.
 *
 *	Invocation:
 *
 *	Open FrameMaker. Click API on the Main Menu and then click "OpenXML". When the
 *	dialog box appears select an XML document based on the docbookx DTD.
 *
 *   Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name openxmldoc>
 *			<Description Opens a user-selected docbookx XML document.>
 *			<Directory fdk_install_dir/samples/openxmldoc>
 *			<CommandLine $FAPIDIR/fa.openxmldoc>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.openxmldoc>
 *		to:
 *			<SharedLibrary fa.openxmldoc.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your product.ini (for example, maker.ini) file:
 *
 *		openxmldoc=Standard,Opens a docbookx XML document, 
 *			fdk_install_dir\samples\openxmldoc\debug\openxmldoc.dll, structured 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
*/

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "futils.h"
#include "fmemory.h"



#define TestCommand 1

VoidT openXML ();

VoidT F_ApiInitialize(initialization)
IntT initialization;        /* Code for initialization type */
{
	F_ObjHandleT menuBarId, menuId;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	/* Get ID of the Frame product menu bar. */
	menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu,
									"!MakerMainMenu");
	/* Add menu named "API" to the Frame product menu bar. */
	menuId = F_ApiDefineAndAddMenu(menuBarId, "APIMenu", "API");
	
	/* Add items to API menu. */	
	F_ApiDefineAndAddCommand(TestCommand, menuId,"TestCmd", "Open XML","\\!SF");

}

VoidT F_ApiCommand(command)
IntT command;
{	
	switch (command)
	{	
		case TestCommand:
			F_FdeInit();
			openXML();
			break;
	}
}
		
VoidT openXML ()
{

	F_PropValsT params, *returnParamsp = NULL;
	IntT i;

   /* Get default open properties. Return if it can’t be allocated. */
   params = F_ApiGetOpenDefaultParams();
   if (params.len == 0) 
   {
	   	F_Printf(NULL, (StringT)"File not opened.\nUnable to allocate memory.\n\n");
        return;
   }

   /* Set properties to open an XML document*/ 
   
	/*Specify XML as file type to open*/	
	i = F_ApiGetPropIndex(&params, FS_OpenAsType);
	params.val[i].propVal.u.ival = FV_TYPE_XML;

	/*Allow user to select a file to open*/
	i = F_ApiGetPropIndex(&params, FS_ShowBrowser);
	params.val[i].propVal.u.ival = True;
    
	/* Specify the XML application to be used when opening the document.*/
	i = F_ApiGetPropIndex(&params, FS_StructuredOpenApplication);
    params.val[i].propVal.u.sval = F_StrCopyString((StringT) "XDocBook");


	/*The structapps.fm file containing the specified application must have 
	already been read. The default structapps.fm file is read when FrameMaker is 
	opened so this shouldn't be a problem if the application to be used is 
	listed in the structapps.fm file.*/ 

	if (!(F_ApiOpen("", &params, &returnParamsp)))
	{

		F_ApiAlert("Couldn't open file.\n", FF_ALERT_CONTINUE_NOTE);
		/*Print error to console for debugging purposes.*/
		F_Printf(NULL, (StringT)"Begin open status report for file:\n\n");
		F_ApiPrintOpenStatus(returnParamsp);
		F_Printf(NULL, (StringT)"End file open status report.\n\n");
		/* Deallocate property lists*/
		F_ApiDeallocatePropVals(&params);
		F_ApiDeallocatePropVals(returnParamsp);
		return;
	}
	else
	{
		/*Deallocate property lists*/
		F_ApiDeallocatePropVals(&params);
		F_ApiDeallocatePropVals(returnParamsp);
		return;
	}
}

