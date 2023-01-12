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
 *	eewriter
 *
 * General Description:
 *	Converts upper case characters to lower case as the user types.
 *
 * Invocation:
 *	In a Frame document, attempt to type in Upper Case characters.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name eewriter>
 *			<Description Converts uppercase chars to lower case while user types>
 *			<Directory fdk_install_dir/samples/eewriter>
 *			<CommandLine $FAPIDIR/fa.eewriter>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.eewriter>
 *		to:
 *			<SharedLibrary fa.eewriter.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your  maker.ini file:
 *
 *		eewriter=Standard,Converts uppercase chars to lower case while user types,
 *			fdk_install_dir\samples\eewriter\debug\eewriter.dll, all 
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
#include "fcharmap.h"
#include "fcodes.h"
#include "fstrings.h"
#include "fencode.h"

VoidT F_ApiInitialize(init)
IntT init;{

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	/* set up menus then free system resources by bailing out */
	switch(init){
		/* request notification before carrying out function */
	case FA_Init_First:
		F_ApiBailOut();
		F_ApiNotification(FA_Note_PreFunction, True);
		break;
	
	/* check for misregistered client file */
	case FA_Init_DocReport:
		F_ApiBailOut();
		F_ApiAlert((StringT) "Client misregistered as document report.", FF_ALERT_CONTINUE_WARN);
		break;

	default:
		break;
	}
}

/* Callback to handle registered events */
VoidT F_ApiNotify(notification, docId, sparm, iparm)
IntT notification;
F_ObjHandleT docId;
StringT sparm;
IntT iparm;{
	BoolT intercept;
	F_TextRangeT tRange;
	StringT		param_str;
	
	F_ApiBailOut();
	switch(notification){
	case FA_Note_PreFunction:
		switch(iparm){
		case TYPEIN:
			intercept = False;
			for(param_str = sparm; *param_str!='\0'; F_UTF8NextChar(&param_str)){
				if(F_CharIsUpperUTF8(param_str)){
					F_CharToLowerUTF8(param_str, param_str);
					intercept = True;
				}
			}
			/* if there was lower case character, cancel the insert
			* and write text directly to document at current insertion
			* point */
			if(intercept){
				/* cancel the insert */
				F_ApiReturnValue(FR_CancelOperation);
				/* code to get the text range and insert text */
				tRange = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
				F_ApiAddText(docId, &tRange.beg, sparm);
				tRange.beg.offset += F_StrLenEnc(sparm, fdeUTF8EncodingId);
				tRange.end.offset = tRange.beg.offset;
				F_ApiSetTextRange(FV_SessionId, docId, FP_TextSelection, &tRange);
			}
			break;
		}
		break;
	}
}
