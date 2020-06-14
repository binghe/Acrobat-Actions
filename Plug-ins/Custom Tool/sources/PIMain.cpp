/*********************************************************************

 ADOBE SYSTEMS INCORPORATED
 Copyright (C) 1994-2015 Adobe Systems Incorporated
 All rights reserved.

 NOTICE: Adobe permits you to use, modify, and distribute this file
 in accordance with the terms of the Adobe license agreement
 accompanying it. If you have received this file from a source other
 than Adobe, then your use, modification, or distribution of it
 requires the prior written permission of Adobe.

 ---------------------------------------------------------------------

 PIMain.cpp

 - Source code that must be linked into every plug-in.

*********************************************************************/

#include "Environ.h"

#include "PICommon.h"
#include "PIMain.h"
#include "ASCalls.h"
#include "AVCalls.h"
#include "CorCalls.h"
#include "ASExtraCalls.h"


#include "CosCalls.h"
#include "PDCalls.h"
#include "PEWCalls.h"
#include "PERCalls.h"
#include "PSFCalls.h"
#include "PDMetadataCalls.h"
#include "PDSReadCalls.h"
#include "PDSWriteCalls.h"
#include "PagePDECntCalls.h"
#include "AcroColorCalls.h"
#if WIN_PLATFORM
#include "WinCalls.h"
#elif MAC_PLATFORM
#include "MacCalls.h"
#elif UNIX_PLATFORM
#include "UnixCalls.h"
#else
#error platform not defined
#endif

/* This is for testing only.  Leave it set to 0xFFFFFFFF for final version */
#define TEST_OLD_VERSION 0xFFFFFFFF /*set lower to test old versions.  set to 0x00050000 to simulate acrobat 5.0*/

HFT gCoreHFT = 0;
ASUns32 gCoreVersion = 0;

#if WIN_PLATFORM

#if defined(__cplusplus)
#define DI_EXTERN_C extern "C"
#else
#define DI_EXTERN_C extern
#endif

// There are internal hooks for delay loading if enabled
typedef void (*DelayLoadInitPtr)(HINSTANCE hInstance) ;
typedef void (*DelayLoadTermPtr)();
DI_EXTERN_C DelayLoadInitPtr gDelayLoadInit = 0;
DI_EXTERN_C DelayLoadTermPtr gDelayLoadTerm = 0;
#endif

#if DEBUG
/* For special DURING/HANDLER catching */
int gBadReturnCatcher;
#endif


HFT gAcroSupportHFT;
ASUns32 gAcroSupportVersion =0;

#if PI_COS_VERSION != 0
HFT gCosHFT = 0;
ASUns32 gCosVersion = 0;
#endif

#if PI_PDMODEL_VERSION != 0
HFT gPDModelHFT = 0;
ASUns32 gPDModelVersion = 0;
#endif

#if PI_PDFEDIT_READ_VERSION != 0
HFT gPDFEditReadHFT = 0;
ASUns32 gPDFEditReadVersion = 0;
#endif

#if PI_PDFEDIT_WRITE_VERSION != 0
HFT gPDFEditWriteHFT = 0;
ASUns32 gPDFEditWriteVersion = 0;
#endif

#if PI_PDSYSFONT_VERSION != 0
HFT gPDSysFontHFT = 0;
ASUns32 gPDSysFontVersion = 0;
#endif

#if PI_PAGE_PDE_CONTENT_VERSION != 0
HFT gPagePDEContentHFT = 0;
ASUns32 gPagePDEContentVersion = 0;
#endif

#if PI_ACROVIEW_VERSION != 0
HFT gAcroViewHFT = 0;
ASUns32 gAcroViewVersion = 0;
#endif

#if PI_PDSEDIT_WRITE_VERSION != 0
HFT gPDSWriteHFT = 0;
ASUns32 gPDSWriteVersion = 0;
#endif

#if PI_PDSEDIT_READ_VERSION != 0
HFT gPDSReadHFT = 0;
ASUns32 gPDSReadVersion = 0;
#endif

#if PI_MACINTOSH_VERSION != 0
HFT gMacintoshHFT = 0;
ASUns32 gMacintoshVersion = 0;
#endif

#if PI_UNIX_VERSION != 0
HFT gUnixHFT = 0;
ASUns32 gUnixVersion = 0;
#endif

#if PI_WIN_VERSION != 0
HFT gWinHFT = 0;
ASUns32 gWinVersion = 0;
#endif

#if PI_ASEXTRA_VERSION != 0
HFT gASExtraHFT = 0;
ASUns32 gASExtraVersion = 0;
#endif

#if PI_PDMETADATA_VERSION != 0
HFT gPDMetadataHFT = 0;
ASUns32 gPDMetadataVersion = 0;
#endif

#if PI_ACROCOLOR_VERSION != 0
HFT gAcroColorHFT;
ASUns32 gAcroColorVersion = 0;
#endif

#if PI_ACROCOLOR_PRIVATE_VERSION != 0
HFT gAcroColorPrivateHFT;
ASUns32 gAcroColorPrivateVersion = 0;
#endif

#if WIN_PLATFORM
#if PI_TRUSTFRAMEWORK_VERSION != 0
HFT gTrustFrameworkHFT;
ASUns32 gTrustFrameworkVersion = 0;
#endif
#endif

#if PI_PERFORMANCETIMER_VERSION != 0
HFT gPerformanceTimerHFT;
ASUns32 gPerformanceTimerVersion = 0;
#endif

ExtensionID gExtensionID;		/* A identifying cookie sometimes needed by the application */

#if WIN_PLATFORM

#include <windows.h>
#if DEBUG
#include <tchar.h>
#endif

HINSTANCE 	gHINSTANCE;
HWND 		gHWND;

#if (!_USRDLL && !_AFXDLL  && !CUSTOM_DLLMAIN)  /* Omit DllMain for MFC plug-ins and plug-ins with custom DllMain */

/***************************************************************************************************
The DllMain Function

Unlike Windows 3.x DLLs, Windows NT calls one function, DllMain, for both initialization and 
termination. It also makes calls on both a per-process and per-thread basis, so several initialization 
calls can be made if a process is multithreaded. 

DllMain uses the WINAPI convention and three parameters. The function returns 
TRUE (1) to indicate success. If, during per-process initializati


The lpReserved parameter is reserved for the system's use and should not 
be manipulated .

Win32 DLL initialization functions are passed the following information:

	The hModule parameter, a module handle for the dll
	The ul_reason_for_call parameter, an enumerated type that indicates which 
	of four reasons the LibMain procedure is being called: 
		process attach, 
		thread attach, 
		thread detach, 
		or process detach.

	The lpReserved parameter, which is unused.

	All calls to local memory management functions operate on the default heap.
	The command line can be obtained from GetCommandLine API function.
********************************************************************/                                                                          


BOOL APIENTRY DllMain( HANDLE hModule, 
                        DWORD ul_reason_for_call, 
                        LPVOID lpReserved )
{
    switch( ul_reason_for_call ) {

    case DLL_PROCESS_ATTACH: //A new process is attempting to access the DLL; one thread is assumed.
		DisableThreadLibraryCalls( (HMODULE) hModule); //we do not use the Thread_Attach or Thread_detach cases
		gHINSTANCE = (HINSTANCE)hModule;
		if(gDelayLoadInit)
			gDelayLoadInit(gHINSTANCE);

	break;	
    case DLL_THREAD_ATTACH://A new thread of an existing process is attempting to access the DLL; this call is made beginning with the second thread of a process attaching to the DLL.
    	break;
    case DLL_THREAD_DETACH://One of the additional threads (not the first thread) of a process is detaching from the DLL.
	break;
    
    case DLL_PROCESS_DETACH://A process is detaching from the DLL.
		if(gDelayLoadTerm)
			gDelayLoadTerm();
    	break;
    }
    return TRUE;
}

#endif /* custom DllMain */

/* This struct contains platform specific data useful to plug-ins.  This structure may grow over time
** to include new things.  But, we will always support the old structure
** and only add to the end.
*/

typedef struct V0200_DATA_t_ {
	HWND 		hWnd;
	HINSTANCE	hInstance;
} V0200_DATA;

#if _WIN32
ASBool CALLBACK PlugInMain(ASUns32 appHandshakeVersion,
													ASUns32 *handshakeVersion,
													PISetupSDKProcType* setupProc,
													void* windowsData)
#else
ASBool _far _pascal _export _loadds PlugInMain(ASUns32 appHandshakeVersion,
													ASUns32 *handshakeVersion,
													PISetupSDKProcType* setupProc,
													void* windowsData)
#endif /* else _WIN32 */

#elif MAC_PLATFORM

typedef struct _t_PluginMainData
{
	size_t			size;
	CFBundleRef		bundle;
	CFBundleRef		appBundle;
} PluginMainData;

CFBundleRef	gAppBundle = NULL;
CFBundleRef	gPluginBundle = NULL;

#ifdef __cplusplus
extern "C"
#endif
ResFileRefNum GetAcroPluginResourceMap()
{
	static ResFileRefNum refNum = kResFileNotOpened;
	if ((refNum == kResFileNotOpened) && gPluginBundle)
		refNum = CFBundleOpenBundleResourceMap(gPluginBundle);
	return refNum;
}

#ifdef __cplusplus
extern "C"
#endif
ACCB1 ASBool ACCB2 AcroPluginMain(	ASUns32				appHandshakeVersion,
									ASUns32				*handshakeVersion,
									PISetupSDKProcType	*setupProc,
									PluginMainData		*mainData)

#elif UNIX_PLATFORM

void  *gHandle;

typedef struct V0100_DATA_t_ {
	void *handle;
} V0100_DATA;
    
#ifdef __cplusplus
extern "C"
#endif
#if LINUX
ACCB1 ASBool ACCB2 __attribute__ ((visibility ("default"))) PlugInMain(ASUns32				appHandshakeVersion,
#else
ACCB1 ASBool ACCB2											PlugInMain(ASUns32				appHandshakeVersion,
#endif
			 			 ASUns32			*handshakeVersion,
						 PISetupSDKProcType	*setupProc,
						 void				*unixData)

#endif
{
#if WIN_PLATFORM
	V0200_DATA* dataPtr = (V0200_DATA*) windowsData;
	gHWND = dataPtr->hWnd;
	gHINSTANCE = dataPtr->hInstance;
#elif MAC_PLATFORM
	gPluginBundle = (CFBundleRef) CFRetain(mainData->bundle);
	gAppBundle = (CFBundleRef) CFRetain(mainData->appBundle);
#elif UNIX_PLATFORM
	V0100_DATA* dataPtr = (V0100_DATA*) unixData;
	gHandle = dataPtr->handle;
#endif

	/*
	** appsHandshakeVersion tells us which version of the handshake struct the application has sent us.
	** HANDSHAKE_VERSION is the latest version that we, the plug-in, know about (see PIVersn.h)
	** Always use the earlier of the two structs to assure compatibility.
	** The version we want to use is returned to the application so it can adjust accordingly.
	*/
	*handshakeVersion = (appHandshakeVersion < HANDSHAKE_VERSION) ? appHandshakeVersion : HANDSHAKE_VERSION;

	/* Provide the routine for the host app to call to setup this plug-in */
	*setupProc = PISetupSDK;

	return TRUE;
}

#if !defined(USE_CPLUSPLUS_EXCEPTIONS_FOR_ASEXCEPTIONS)
	#error	// CorCalls.h must be included to define USE_CPLUSPLUS_EXCEPTIONS_FOR_ASEXCEPTIONS
#endif

#if USE_CPLUSPLUS_EXCEPTIONS_FOR_ASEXCEPTIONS

void miThrowExceptionToHandler(void *asEnviron)
{
	_miExceptionInfo exc;
	exc.dummy = 0;	// remove compiler warning (since C code, no constructor assumed)
	throw (exc);
}

#else /* USE_CPLUSPLUS_EXCEPTIONS_FOR_ASEXCEPTIONS */
ACCB1 void ACCB2 RestorePlugInFrame(void *asEnviron)
{
	ACROlongjmp(*(ACROjmp_buf *)asEnviron, 1);

#if MAC_PLATFORM
	#if DEBUG
	DebugStr("\pRestorePluginFrame didn't jump anywhere!");
	#endif
#endif
}

#endif /* USE_CPLUSPLUS_EXCEPTIONS_FOR_ASEXCEPTIONS */


/* pass in name of hft and minimum required version.  
   returns hft and version of the returned hft (>= requiredVer) and true if successful
   on failure, both resultHFT and resultingVer return as NULL
*/
ASBool GetRequestedHFT(const char* table, ASUns32 requiredVer, ASUns32 *resultingVer, HFT *resultHFT)
{
	ASAtom tablename = ASAtomFromString(table);
	ASVersion resultVer = HFT_ERROR_NO_VERSION;
	/* these are the versions of Acrobat where we did not support GetVersion of an HFT. */
	static const ASUns32 versionLessVersions[] = {0x00050001, 0x00050000, 0x00040005, 0x00040000, 0x00020003, 0x00020002, 0x00020001};
	static const ASSize_t kNUMVERSIONS = sizeof(versionLessVersions) / sizeof(ASUns32);

	ASSize_t i;
	HFT thft = NULL; /* we use a temp hft in case we are replacing gCoreHFT */

	if (gAcroSupportVersion >= ASCallsHFT_VERSION_6) {
		thft = ASExtensionMgrGetHFT(tablename, requiredVer); 
		if (thft) {
			resultVer = HFTGetVersion(thft);
				ACROASSERT(resultVer != HFT_ERROR_NO_VERSION); /* all Acrobat HFTs support HFTGetVersion */
			}
	}
	if (resultVer == HFT_ERROR_NO_VERSION){
		/* without a GetVersion version of the HFT, we must try all versions from latest on down and see what we get */
		for (i=0;i<kNUMVERSIONS;i++) {
			if (versionLessVersions[i]<requiredVer)
				break;
			thft = ASExtensionMgrGetHFT(tablename, versionLessVersions[i]);
			if (thft)
				break;
		}
		if (thft) 
			resultVer = versionLessVersions[i];
		else 
			resultVer = 0;
	}
	*resultHFT = thft;
	*resultingVer = resultVer;
#if TEST_OLD_VERSION < 0xFFFFFFFF
	if (*resultingVer > TEST_OLD_VERSION)
		*resultingVer = TEST_OLD_VERSION;
#endif
#if WIN_PLATFORM && DEBUG
	if (*resultingVer ==0) 
	{
		TCHAR err[255];
		wsprintf(err,_T("failed on %s version %s%x\n"),table,(requiredVer & kHFT_IN_BETA_FLAG) ?_T("(beta)"):_T(""),requiredVer & ~kHFT_IN_BETA_FLAG);
		OutputDebugString(err);
	}
#endif

	return *resultingVer != 0;
}
typedef struct {const char* name; ASUns32 ver; ASUns32* retver; HFT* hft; ASBool optional; } HFTINFO;

/* 
** This routine is called by the host application to set up the plug-in's SDK-provided functionality.
*/
ACCB1 ASBool ACCB2 PISetupSDK (ASUns32 handshakeVersion, void *sdkData)
{
	ASBool bSuccess;
	ASSize_t i;
	HFTINFO hftInfo[] = {
#if PI_CORE_VERSION == 0
#error Define PI_CORE_VERSION to 0x00020000 or over for core HFT.  This is not an optional HFT
#else
		{"Core",PI_CORE_VERSION,&gCoreVersion,&gCoreHFT,false},
#endif
#if PI_COS_VERSION != 0
		{"Cos",PI_COS_VERSION,&gCosVersion,&gCosHFT,
#ifdef PI_COS_OPTIONAL
		 true},
#else
		false},
#endif
#endif /* PI_COS_VERSION  */

#if PI_PDMODEL_VERSION != 0
		{"PDModel",PI_PDMODEL_VERSION,&gPDModelVersion,&gPDModelHFT,
#ifdef PI_PDMODEL_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_PDMODEL_VERSION  */
#if PI_PDFEDIT_WRITE_VERSION != 0
		{"PDFEditWrite",PI_PDFEDIT_WRITE_VERSION,&gPDFEditWriteVersion,&gPDFEditWriteHFT,
#ifdef PI_PDFEDIT_WRITE_OPTIONAL
		 true},
#else
	         false},
#endif
#endif /*PI_PDFEDIT_WRITE_OPTIONAL*/
#if PI_PDFEDIT_READ_VERSION != 0
		{"PDFEditRead",PI_PDFEDIT_READ_VERSION,&gPDFEditReadVersion,&gPDFEditReadHFT,
#ifdef PI_PDFEDIT_READ_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_PDFEDIT_READ_VERSION  */
#if PI_PDSYSFONT_VERSION != 0
		{"PDSysFont",PI_PDSYSFONT_VERSION,&gPDSysFontVersion,&gPDSysFontHFT,
#ifdef PI_PDSYSFONT_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_PDSYSFONT_VERSION  */

#if PI_PAGE_PDE_CONTENT_VERSION != 0
		{"PagePDEContent",PI_PAGE_PDE_CONTENT_VERSION,&gPagePDEContentVersion,&gPagePDEContentHFT,
#ifdef PI_PAGE_PDE_CONTENT_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_PAGE_PDE_CONTENT_VERSION  */

#if PI_ACROVIEW_VERSION != 0
		{"AcroView",PI_ACROVIEW_VERSION,&gAcroViewVersion,&gAcroViewHFT,
#ifdef PI_ACROVIEW_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_ACROVIEW_VERSION  */

#if PI_PDSEDIT_WRITE_VERSION != 0
		{"PDSWrite",PI_PDSEDIT_WRITE_VERSION,&gPDSWriteVersion,&gPDSWriteHFT,
#ifdef PI_PDSEDIT_WRITE_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_PDSEDIT_WRITE_VERSION  */

#if PI_PDSEDIT_READ_VERSION != 0
		{"PDSRead",PI_PDSEDIT_READ_VERSION,&gPDSReadVersion,&gPDSReadHFT,
#ifdef PI_PDSEDIT_READ_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_PDSEDIT_READ_VERSION  */
#if PI_MACINTOSH_VERSION != 0
		{"Macintosh",PI_MACINTOSH_VERSION,&gMacintoshVersion,&gMacintoshHFT,
#ifdef PI_MACINTOSH_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_MACINTOSH_VERSION  */

#if PI_UNIX_VERSION != 0
		{"Unix",PI_UNIX_VERSION,&gUnixVersion,&gUnixHFT,
#ifdef PI_UNIX_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_UNIX_VERSION  */

#if PI_WIN_VERSION != 0
		{"Win",PI_WIN_VERSION,&gWinVersion,&gWinHFT,
#ifdef PI_WIN_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_WIN_VERSION  */

#if PI_ASEXTRA_VERSION != 0
		{"ASExtra",PI_ASEXTRA_VERSION,&gASExtraVersion,&gASExtraHFT,
#ifdef PI_ASEXTRA_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_ASEXTRA_VERSION  */

#if PI_PDMETADATA_VERSION != 0
		{"PDMetadata",PI_PDMETADATA_VERSION,&gPDMetadataVersion,&gPDMetadataHFT,
#ifdef PI_PDMETADATA_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_PDMETADATA_VERSION  */

#if PI_ACROCOLOR_VERSION != 0
		{"AcroColorHFT",PI_ACROCOLOR_VERSION,&gAcroColorVersion,&gAcroColorHFT,
#ifdef PI_ACROCOLOR_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_ACROCOLOR_VERSION  */

#if PI_ACROCOLOR_PRIVATE_VERSION != 0
		{"AcroColorPrivateHFT",PI_ACROCOLOR_PRIVATE_VERSION,&gAcroColorPrivateVersion,&gAcroColorPrivateHFT,
#ifdef PI_ACROCOLOR_PRIVATE_OPTIONAL
		 true},
#else
		 false},
#endif
#endif /* PI_ACROCOLOR_VERSION  */
	};

	if (handshakeVersion == HANDSHAKE_V0200)
	{
		/* Cast sdkData to the appropriate type */
		PISDKData_V0200 *data = (PISDKData_V0200 *)sdkData;
		
		/* Belt and suspenders sanity check */
		if (data->handshakeVersion != HANDSHAKE_V0200)
			/* Someone lied */
			return FALSE;

		/* Get our globals out */
		gExtensionID = data->extensionID;
		gCoreHFT = data->coreHFT;
		gCoreVersion = 0x00020000; /* lowest version that supports v0200 handshake */

		/*
		** Note that we just got the Core HFT, so now we can, and are expected to, ASCallbackCreate()
		** every function we pass back to the viewer.
		** We can now also call functions in the Core HFT (level 2), such as ASExtensionMgrGetHFT().
		*/
		/* Get the HFTs we want */
		/* this file wants AcroSupport for the HFTGetVersion call so try to get it if possible */
		gAcroSupportHFT = ASExtensionMgrGetHFT(ASAtomFromString("AcroSupport"), ASCallsHFT_VERSION_6); 
		if (gAcroSupportHFT) {
			gAcroSupportVersion = ASCallsHFT_VERSION_6; //to clear ACROASSERT in next call
			gAcroSupportVersion = HFTGetVersion(gAcroSupportHFT);
			bSuccess = true;
#if	PI_ACROSUPPORT_VERSION != 0
			/* got version 6, now check to see if acrosupport is also compatible with rest of plugin */
			bSuccess = GetRequestedHFT("AcroSupport",PI_ACROSUPPORT_VERSION,&gAcroSupportVersion,&gAcroSupportHFT);
#endif
		}
		else {
#if	PI_ACROSUPPORT_VERSION == 0
			bSuccess = true;
#else
			bSuccess = GetRequestedHFT("AcroSupport",PI_ACROSUPPORT_VERSION,&gAcroSupportVersion,&gAcroSupportHFT);
#endif
		}
#ifndef PI_ACROSUPPORT_OPTIONAL
		if (!bSuccess)
			return FALSE;
#endif
		for (i=0;i<sizeof(hftInfo)/sizeof(hftInfo[0]);i++) {
			bSuccess = GetRequestedHFT(hftInfo[i].name,hftInfo[i].ver,hftInfo[i].retver,hftInfo[i].hft);
			if (!bSuccess && !hftInfo[i].optional)
				return false;
		}

		/* Set the plug-in's handshake routine, which is called next by the host application */
		data->handshakeCallback = (ASCallback)ASCallbackCreateProto(PIHandshakeProcType, PIHandshake);

		/* Return success */
		return TRUE;

	} /* Each time the handshake version changes, add a new "else if" branch here */

	/* 
	** If we reach here, then we were passed a handshake version number we don't know about.
	** This shouldn't ever happen since our main() routine chose the version number.
	*/
	return FALSE;
}

