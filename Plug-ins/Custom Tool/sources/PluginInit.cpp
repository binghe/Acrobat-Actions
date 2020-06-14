/*********************************************************************

 ADOBE SYSTEMS INCORPORATED
 Copyright (C) 1999-2015 Adobe Systems Incorporated
 All rights reserved.

 NOTICE: Adobe permits you to use, modify, and distribute this file
 in accordance with the terms of the Adobe license agreement
 accompanying it. If you have received this file from a source other
 than Adobe, then your use, modification, or distribution of it
 requires the prior written permission of Adobe.

*********************************************************************/

// Acrobat Headers.
#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif
#include "Resource.h"

#include <vector>
#include <string>
#include <algorithm>

/*-------------------------------------------------------
	Declarations/definitions
-------------------------------------------------------*/

#if WIN_PLATFORM
extern "C" HINSTANCE gHINSTANCE;
#endif

std::vector<AVDoc> GetAllDocs()
{
	std::vector<AVDoc> avDocs;
	AVAppEnumDocs([](AVDoc avDoc, void* clientData)->ASBool {
		auto& avDocs = *reinterpret_cast<std::vector<AVDoc>*>(clientData);
		avDocs.push_back(avDoc);
		return true;
	}, &avDocs);

	return avDocs;
}

/*-------------------------------------------------------
	UI Callbacks
-------------------------------------------------------*/

/* SwitchNextDoc
** ------------------------------------------------------
**
** Called when the user selects our command UI element(s).
*/
static ACCB1 void ACCB2 SwitchNextDoc (void *data)
{
	std::vector<AVDoc> avDocs = GetAllDocs();
	if (avDocs.empty())
		return;

	AVDoc activeDoc = AVAppGetActiveDoc();
	size_t pos = (1 + (std::find(avDocs.begin(), avDocs.end(), activeDoc) - avDocs.begin())) % avDocs.size();
	AVDocBringToFront(avDocs[pos]);
}

/* SwitchNextDocIsEnabled
** ------------------------------------------------------
**
** Determine whether our UI element(s) should be enabled.
*/
static ACCB1 ASBool ACCB2 SwitchNextDocIsEnabled (void *data)
{
	return AVAppGetNumDocs() > 1;
}

/* ListDocs
** ------------------------------------------------------
**
** Called when the user selects our command UI element(s).
*/
static ACCB1 void ACCB2 ListDocs (void *data)
{
	std::vector<AVDoc> avDocs = GetAllDocs();
	if (avDocs.empty())
		return;
	ASText wndTitle = ASTextNew();
	std::string docTitles;
	long docNum = 0;
	for (AVDoc doc : avDocs)
	{
		if (AVDocGetDisplayTitle(doc, wndTitle))
		{
			docTitles += std::to_string(++docNum) + ") " + std::string(ASTextGetEncoded(wndTitle, kUTF8));
			docTitles += '\n';
		}
	}
	ASTextDestroy(wndTitle);
	AVAlertNote(docTitles.c_str());
}

/* ListDocsIsEnabled
** ------------------------------------------------------
**
** Determine whether our UI element(s) should be enabled.
*/
static ACCB1 ASBool ACCB2 ListDocsIsEnabled (void *data)
{
	return AVAppGetNumDocs() > 0;
}


/*-------------------------------------------------------
	Handshake Callbacks
-------------------------------------------------------*/

/* PluginExportHFTs
** ------------------------------------------------------
**
** Create and register the HFT's.
**
** Return true to continue loading plug-in.
** Return false to cause plug-in loading to stop.
*/
ACCB1 ASBool ACCB2 PluginExportHFTs ()
{
	return true;
}

/* PluginImportReplaceAndRegister
** ------------------------------------------------------
**
** This routine is where you can:
**	1) Import plug-in supplied HFTs.
**	2) Replace functions in the HFTs you're using (where allowed).
**	3) Register to receive notification events.
**
** Return true to continue loading plug-in.
** Return false to cause plug-in loading to stop.
*/
ACCB1 ASBool ACCB2 PluginImportReplaceAndRegister ()
{
	return true;
}

AVIcon gIcons[3] = {0, 0, 0};

void CreateIcons()
{
	ASPathName pathName = NULL;
#if WIN_PLATFORM
	ASFileSys theFileSys = ASGetRamFileSys();
	HRSRC hres = FindResource(gHINSTANCE, MAKEINTRESOURCE(IDR_PDFICONS1), "PDFICONS");
	if (hres)
	{
		DWORD dwSize = SizeofResource(gHINSTANCE, hres);
		HGLOBAL hmem = LoadResource(gHINSTANCE, hres);
		if (hmem)
		{
			char* p = static_cast<char*>(LockResource(hmem));
			if (p)
			{
				pathName = ASFileSysGetTempPathName(theFileSys, NULL);
				if (pathName)
				{
					ASFile tempFile;
					ASFileSysOpenFile(theFileSys, pathName, ASFILE_WRITE | ASFILE_CREATE, &tempFile);
					if (tempFile)
					{
						ASFileWrite(tempFile, p, dwSize);
						ASFileClose(tempFile);
					}
					else
					{
						ASFileSysReleasePath(theFileSys, pathName);
						pathName = NULL;
					}
				}
			}
		}
	}
#elif MAC_PLATFORM
    // It is expected, for demostration pupose, that the icon file is present in Document folder.
    ASFileSys theFileSys = ASGetDefaultFileSys();
    ASFileSys asfs = NULL;
    ASErrorCode error = AVAcquireSpecialFilePathName(kAVSCUser, kAVSFDocuments, "multitab_icons.pdf", &asfs, &pathName);
    if (kAVSEOkay != error)
    {
        ASFileSysReleasePath(asfs, pathName);
        pathName = NULL;
    }
#endif
    
	if (pathName)
	{
		ASFile iconFile = NULL;
		ASFileSysOpenFile(theFileSys, pathName, ASFILE_READ, &iconFile);
		PDDoc iconDoc = PDDocOpenFromASFile(iconFile, NULL, FALSE);
		ASFileSysReleasePath(theFileSys, pathName);
		for (size_t i = 0; i < 3; ++i)
			gIcons[i] = AVIconCreateFromPDF(iconDoc, i, 24, 24);
		PDDocClose(iconDoc);
	}
}

/* PluginInit
** ------------------------------------------------------
**
** The main initialization routine.
**
** Return true to continue loading plug-in.
** Return false to cause plug-in loading to stop.
*/
ACCB1 ASBool ACCB2 PluginInit ()
{
	CreateIcons();
	AVToolButton docSwitchBtn = AVToolButtonNew (ASAtomFromString("XYZW:SwitchNextDoc"), gIcons[2], true, false);
	AVToolButtonSetExecuteProc (docSwitchBtn,
		ASCallbackCreateProto(AVExecuteProc, &SwitchNextDoc), NULL);
	AVToolButtonSetComputeEnabledProc (docSwitchBtn,
		ASCallbackCreateProto(AVComputeEnabledProc, &SwitchNextDocIsEnabled), NULL);
	AVToolButtonSetHelpText (docSwitchBtn, "Switch to next Doc");

	AVToolButton docListBtn = AVToolButtonNew(ASAtomFromString("XYZW:ListDocs"), gIcons[2], true, false);
	AVToolButtonSetExecuteProc(docListBtn,
		ASCallbackCreateProto(AVExecuteProc, &ListDocs), NULL);
	AVToolButtonSetComputeEnabledProc(docListBtn,
		ASCallbackCreateProto(AVComputeEnabledProc, &ListDocsIsEnabled), NULL);
	AVToolButtonSetHelpText(docListBtn, "List all document titles");

	AVToolBar toolBar = AVToolBarNew("Multitab", "Multitab Utilities");
	AVToolBarSetIcon(toolBar, gIcons[0], gIcons[1]);
	AVToolBarAddButton(toolBar, docSwitchBtn, false, NULL);
	AVToolBarAddButton(toolBar, docListBtn, false, NULL);

	return true;
}

/* PluginUnload
** ------------------------------------------------------
**
** Called when your plug-in is being unloaded when the
** application quits. Use this routine to release any
** system resources you may have allocated.
**
** Returning false will cause an alert to show warning
** that unloading failed.
*/
ACCB1 ASBool ACCB2 PluginUnload ()
{
	return true;
}

/* GetExtensionName
** ------------------------------------------------------
**
** Return the unique ASAtom associated with your plug-in.
*/
ASAtom GetExtensionName ()
{
	return ASAtomFromString ("AcroSDK:MultiTab");
}

/*
** PIHandshake
** Required Plug-in handshaking routine: Do not change it's name!
** PIMain.c "knows" the name PIHandshake and the type is dictated by Acrobat.
*/
ACCB1 ASBool ACCB2 PIHandshake(Uns32 handshakeVersion, void *handshakeData)
{
	if (handshakeVersion == HANDSHAKE_V0200) {
		/* Cast handshakeData to the appropriate type */
		PIHandshakeData_V0200 *hsData = (PIHandshakeData_V0200 *)handshakeData;

		/* Set the name we want to go by */
		hsData->extensionName = GetExtensionName();

		/* If you export your own HFT, do so in here */
		hsData->exportHFTsCallback = (void*) ASCallbackCreateProto(PIExportHFTsProcType, &PluginExportHFTs);

		/*
		** If you import plug-in HFTs, replace functionality, and/or want to register for notifications before
		** the user has a chance to do anything, do so in here.
		*/
		hsData->importReplaceAndRegisterCallback = (void*) ASCallbackCreateProto(PIImportReplaceAndRegisterProcType,
																		 &PluginImportReplaceAndRegister);

		/* Perform your plug-in's initialization in here */
		hsData->initCallback = (void*) ASCallbackCreateProto(PIInitProcType, &PluginInit);

		/* Perform any memory freeing or state saving on "quit" in here */
		hsData->unloadCallback = (void*) ASCallbackCreateProto(PIUnloadProcType, &PluginUnload);

		/* All done */
		return true;

	} /* Each time the handshake version changes, add a new "else if" branch */

	/*
	** If we reach here, then we were passed a handshake version number we don't know about.
	** This shouldn't ever happen since our main() routine chose the version number.
	*/
	return false;
}
