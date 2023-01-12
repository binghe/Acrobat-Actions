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
 *		ClickToPrint
 *
 *	General Description:
 *		Uses F_ApiSilentPrintDoc() function to print the file that is
 *		passed as an argument in the hypertext message or the current 
 *      file if none is specified. Note that is is not possible to not 
 *		specify a file to print when using the Special>Hypertext dialog to
 *		create the hypertext area. However, it is possible to do so when using 
 *		the Special>Marker dialog with Hypertext as the Type. See the FrameMaker 
 *		User's Guide for more information on creating hypertext command areas.
 *
 *		Default printer settings will used by this client.
 *
 *	Invocation:
 *		Responds only to a "message client" hypertext command.
 *		Assuming installation proceeds as described below,
 *		the correct usage would be  "message ClickToPrint [name-of-file]".
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name ClickToPrint>
 *			<Description Respond to a hypertext message by printing the
 *				specified file, (or the current file if none specified. >
 *			<Directory fdk_install_dir/samples/clickprt>
 *			<CommandLine $FAPIDIR/clickprint>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/clickprint>
 *		to:
 *			<SharedLibrary clickprint.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		ClickToPrint=Standard,Print Online Manuals,
 *			fdk_install_dir\samples\clickprt\debug\clickprt.dll, all
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "f_stdio.h"
#include "fdetypes.h"
#include "fapi.h"
#include "fstrings.h"
#include "futils.h"

/* define a local type for error handling */
#ifndef macintosh 
typedef enum {
	errOpening = 1,
	errClosing
} CantPrintT; 
#else /* mac */
#define errOpening 1
#define errClosing 2
#endif

/* localization of prompts and error strings.  See GetIString() */
enum {
	curEnglish = 0,
	curFrench,
	curGerman,
	curItalian,
	curSwedish,
	curSpanish,
	curBrazilian,
	NumLanguages
} CurLanguage;

typedef     UCharT	FullFileNameT[1024];

UCharT Program[] = "ClickPrint";

F_ObjHandleT openDoc FARGS((StringT filename, F_ObjHandleT doc));
StringT GetIString FARGS((UIntT stringId));

/*
 * The only initialization task we have is to set the UI language for
 * localized string retrieval.  This is done at every invocation, against
 * the chance that Frame products may someday change UI languages on the fly.
 */
VoidT
F_ApiInitialize(initType)
	IntT initType;
{
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	F_FdeInit();
	switch (initType)
	{
	case FA_Init_First:
		/* We don't have anything to do, or any reason to hang around */
		F_ApiBailOut();
		break;
	case FA_Init_Subsequent:
		switch (F_ApiGetInt(0, FV_SessionId, FP_Language))
		{
		default:
		case FV_LANG_BRITISH:
		case FV_LANG_ENGLISH:
			CurLanguage = curEnglish;
			break;
		case FV_LANG_FRENCH:
			CurLanguage = curFrench;
			break;
		case FV_LANG_GERMAN:
			CurLanguage = curGerman;
			break;
		case FV_LANG_ITALIAN:
			CurLanguage = curItalian;
			break;
		case FV_LANG_SWEDISH:
			CurLanguage = curSwedish;
			break;
		case FV_LANG_SPANISH:
			CurLanguage = curSpanish;
			break;
		case FV_LANG_BRAZILIAN:
			CurLanguage = curBrazilian;
			break;
		}
		/* We will be getting a call to F_ApiMessage() very soon now */
		break;
	default:
		F_ApiBailOut();
	}
}

VoidT
F_ApiMessage(args, doc, ignoreObj)
	StringT args;
	F_ObjHandleT doc, ignoreObj;
{
	F_ObjHandleT targetFile;
	StrBuffT tmpstr;
	StringT errorMsg = NULL;

	if (F_StrIsEmpty(args))
		/* try to use current document */
		targetFile = doc;
	else if (!(targetFile = openDoc(args, doc)) && 
		 (errorMsg = GetIString(errOpening)))
	{
		F_Sprintf(tmpstr, errorMsg, Program, args);
		F_ApiAlert(tmpstr, FF_ALERT_CONTINUE_WARN);
	}

	if (targetFile)
	{
		StringT filename = F_ApiGetString(FV_SessionId, targetFile, FP_Name);

		if (!filename)
			filename = args;

		if (targetFile != doc)
			F_ApiSetId(0, FV_SessionId, FP_ActiveDoc, targetFile);

		F_ApiSilentPrintDoc(targetFile);

		if (targetFile != doc)
		{
			F_ApiSetId(0, FV_SessionId, FP_ActiveDoc, doc);
			if (F_ApiClose(targetFile, True) != FE_Success &&
			    (errorMsg = GetIString(errClosing)))
			{
				F_Sprintf(tmpstr, errorMsg, Program, filename);
				F_ApiAlert(tmpstr, FF_ALERT_CONTINUE_WARN);
			}
		}
	}
	F_ApiBailOut();
}

F_ObjHandleT
openDoc(filename, anchordoc)
	StringT filename;
	F_ObjHandleT anchordoc;
{
	F_PropValsT paramsp, *returnParamsp = NULL;
	IntT i;
	FullFileNameT fullpathname;
	FilePathT *filePath, *parentPath;
	IntT status;

	paramsp = F_ApiGetOpenDefaultParams();

	i = F_ApiGetPropIndex( &paramsp, FS_BookIsInUse );
	paramsp.val[i].propVal.u.ival = FV_DoShowDialog;

	i = F_ApiGetPropIndex( &paramsp, FS_FileIsInUse );
	paramsp.val[i].propVal.u.ival = FV_OpenViewOnly;

	i = F_ApiGetPropIndex( &paramsp, FS_OpenFileNotWritable );
	paramsp.val[i].propVal.u.ival = FV_DoOK;

	i = F_ApiGetPropIndex( &paramsp, FS_FileIsOldVersion );
	paramsp.val[i].propVal.u.ival = FV_DoOK;

	i = F_ApiGetPropIndex( &paramsp, FS_FontChangedMetric );
	paramsp.val[i].propVal.u.ival = FV_DoShowDialog;

	i = F_ApiGetPropIndex( &paramsp, FS_FontNotFoundInDoc );
	paramsp.val[i].propVal.u.ival = FV_DoShowDialog;

	i = F_ApiGetPropIndex( &paramsp, FS_FontNotFoundInCatalog );
	paramsp.val[i].propVal.u.ival = FV_DoOK;

	i = F_ApiGetPropIndex( &paramsp, FS_LanguageNotAvailable );
	paramsp.val[i].propVal.u.ival = FV_DoOK;

	/* now do some filename arithmetic */
	if (filename[0] == '/'  || 			/* Found Unix Root as start      */
		filename[0] == '\\' || 			/* Found DOS Root as start       */
		filename[1] == ':'  || 			/* Found DOS drive name as start */
		filename[0] == '~'  || 			/* Found Unix HomeDir as start   */
		filename[0] == '$')			/* Found Unix Env Var as start   */
		F_StrCpy(fullpathname, filename);
	else
	{
		StringT anchorname;

		if (!(anchorname = F_ApiGetString(FV_SessionId, anchordoc, FP_Name)))
			return 0;

		filePath = F_PathNameToFilePath(anchorname, NULL, FDefaultPath);
		parentPath = F_FilePathParent(filePath, &status);
		F_FilePathFree(filePath);

		F_StrCpyN(fullpathname, F_FilePathToPathName(parentPath, FDefaultPath), sizeof(FullFileNameT));
		F_FilePathFree(parentPath);

        /* fullPathName doesn't have ending directory delimiter, so we need to
           add that before concatenating the document file name to it. */
#ifdef UNIX
		F_StrCatCharN(fullpathname, '/', sizeof(FullFileNameT));
#else
#ifdef WIN_FRAME
		F_StrCatCharN(fullpathname, '\\', sizeof(FullFileNameT));
#endif
#endif
		F_StrCatN(fullpathname, filename, sizeof(FullFileNameT));
	}
	return (F_ApiOpen(fullpathname, &paramsp, &returnParamsp));
}

/*
 * We implement a very simple-minded internationalization scheme
 * here-- there are only a few strings to worry about, after all.
 * Note that the error reporting when we can't find the requested
 * string *should* be hard-coded and untranslatable.
 *
 * Note that the strings should be in Frame character encoding, to wit:
 *
 * \216 = \x8e = e acute
 * \325 = \xd5 = apostrophe
 * \232 = \x9a = odieresis
 * \212 = \x8a = adieresis
 *
 * Important: the order of the strings must match the CurLanguage enum.
 */
static const struct {
	UIntT id;
	NativeCharT *strvals[NumLanguages];
} IStrings[] = {
	errOpening, {
		(StringT)"%s client: Unable to open %s.",
		(StringT)"Client %s : Impossible d\325ouvrir %s. ",
		(StringT)"%s Client: %s konnte nicht ge\232ffnet werden. ",
		(StringT)"Cliente %s: Impossibile aprire il file %s. ",
		(StringT)"%s-klient: Kan inte \232ppna %s. ",
		(StringT)"Client %s: Imposible abrir documento %s. ",
		(StringT)"Client %s: Imposs\222vel abrir doc %s. ",
	},
	errClosing, {
		(StringT)"%s client: Unable to close %s.",
		(StringT)"Client %s : Impossible de fermer %s. ",
		(StringT)"%s Client: %s konnte nicht geschlossen werden. ",
		(StringT)"Cliente %s: Impossibile chiudere il file %s. ",
		(StringT)"%s-klient: Kan inte st\212nga %s. ",
		(StringT)"Client %s: Imposible cerra documento %s. ",
		(StringT)"Client %s: Imposs\222vel fechar doc %s. ",
	}
};

/*
 * If the number of strings grew to really impressive amounts, this
 * linear search would have to go-- but anything that complicated really
 * should do something more sophisticated than hard-code strings in
 * compiled code, anyway.
 */
StringT
GetIString(stringId)
     UIntT stringId;
{
	IntT i;
	StrBuffT tmpstr;

	for (i = 0; i < sizeof IStrings / sizeof IStrings[0]; i++)
	{
		if (IStrings[i].id == stringId)
			return (StringT) IStrings[i].strvals[CurLanguage];
	}

	F_Sprintf(tmpstr, 
		  (StringT) "%s client: Unable to resolve string id %u. Exiting. ",
		  Program, stringId);
	F_ApiAlert(tmpstr, FF_ALERT_CONTINUE_WARN);

	return NULL;
}
