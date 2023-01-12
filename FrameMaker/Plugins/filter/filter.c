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
 *	    filter
 *
 * General Description:
 *		This filter is the same as the example filter presented
 *		in Chapter 15 of the FDK Programmer's Guide. It filters text
 *		files into Frame product documents.
 *
 * Invocation:
 *		To start this client, follow the instructions in Install Info
 *		below, then restart the Frame Product. Open a text-only file with
 *		the .krt extension on Windows or UNIX. The client filters the file 
*		into a new Frame product document
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name TxtByKrt>
 * 			<Type TextImport>
 * 			<FormatId KURT>
 * 			<Facet KURT>
 * 			<VendorId FAPI>
 *			<DisplayName TxtByKrt>
 *			<Products Maker MakerSGML>
 * 			<Suffix krt>
 * 			<Directory fdk_install_dir/samples/filter>
 * 			<CommandLine $FAPIDIR/TxtByKrt>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files. This path is 
 *		used to locate resource files for the client. The FAPIDIR
 *		should point to the directory containing the compiled client.
 *		These paths can be the same.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/TxtByKrt>
 *		to:
 *			<SharedLibrary TxtByKrt.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		TxtByKurt=TextImport, KURT, KURT, FAPI, TxtByKurt,Filter to read text file, 
 *		fdk_install_dir\samples\filter\debug\filter.dll,all,^.krt
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fdetypes.h"
#include "fapi.h"
#include "fchannel.h"
#include "fmemory.h"
#include "fmetrics.h"
#include "futils.h"
#include "fioutils.h"
#include "fstrings.h"

#define BUFFERSIZE 1025
#define in (MetricT)(72*65536)

VoidT F_ApiNotify(notification, docId, sparm, iparm)
	IntT notification;
	F_ObjHandleT docId;
	StringT sparm;
	IntT iparm;
{
	FilePathT *path;
	ChannelT chan;
	F_TextLocT tl;
	StringT buf;
	IntT count; 

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	F_FdeInit();
	buf = F_Alloc(BUFFERSIZE, NO_DSE);
	if (buf == NULL)
	{
		F_ApiBailOut();
		F_ApiReturnValue(0);
		return; 
	}

	path = F_PathNameToFilePath(sparm, NULL, FDefaultPath);
	if (path == NULL) return;
	if((chan = F_ChannelOpen(path,"r")) == NULL) return;
	
	docId = F_ApiCustomDoc(F_MetricFractMul(in, 17, 2), 
    			11*in, 1, F_MetricFractMul(in, 1, 4), in, 
    			in, in, in, FF_Custom_SingleSided, False);					
	
	tl.objId = F_ApiGetId(FV_SessionId, docId, FP_MainFlowInDoc);
	tl.offset = 0;

	while(!F_ChannelEof(chan))
	{
		count = F_ReadBytes(buf, BUFFERSIZE-1, chan);
		buf[count] = '\0';
		tl = F_ApiAddText(docId, &tl, buf);
	}
	
	F_ApiReturnValue(docId);
	F_FilePathFree(path);
	F_Free(buf);
	F_ChannelClose(chan);
	F_ApiBailOut();
}

