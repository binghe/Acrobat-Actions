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
 *	    includelists
 *
 * General Description:
 *		FrameMaker 6 removed the shuttle dialogs from the Print and Import
 *		Formats/Element Definitions dialogs.  These dialogs now apply changes to
 *		the current selection in the book window.
 *
 *		If the user wants the pre-FM 6 behavior, he can use the MIF statements 
 *		DefaultPrint and DefaultApply to specify which files in a book will be
 *		affected by the command. Then, he can use the menu items defined by this 
 *		client. 
 *
 * Invocation:
 *		To create the Print and Include Lists for a book using MIF statements do the following:
 *		1. Open the book.
 *		2. File>SaveAs MIF
 *		3. Close the book.
 *		4. Open the book MIF file as a text file - in any Text editor or in FM as a
 *		   text file. See the documentation for your platform for instructions on how
 *		   to open a MIF file as text.
 *		5. Each file in the book MIF file has a section of MIF statements. Set the DefaultPrint
 *		   and DefaultApply statements to "Yes" for those files to be included or printed,
 *		   or set them to "No" if they are not to be included or printed. Do this for each
 *		   file in the book.
 *		6. Save the MIF file as text.
 *		7. Open the book MIF file as a normal FM book.
 *		8. Now the following commands affect only the files with DefaultPrint 
 *		   and/or DefaultApply set to "Yes".
 *		If you would prefer to use the FP_PrintInclude and FP_ImportFmtInclude properties,
 *		you would need to add code to the sample to set these properties for each file in 
 *		the book. See the FDK Programmer's Guide for more information on setting properties.
 *
 *		Use one or the other of the methods - not both.
 *
 *	File>Print Files in Include List...
 *		Use this menu item if you want to print the files in a book whose
 *		DefaultPrint MIF statement is Yes (or whose FP_PrintInclude property is
 *		set).
 *
 *	File>Import>Formats to Files in Include List...
 *		Use this menu item if you want to import formats to the files in a book
 *		whose DefaultApply MIF statement is Yes (or whose FP_ImportFmtInclude
 *		property is set).
 *
 *	File>Import>Element Definitions to Files in Include List...
 *		Use this menu item if you want to import element definitions to the files in a book
 *		whose DefaultApply MIF statement is Yes (or whose FP_ImportFmtInclude property 
 *		is set).
 *
 * Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name includelists>
 *			<Description Includes lists apiclient>
 *			<Directory fdk_install_dir/samples/includelists>
 *			<CommandLine $FAPIDIR/fa.includelists>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.includelists>
 *		to:
 *			<SharedLibrary fa.includelists.dl>
 *
 *		Restart maker.
 *
 * Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		includelists=Standard, Includes lists apiclient,
 *			fdk_install_dir\samples\includelists\debug\includelists.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 * Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fapi.h"
#include "fstrings.h"
#include "fcodes.h"
#include "fencode.h"
#include "fdetypes.h"

/* Commands */
#define PRINT_USING_INCLUDE_LIST				1
#define IMPORT_FORMATS_TO_INCLUDE_LIST          2
#define IMPORT_ELEMENT_DEFNS_TO_INCLUDE_LIST	3

/* Fcodes */
#define KBD_BOOKPRINTSELECTEDFILES	0x3EC
#define KBD_USEFMTFROM				0x316
#define KBD_USEELTDEFSFROM			0xF9E

/* Prototypes */
VoidT SelectIncludeListFiles(F_ObjHandleT bookId, IntT printInclude);
VoidT PrintUsingIncludeList(VoidT);
VoidT ImportToIncludeList(IntT command);


VoidT F_ApiInitialize(IntT init)
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
	F_FdeInitFontEncs("UTF-8");

	/* Create menu items */
	if (init == FA_Init_First)
	{
		F_ObjHandleT bookFileMenuId, printUsingIncludeListCmdId,
			bookImportMenuId, importFmtsToIncludeListCmdId, 
			importElemDefsToIncludeListCmdId;
		StringT productName = F_ApiGetString(0, FV_SessionId, FP_ProductName);
		BoolT maker_is_structured = F_StrEqual(productName, (StringT)"FrameMaker+SGML");

		/* Print using Include List */

		bookFileMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, 
											(StringT)"BookFileMenu");
        printUsingIncludeListCmdId = 
			F_ApiDefineCommand(PRINT_USING_INCLUDE_LIST, 
							   (StringT)"APIPrintUsingIncludeList",
							   (StringT)"Print Files in Include List...", 
							   (StringT)"\\!fv");

		if (bookFileMenuId)
		{
			F_ApiAddCommandToMenu(bookFileMenuId, printUsingIncludeListCmdId);
			F_ApiSetId(bookFileMenuId, printUsingIncludeListCmdId, 
					   FP_PrevMenuItemInMenu,
					   F_ApiGetNamedObject(FV_SessionId, FO_Command, 
										  (StringT)"PrintSelectedFilesInBook"));
		}

		/* Import to Include List */

		bookImportMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, 
											(StringT)"BookImportMenu");
        importFmtsToIncludeListCmdId = 
			F_ApiDefineCommand(IMPORT_FORMATS_TO_INCLUDE_LIST, 
							   (StringT)"APIImportFormatsToIncludeList",
							   (StringT)"Formats to Files in Include List...", 
							   (StringT)"\\!fiF");

		if (maker_is_structured)
	        importElemDefsToIncludeListCmdId = 
				F_ApiDefineCommand(IMPORT_ELEMENT_DEFNS_TO_INCLUDE_LIST, 
				   (StringT)"APIImportElemDefsToIncludeList",
				   (StringT)"Element Definitions to Files in Include List...", 
				   (StringT)"\\!fiE");

		if (bookImportMenuId)
		{
			F_ApiAddCommandToMenu(bookImportMenuId,
								  importFmtsToIncludeListCmdId);
			F_ApiSetId(bookImportMenuId, importFmtsToIncludeListCmdId, 
					   FP_PrevMenuItemInMenu,
					   F_ApiGetNamedObject(FV_SessionId, FO_Command, 
										  (StringT)"ImportFormats"));

			if (maker_is_structured)
			{
				F_ObjHandleT sepId;
				
				/* Separator */
				sepId = F_ApiGetNamedObject(FV_SessionId, FO_Command,
											(StringT)"Separator1");
				F_ApiAddCommandToMenu(bookImportMenuId, sepId);
				F_ApiSetId(bookImportMenuId, sepId, FP_PrevMenuItemInMenu,
						   importFmtsToIncludeListCmdId);

				/* Import Formats to Include List */
				F_ApiSetId(bookImportMenuId, importElemDefsToIncludeListCmdId, 
						   FP_PrevMenuItemInMenu,
						   F_ApiGetNamedObject(FV_SessionId, FO_Command, 
											  (StringT)"ImportElementDefns"));

				/* Import Element Definitions to Include List */
				F_ApiAddCommandToMenu(bookImportMenuId,
									  importElemDefsToIncludeListCmdId);
				F_ApiSetId(bookImportMenuId,
						   importElemDefsToIncludeListCmdId, 
						   FP_PrevMenuItemInMenu,
						   F_ApiGetNamedObject(FV_SessionId, FO_Command, 
											  (StringT)"ImportElementDefns"));
			}
		}

		F_ApiBailOut();
	}
}

/*
 * Select files in the book based on whether or not their FP_PrintInclude
 * or FP_ImportFmtInclude property is set.
 */
VoidT SelectIncludeListFiles(F_ObjHandleT bookId, IntT printInclude)
{
	F_ObjHandleT componentId;
	BoolT selectComponent;
	IntT includeProp = printInclude ? FP_PrintInclude : FP_ImportFmtInclude;

	if (!bookId)
		return;

	for (componentId = F_ApiGetId(FV_SessionId, bookId,
								  FP_FirstComponentInBook);
		 componentId;
		 componentId = F_ApiGetId(bookId, componentId, FP_NextComponentInBook))
    {
		selectComponent = F_ApiGetInt(bookId, componentId, includeProp);
		F_ApiSetInt(bookId, componentId, FP_ComponentIsSelected,
					selectComponent);
	}
}

/*
 * Select Files whose DefaultPrint/FP_PrintInclude property is set and then
 * bring up the Print Selected Files in Book dialog
 */
VoidT PrintUsingIncludeList(VoidT)
{
	F_ObjHandleT bookId;
	IntT fcodes[] = {KBD_BOOKPRINTSELECTEDFILES};

	bookId = F_ApiGetId(0, FV_SessionId, FP_ActiveBook);
	if (!bookId)
		return;

	SelectIncludeListFiles(bookId, True);

	F_ApiFcodes(sizeof(fcodes)/sizeof(IntT), fcodes);
}

/*
 * Select Files whose DefaultApply/FP_ImportFmtInclude property is set and then
 * bring up the Import Formats/Element Definitions dialog
 */
VoidT ImportToIncludeList(IntT command)
{
	F_ObjHandleT docId, bookId;
	IntT fcodes[] = {KBD_USEFMTFROM};

	bookId = F_ApiGetId(0, FV_SessionId, FP_ActiveBook);
	if (!bookId)
		return;

	docId = F_ApiGetId(0, FV_SessionId, FP_FirstOpenDoc);
	if (docId)
		SelectIncludeListFiles(bookId, False);

	if (command == IMPORT_ELEMENT_DEFNS_TO_INCLUDE_LIST)
		fcodes[0] = KBD_USEELTDEFSFROM;
	F_ApiFcodes(sizeof(fcodes)/sizeof(IntT), fcodes);
}

VoidT F_ApiCommand(IntT command)
{	
	switch(command)
	{
	case PRINT_USING_INCLUDE_LIST:
		PrintUsingIncludeList();
		break;
	case IMPORT_FORMATS_TO_INCLUDE_LIST:
	case IMPORT_ELEMENT_DEFNS_TO_INCLUDE_LIST:
		ImportToIncludeList(command);
		break;
	default:
		break;
	}
}

