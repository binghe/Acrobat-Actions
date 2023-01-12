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
 *		setxmpinfo
 *	
 *	General Description:
 *		Sample program which reads a string from a text file and sets the 
 *		FP_FileInfoPacket property to the string. The string must be a valid XMP 
 *		packet string for the property to be set. Any info which is mapped to PDF 
 *		info is propagated to the PDF info when the FP_FileInfoPacket property is 
 *		set.
 *
 *		The program gets the FP_FileInfoPacket and prints it to the console 
 *		or to a file.
 *
 *		An alternate method of modifying the XMP packet is to use an external XMP 
 *		processing application to modify the XMP packet in the FASL file, This is
 *		beyond the scope of this client.
 *
 *		A sample XMP packet info file is included.
 *
 *		A StringT structure holds the XMP packet info as a document property,
 *		FP_FileInfoPacket. F_ApiGetString and F_ApiSetString are used to get and set 
 *		the property.
 *
 *		Note that a side of effect of setting FP_FileInfoPacket is that 
 *		FP_PDFDocInfo is updated as well. Conversely, setting FP_PDFDocInfo 
 *		updates the XMP packet when the file is saved.
 *
 *	Invocation:
 *		Open FrameMaker and a FrameMaker document. Click API_Test on the Main Menu.
 *		To read an XMP packet info file and set the FP_FileInfoPacket property, 
 *		click "Read XMP packet file". When prompted, select a text file with XMP 
 *		packet info. To get and print the FP_FileInfoPacket property, click "Print 
 *		XMP packet to file" or "Print XMP packet to console".
 *
 *   Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name setxmpinfo>
 *			<Description gets, sets and prints XMP packet info>
 *			<Directory fdk_install_dir/samples/setxmpinfo>
 *			<CommandLine $FAPIDIR/fa.setxmpinfo>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.setxmpinfo>
 *		to:
 *			<SharedLibrary fa.setxmpinfo.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your  maker.ini file:
 *
 *		setxmpinfo=Standard,Gets/sets and prints the PDF doc info, 
 *			fdk_install_dir\samples\setxmpinfo\debug\setxmpinfo.dll, all 
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
#include "fdetypes.h"
#include "fmemory.h"
#include "futils.h"
#include "fstrings.h"
#include "fchannel.h"
#include "fioutils.h"

#define GETXMPFILE 1
#define PRTXMPCONSOLE 3
#define PRTXMPFILE 4

/* Function protocols */
VoidT printToFile(VoidT);
VoidT printToConsole(VoidT);
StringT readXMPFile(FilePathT *path);
VoidT printString(StringT string, FilePathT *path);
FilePathT *getFilePath(IntT mode);


VoidT F_ApiInitialize(IntT init)
{
	F_ObjHandleT apiMenuId, docMenuBarId, bkMenuBarId;
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init)
	{
	case FA_Init_First:
		/* add commands to document menu */
		docMenuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
		apiMenuId = F_ApiDefineAndAddMenu(docMenuBarId, "APIMenu", "API_Test");
		
		F_ApiDefineAndAddCommand(GETXMPFILE, apiMenuId, "ReadFileCmd", "Read XMP packet file", "");
		F_ApiDefineAndAddCommand(PRTXMPCONSOLE, apiMenuId, "PrtConsoleCmd", "Print XMP packet to console", "");
		F_ApiDefineAndAddCommand(PRTXMPFILE, apiMenuId, "PrtFileCmd", "Print XMP packet to file", "");
		/* add commands to book menu */
		bkMenuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!BookMainMenu");
		F_ApiAddMenuToMenu(bkMenuBarId, apiMenuId);
		
		/* Bail */
		F_ApiBailOut();
		break;
		
	default:
		break;
	}
}

VoidT F_ApiCommand(IntT command)
{
	F_ObjHandleT objId;
	StringT fileInfo;
	FilePathT *path = NULL;
	
	F_FdeInit();
	if(! (objId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveDoc)))
	{
		if(! (objId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook)))
		{
			F_ApiAlert("Need an active doc or book!", FF_ALERT_CONTINUE_WARN);
			return;
		}
	}
	switch(command)
	{
	case PRTXMPCONSOLE:
		/*Get the xmp packet string.*/
		fileInfo = F_ApiGetString(FV_SessionId, objId, FP_FileInfoPacket);
		if (F_StrIsEmpty(fileInfo))
		{
			F_ApiAlert("Document has no XMP packet.\n", FF_ALERT_CONTINUE_WARN);
			return;
		}
		/*Print to console.*/
		printString(fileInfo,NULL);
		/*Clean up.*/
		F_Free(fileInfo);
		break;
		
	case PRTXMPFILE:
		/*Get the XMP packet string.*/
		fileInfo = F_ApiGetString(FV_SessionId, objId, FP_FileInfoPacket);
		if (F_StrIsEmpty(fileInfo))
		{
			F_ApiAlert("Document has no XMP packet.\n", FF_ALERT_CONTINUE_WARN);
			return;
		}
		/*Get path for file for printing.*/ 
		path = getFilePath(FV_ChooseSave);
		if (path != NULL)
		
		{
			/*Print to file.*/
			printString(fileInfo,path);
			/*Clean up.*/
			F_FilePathFree(path);
		}
		F_Free(fileInfo);
		break;
	case GETXMPFILE:
		/*Read a user-selected text file and set the property FP_FileInfoPacket to its contents.
		Get path for file to open.*/ 
		path = getFilePath(FV_ChooseOpen);
		if (NULL == path)
			break;
		fileInfo = readXMPFile(path);

		FA_errno = FE_Success;		
		/*This can fail if the text file contains invalid data.*/ 
		F_ApiSetString(FV_SessionId, objId, FP_FileInfoPacket, fileInfo);
		if (FA_errno)
		{
			F_ApiPrintFAErrno();
			F_ApiAlert("Didn't set FP_FileInfoPacket.\nMake sure the packet file is UTF-8 compatible.", FF_ALERT_CONTINUE_WARN);
			return;
		}
		
		/*Clean up.*/
		F_ApiDeallocateString(&fileInfo);
		F_FilePathFree(path);
		break;
	default:
		break;
	}
	F_ApiBailOut();
}

FilePathT *getFilePath(IntT mode)
{
	IntT err;
	StringT sres;
	FilePathT *path;
	
	FA_errno = FE_Success;
	
	err = F_ApiChooseFile(&sres, "Choose file.", "","", mode, "");
	if (FA_errno == FE_Transport)
	{
		/*FA_errno is set to FE_Transport if F_ApiChooseFile fails.*/
		F_ApiAlert("Problem selecting file.\n", FF_ALERT_CONTINUE_WARN);
		return NULL;
	}
	if (!err) /*User didn't cancel Choose File dialog.*/
	{
		/*Create a platform independent path name for chosen file.*/
		path = F_PathNameToFilePath(sres,NULL, FDefaultPath);
		/*Clean up.*/
		F_ApiDeallocateString(&sres);
		/*Return path to calling function.*/
		return path;
	}
	else
		return NULL;/*User canceled file choose dialog.*/
}


StringT readXMPFile(FilePathT *path){

	StringT buf;
	ChannelT chan;
	IntT numread, size;	
	
	/*Open file for reading.*/
	if((chan = F_ChannelOpen(path,"r")) == NULL)
	{
		F_ApiAlert("Couldn't open file.\n", FF_ALERT_CONTINUE_WARN);
		return NULL;
	}
	/*Get the size of the file and allocate memory for buffer.*/
	size = F_ChannelSize(chan);
	buf = (UCharT*) F_Alloc(size+1*sizeof(UCharT), NO_DSE);
	/*Read file into buffer.*/
	numread = F_ChannelRead(buf, sizeof(UCharT),size, chan);
	buf[numread] = '\0';
	/*Assuming the file is UTF 8 or Ascii*/

	/*Close file.*/
	F_ChannelClose(chan);
	return buf;
}

VoidT printString(StringT string, FilePathT *path)
{
	
	F_StringsT strings;
	UIntT k,i = 0, stringLen,len, buffersize =1000;
	StringT buf;
	ChannelT chan;

	
	len = F_StrLen(string);
	if (path != NULL) /* Print to file in this case.*/
	{
		/*Open file for writing.*/
		if((chan = F_ChannelOpen(path,"w")) == NULL)
		{
			F_ApiAlert("Couldn't open file.\n", FF_ALERT_CONTINUE_WARN);
			return;
		}
	}
	else 
		chan = NULL;
		/*Printing to console using F_Printf is truncated and printing to file on Mac
		platform crashes if the string is long.
		If the string is less than buffersize, print using F_printf, else print string in pieces.*/
	if (len < buffersize) 
		F_Printf(chan, "%s", string);
	else
	{
		/*You could print to the console one character at a time, but this is
		quite slow. The following code breaks the string into a series of strings
		and prints one after the other.*/
		strings.len = 0;
		while (i<len)
		{
			stringLen=0;
			k = 0;
		
			while (stringLen < buffersize)
			{			
				/*Allocate memory for the buffer.*/
				if (stringLen++)
					buf = (UCharT *) F_Realloc(buf,stringLen+1*sizeof(UCharT), NO_DSE);
				else
					buf = (UCharT*) F_Alloc(sizeof(UCharT), NO_DSE);
				/*Assign up to buffersize characters to the buffer.*/
				buf[stringLen-1] = string[i];
				i++;					
			}
			/*Allocate memory for NULL character to end string.*/
			F_StrTrunc(buf, stringLen);
			
			/*Allocate memory for strings structure and add strings.*/
			if (strings.len++)
				strings.val = (StringT *) F_Realloc(strings.val,strings.len*sizeof(StringT), NO_DSE);
			else
				strings.val = (StringT*) F_Alloc(sizeof(StringT), NO_DSE);
			strings.val[strings.len-1] = buf;
		}
		
		/*Print strings.*/
		for (i=0; i < strings.len; i++)
			F_Printf(chan, "%s", (StringT) strings.val[i]);
		F_Printf(chan, "\n");

		/*Clean up.*/
		F_ApiDeallocateStrings(&strings);
	}
		/*Close file.*/
		F_ChannelClose(chan);
}
