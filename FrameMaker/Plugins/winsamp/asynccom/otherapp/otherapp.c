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
 *	    otherapp
 *
 * General Description:
 *		Simple executable client application to connect to a FrameMaker API client
 *		which is registered as a DDE server. The ddeclnt sample in the FDK samples
 *		folder is a sample DDE server client you can register and use to test this 
 *		application.
 *
 * Invocation:
 *		Compile and run this client. A small window is displayed from which you can 
 *		connect to the FrameMaker client and send either execute or request 
 *		transactions. A current FM session must exist in order to connect.
 *
 *		The client interprets "execute" transactions as hypertext commands. Try 
 *		"gotopage 3" for example.
 *
 *		A "request" transaction with an item of "CharTag" will retrieve the
 *		character tag of the beginning of the selection. The request "CharTag"
 *		is the only request implemented in the companion ddeclnt client sample.
 * 
 *	Exceptions:
 *		Windows only.
 *
 ***********************************************************************/

#include <windows.h>
#include <ddeml.h>
#include <stdarg.h>

#include "otherapp.h"

static LPWSTR appName = L"DDE Demo";

static HINSTANCE appInstance;
static HCONV convId;
static DWORD ddeInst;

int errMsg(HWND owner, UINT style, TCHAR* fmt, ... )
{
	TCHAR text[500];
	va_list args;

	va_start(args, fmt);
	wvsprintf(text, fmt, args);
	va_end(args);

	return MessageBox(owner, text, L"DDE Demo", style|MB_APPLMODAL);
}  	 

BOOL CALLBACK DdeDemoProc(HWND dlg, UINT msg, WPARAM wParam, LPARAM lParam)
{
	unsigned int err=0;

	switch ( msg )
	{
	case WM_INITDIALOG:
		/* Set up initial application and topic name */
		SetDlgItemText(dlg, IDC_APPLICATON, L"FrameDdeSample");
		SetDlgItemText(dlg, IDC_TOPIC, L"Session");
		return TRUE;

	case WM_COMMAND:
		switch (LOWORD(wParam))
		{
		case IDCANCEL:
		case IDC_EXIT:
			EndDialog(dlg,TRUE);
			return TRUE;

		case IDC_CONNECT:
			if (convId)
			{
				DdeDisconnect(convId);
				SetDlgItemText(dlg, IDC_CONNECT, L"Connect"); 
				convId = 0;
			}
			else
			{
				TCHAR buf[256];
				HSZ appHandle, topicHandle;

				/* Fetch and tokenize application and topic name */
				GetDlgItemTextW(dlg, IDC_APPLICATON, buf, sizeof buf);
				appHandle = DdeCreateStringHandle(ddeInst, buf, CP_WINUNICODE);
				GetDlgItemTextW(dlg, IDC_TOPIC, buf, sizeof buf);
				topicHandle = DdeCreateStringHandle(ddeInst, buf, CP_WINUNICODE);

				convId = DdeConnect(ddeInst, appHandle, topicHandle, NULL);

				

				err=DdeGetLastError(ddeInst);
				switch (err)
				{
				case DMLERR_DLL_NOT_INITIALIZED: errMsg(dlg, MB_OK, L"DMLERR_DLL_NOT_INITIALIZED");
					break;
				case DMLERR_INVALIDPARAMETER	: errMsg(dlg, MB_OK, L"DMLERR_INVALIDPARAMETER");
					break;
				case DMLERR_NO_CONV_ESTABLISHED	: errMsg(dlg, MB_OK, L"DMLERR_NO_CONV_ESTABLISHED");
					break;
				case DMLERR_NO_ERROR: 
					break;

				}


				DdeFreeStringHandle(ddeInst, appHandle);
				DdeFreeStringHandle(ddeInst, topicHandle);

				if (convId)
					SetDlgItemText(dlg,IDC_CONNECT, L"Disconnect"); 
				else
					errMsg(dlg, MB_OK, L"Can't Connect");
			}
			return TRUE;

		case IDC_EXECUTE:
			{
				TCHAR cmd[512];
				DWORD res;

				/* Get command text and invoke "execute" transaction */
				GetDlgItemText(dlg, IDC_COMMAND, (LPWSTR)cmd, sizeof cmd);
				if (!DdeClientTransaction((LPBYTE)cmd, sizeof cmd, convId, 0, 0,
						XTYP_EXECUTE, 15000, &res))
					errMsg(dlg, MB_OK, L"Can't Execute %s", cmd);
				if (LOWORD(res) != DDE_FACK)
					errMsg(dlg, MB_OK, L"Execute failed: %x", res);
			}
			return TRUE;

		case IDC_REQUEST:
			{
				TCHAR item[256];
				HSZ itemHandle;
				HDDEDATA res;

				/* Get request string and tokenize into an "item" */
				GetDlgItemText(dlg, IDC_ITEM, item, sizeof item);
				itemHandle = DdeCreateStringHandle(ddeInst, item, CP_WINUNICODE);

				res = DdeClientTransaction(0, 0, convId, itemHandle, CF_TEXT,
						XTYP_REQUEST, 15000, 0);

				DdeFreeStringHandle(ddeInst, itemHandle);

				if (res)
				{
					/* Unwrap the response data and fill in the reply control */	
					LPCWSTR reply = (LPCWSTR)DdeAccessData(res, 0);
					SetDlgItemText(dlg, IDC_REPLY, reply);
 					DdeFreeDataHandle(res);
				}
				else
					errMsg(dlg, MB_OK, L"Can't request %s", item);
			}
				
		} 
	}
	return FALSE;
}

HDDEDATA CALLBACK DdeCallBack(UINT type, UINT format, HCONV hconv,
	HSZ hString1, HSZ hString2, HDDEDATA hData, DWORD dwData1,
	DWORD dwData2)
{
	/* Need a DDE callback, even if there's nothing to do */
	return 0;
}

int WINAPI WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR cmdLine, int cmdShow)
{
	UINT ddeStat;
	appInstance = hInst;

	ddeStat = DdeInitializeW(&ddeInst, DdeCallBack,
		APPCLASS_STANDARD|APPCMD_CLIENTONLY, 0L);
	if (ddeStat)
	{
		errMsg(0, MB_OK, L"Can't Initialize: %d", ddeStat);
		return 1;
	}
	 
	DialogBox(hInst, L"DDE_DEMO", 0, DdeDemoProc);

	if (convId)
		DdeDisconnect(convId);
					
	if (!DdeUninitialize(ddeInst))
		errMsg(0, MB_OK, L"Can't UnInitialize" );

	return 1;	
}

