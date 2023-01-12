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
 *	    ddeclnt
 *
 * General Description:
 *		Demonstrates registering FrameMaker a client as a DDE server.
 *		This client registers as DDE application "FrameDdeSample"
 *		and accepts both execute and request transactions from the 
 *		client "otherapp".
 *
 * Invocation:
 *		Register the client and start FrameMaker. Register and run the 
 *		client "otherapp".
 *
 *		Execute transactions interpret their data as hypertext commands
 *		and execute them against the current document.
 *
 *		Request transactions for an item of "CharTag" return the first
 *		character tag of the selected text, if any.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		ddeclnt=Standard, Frame DDE Sample client,
 *			fdk_install_dir\samples\winsamp\asynccom\ddeclnt\debug\ddeclnt.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		DDE callbacks can occur at times when FrameMaker is not prepared
 *		to deal with API calls (for instance, while a modal dialog is up).
 *		In these cases, FrameMaker API calls will fail
 *		and set FA_errno to FE_Busy.  If you pass the DDE instance
 *		returned from DdeInitialize to F_ApiSetDdeInstance(ddeInstance),
 *		FrameMaker will enable and disable DDE dispatching so that no calls
 *		will occur when FrameMaker cannot handle API calls.	
 *
 ***********************************************************************/

#include <windows.h>
#include <ddeml.h>

#include "fapi.h"
#include "fencode.h"
#include "fdetypes.h"

/* DDE Initialization instance ID */
static DWORD ddeInst;

/* DDE String Handles */
static HSZ hszFrameDDE, hszCharTag;

/*
 * Dde Callback for asynchronous messages
 */

HDDEDATA CALLBACK DdeCallBack(UINT type, UINT format,
	HCONV conv, HSZ hsz1, HSZ hsz2, HDDEDATA hData,
	DWORD data1, DWORD data2)
{	
	switch (type)
	{
	case XTYP_CONNECT:
		/* Accept connection */
		return (HDDEDATA)TRUE;
		break;
	
	case XTYP_EXECUTE:
		{
			TCHAR utf8str[256];
			UIntT numbytes;
			/*
			 * Execute "data" as a hypertext command
			 * against the active document
			 */
			F_ObjHandleT activeDoc = F_ApiGetId(0,
				FV_SessionId, FP_ActiveDoc);
			DWORD lng;
			LPCWSTR buf = (LPCWSTR)DdeAccessData(hData,
				&lng);
			HDDEDATA res = (HDDEDATA)DDE_FACK;

			numbytes=WideCharToMultiByte(CP_UTF8, 0, buf, -1, 
					utf8str, sizeof utf8str, NULL, NULL);
			if(0 == numbytes)
			{
				F_ApiAlert((StringT)"Can't convert comand to utf8 string.",
					FF_ALERT_OK_DEFAULT);
				res = DDE_FNOTPROCESSED;
			}
			else if (!activeDoc
				|| F_ApiHypertextCommand(activeDoc,	utf8str))
				res = DDE_FNOTPROCESSED;

			DdeUnaccessData(hData);
			return (HDDEDATA)DDE_FACK;
		}

	case XTYP_REQUEST:
		/*
		 * item == "CharTag": retrieve 1st character tag
		  * of selected text
		 */
		if (hsz2==hszCharTag && format==CF_TEXT)
		{
			F_TextRangeT tr;
			F_PropValsT pv;
			F_ObjHandleT activeDoc;
			StringT tag;
			CharT wstr[256*2]; /*size is multiplied by 2 because its used for storing wide char string.*/
			IntT wLen;

			activeDoc = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
			if (!activeDoc)
				break;
			tr = F_ApiGetTextRange(FV_SessionId, activeDoc,
				FP_TextSelection);
			if (!tr.beg.objId)
				break;
			pv = F_ApiGetTextProps(activeDoc, &tr.beg);
			tag = pv.val[F_ApiGetPropIndex(&pv,FP_CharTag)]
				.propVal.u.sval;

			wLen=MultiByteToWideChar(CP_UTF8, 0, tag, -1, (LPWSTR)wstr, (sizeof wstr)/(sizeof wstr[0]));
			/*wLen is the number of wide chars written including NULL .*/
			return DdeCreateDataHandle(ddeInst,
				(LPBYTE)wstr, wLen*2,
				0, hsz2, CF_TEXT, 0);
		}
	}
	return (HDDEDATA) NULL;
}


VoidT	F_ApiInitialize(IntT init)
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch (init)
	{
	case FA_Init_First:
		/* We need to know when FM exits */
		F_ApiNotification(FA_Note_PostQuitSession, True);
   		
		/* Register as a DDE server */
		if (DdeInitializeW(&ddeInst, DdeCallBack, APPCLASS_STANDARD, 0))
    	{
			F_ApiAlert((StringT)"DDE Initialize FAILED.",
				FF_ALERT_OK_DEFAULT);
			break;
		}

		/* Register the DDE Instance ID with the FrameMaker API */
		F_ApiSetDdeInstance(ddeInst);

		/* Create DDE string handles */
		hszFrameDDE = DdeCreateStringHandleW(ddeInst,
			L"FrameDdeSample", CP_WINUNICODE);
		hszCharTag = DdeCreateStringHandleW(ddeInst,
			L"CharTag", CP_WINUNICODE);
		
   		/* Register service name */
		if (DdeNameService(ddeInst,	hszFrameDDE, 0, DNS_REGISTER) == 0)
			F_ApiAlert((StringT)"DDE NameService FAILED.",
				FF_ALERT_OK_DEFAULT);
		break;
	}
}

VoidT F_ApiNotify(IntT notification, F_ObjHandleT docId, StringT filename, IntT iparm)
{
	switch (notification)
	{
	case FA_Note_PostQuitSession:
		/* Free DDE String Handles */
		DdeFreeStringHandle(ddeInst, hszFrameDDE);
		DdeFreeStringHandle(ddeInst, hszCharTag);

		/* Unregister DDE Instance with FrameMaker */
		F_ApiSetDdeInstance(0);

		/* Unregister with DDE */
	    if (!DdeUninitialize(ddeInst))
    		F_ApiAlert((StringT)"Unable to Uninitialize DDE",
    			FF_ALERT_OK_DEFAULT);
		break;
	}
}
