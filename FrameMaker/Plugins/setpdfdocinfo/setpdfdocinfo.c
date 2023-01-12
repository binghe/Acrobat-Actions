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
 *		setpdfdocinfo
 *	
 *	General Description:
 *		Sample program which gets existing PDF document info (if any) and prints 
 *		it to the console. It then prompts the user to select a file with PDF 
 *		document info. It reads the file, populates the PDF document info dialog 
 *		(Click File>File Info to see this info interactively.), and prints the 
 *		new info to the console.
 *
 *		A sample PDF doc info file is included. Note that the file is a text with 
 *		tab-delimited string pairs for the PDF property and it's value.
 *
 *		An F_StringsT structure holds the PDF doc info as a document property, 
 *		FP_PDFDocInfo. F_ApiGetStrings or F_ApiSetStrings are used to get or set 
 *		the structure.
 *
 *	Invocation:
 *		Open FrameMaker and a FrameMaker document. Click API_Test on the Main Menu 
 *		and then "Test PDFDocInfo". When prompted, select a text file with 
 *		tab-delimited string pairs for the PDF doc info. 
 *
 *   Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name setpdfdocinfo>
 *			<Description Gets, sets and prints PDF doc info>
 *			<Directory fdk_install_dir/samples/setpdfdocinfo>
 *			<CommandLine $FAPIDIR/fa.setpdfdocinfo>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.setpdfdocinfo>
 *		to:
 *			<SharedLibrary fa.setpdfdocinfo.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your  maker.ini  file:
 *
 *		setpdfdocinfo=Standard,Gets or sets or prints the PDF doc info, 
 *			fdk_install_dir\samples\setpdfdocinfo\debug\setpdfdocinfo.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 **********************************************************************/

#include "fapi.h"
#include "futils.h"
#include "fcodes.h"
#include "fmemory.h"
#include "fstrings.h"
#include "fdetypes.h"
#include "fcharmap.h"
#include "fchannel.h"
#include "cutils.h"

#define TestCommand 		 6



VoidT printStrings(F_StringsT strings);
F_StringsT readStrings();
F_ObjHandleT getPageId FARGS((F_ObjHandleT docId, F_ObjHandleT graphicId));

VoidT F_ApiInitialize(IntT init)		/* Code for initialization type */
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	if(init == FA_Init_First)
	{
		F_ObjHandleT menuBarId, menuId;
		/* Get ID of the Frame product menu bar. */
		menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu,"!MakerMainMenu");
		/* Add menu named "API" to the Frame product menu bar. */
		menuId = F_ApiDefineAndAddMenu(menuBarId, "APIMenu", "API_Test");
		
		/* Add items to API menu. */
		
		F_ApiDefineAndAddCommand(TestCommand, menuId,"TestCmd", "Test PDFDocInfo","\\!SF");
		F_ApiBailOut();
	}
		
}

VoidT F_ApiCommand(command)
IntT command;
{
F_ObjHandleT docId;
F_StringsT strings, stringsNew, stringsOld;

	switch (command)
	{	
	
	case TestCommand:	 
		docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
		if(!docId){
			F_ApiAlert("Please open a document to set the PDF info.", FF_ALERT_CONTINUE_NOTE);
			return;
		}
		/*Get the current PDF doc info and print to console for comparison.*/
		stringsOld = F_ApiGetStrings(FV_SessionId, docId, FP_PDFDocInfo);
		if (stringsOld.len == 0)
				F_Printf(NULL, (StringT) "No PDF doc info.\n");
		else
		{
			F_Printf(NULL, (StringT) "Old PDF doc info:\n");
			printStrings(stringsOld);
		}

		/*Read file with pdf doc info. File format should be tab-delimited text file.*/
		strings = readStrings();
		if (strings.len != 0)
		{

			/* Set the the PDF document info with info from file. */
			FA_errno = FE_Success;
			F_ApiSetStrings(FV_SessionId, docId, FP_PDFDocInfo, &strings);
			F_ApiPrintFAErrno();

			if ((FA_errno == FE_BadParameter)||(FA_errno == FE_BadName)||(FA_errno == FE_InvalidString))
			{
				/*For info on restrictions of input for pdf doc info,
				see "PDF Document Info dictionaries" in the SDK Programmers Reference.*/
				F_ApiAlert("Badly formed PDF doc info file.", FF_ALERT_CONTINUE_NOTE);
				return;
			}

			else if (FA_errno != FE_Success)
			{
				F_ApiAlert("Could not set PDF doc info.", FF_ALERT_CONTINUE_NOTE);
				return;
			}

			/*Get the new PDF document info*/
			stringsNew = F_ApiGetStrings(FV_SessionId, docId, FP_PDFDocInfo);

			/*Print info to console for sanity check. The info should be displayed
			when the user clicks File>FileInfo through the GUI.*/
			if (stringsNew.len == 0)
				F_Printf(NULL, (StringT) "No PDF doc info.\n");
			else
			{
			F_Printf(NULL, (StringT) "PDF doc info:\n");
			printStrings(stringsNew);
			}

			/*Clean up.*/
			F_ApiDeallocateStrings(&stringsNew);
			F_ApiDeallocateStrings(&strings);
		}
	}
		
}

VoidT printStrings(F_StringsT strings)

{
	UIntT i;

	for (i=0; i < strings.len; i++)
		F_Printf(NULL, "%s\n", (StringT) strings.val[i]);
	F_Printf(NULL, "\n");
}

F_StringsT readStrings()

{
	#define BUFFERSIZE (IntT)3000
	F_StringsT strings;
	IntT err,i = 0,stringLen, inc;
	StringT sres, string;
	ChannelT chan;
	FilePathT *path;
	UCharT ptr[BUFFERSIZE], tab = *"\x9";
	IntT numread=0;

	/*Allow user to choose file to open.*/
	err = F_ApiChooseFile(&sres, "Choose DocInfo file.", "","docinfo.txt", FV_ChooseOpen, "");
	if (!err)
	{ 
		path = F_PathNameToFilePath(sres,NULL, FDefaultPath);
		if((chan = F_ChannelOpen(path,"r")) == NULL)
		{
			F_ApiAlert("Couldn't open file.\n", FF_ALERT_CONTINUE_WARN);
			F_ApiDeallocateString(&sres);
			strings.len = 0;
			return strings;
		}
		
		/*Read the selected file into a buffer.*/
		numread = F_ChannelRead(ptr, sizeof(UCharT),BUFFERSIZE-1, chan);

		if (!F_ChannelEof(chan))
		{
			F_Printf(NULL, "Doc info file too big. Ignoring buffer after %d bytes OR increase the BUFFERSIZE.", BUFFERSIZE-1);
		}

		ptr[numread] = '\0';
		F_ChannelClose(chan);
		F_ApiDeallocateString(&sres);

		/*Read the buffer tab-delimited string by string to create a list of strings.*/
		strings.len = 0;

		/*Ignore BOM byte if present.*/
		if (ptr[0]==0xEF && ptr[1]==0xBB && ptr[2]==0xBF)
		{
			i=3;
		}
		else
		{
			i=0;
		}

		while (i<numread)
		{
			
			/*Find out the length of first string before tab.*/
			for (stringLen=0;F_CharUTF8ToUTF32(ptr+i)!=(IntT)tab;)
			{
				inc=F_UTF8CharSize(ptr[i]);
				i+=inc;
				stringLen+=inc;
			}

			/*Allocate memory for string.*/
			string = (UCharT *) F_Alloc(sizeof(UCharT)*stringLen + 1, NO_DSE);

			if (string != NULL)
			{
				/*Copy the string to this allocated buffer*/
				F_StrCpyNEnc(string, &ptr[i-stringLen], stringLen+1, fdeUTF8EncodingId); 
				string[stringLen]='\0';
			}
			else
			{
				F_Printf(NULL, "Memory Allocation error.");
				strings.len = 0;
				return strings;
			}

			if (stringLen == 0)
			{
				F_ApiAlert("Empty file.\n", FF_ALERT_CONTINUE_WARN);
				strings.len = 0;
				F_ClearPtr(ptr, BUFFERSIZE-1);
				return strings;
			}
			/*Allocate memory for NULL character to end string.*/
			/*string = (UCharT *) F_Realloc(string,stringLen+1*sizeof(UCharT), NO_DSE);
			F_StrTrunc(string, stringLen);*/

			/*Allocate memory for strings structure and add strings.*/
			if (strings.len++)
				strings.val = (StringT *) F_Realloc(strings.val,strings.len*sizeof(StringT), NO_DSE);
			else
				strings.val = (StringT*) F_Alloc(sizeof(StringT), NO_DSE);
			strings.val[strings.len-1] = string;

			/*Increament for the tab character.*/
			i++;
		}

	}
	else
	{
		/*File open was cancelled by user.*/ 
		strings.len = 0;
		return strings;
	}

	F_ClearPtr(ptr, BUFFERSIZE-1);
	return strings;
} 

