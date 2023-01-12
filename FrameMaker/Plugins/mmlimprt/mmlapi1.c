/*************************************************************************
*
* ADOBE SYSTEMS INCORPORATED
* Copyright 1986 - 2005 Adobe Systems Incorporated
* All Rights Reserved.
*
* NOTICE: Adobe permits you to use, modify, and distribute this file in
* accordance with the terms of the Adobe license agreement accompanying it.
* If you have received this file from a source other than Adobe, then your 
* use, modification, or distribution of it requires the prior written 
* permission of Adobe.
**************************************************************************/

#include "f_types.h"
#include "fapi.h"
#include "mml.h"
#include "mmlproto.h"

/* --------------------------------------------------------------------------+
 | When FrameMaker needs to open an mml file, it calls F_ApiInitialize with  |
 | initialization == FA_InitFirst or initialization == FA_InitSubsequent.    |
 | FrameMaker calls F_ApiNotify immediately after F_ApiInitialize returns.   |
 | If the user specifies this API client in the -apiclient command line      |
 | option, FrameMaker will call F_ApiInitialize with initialization ==       |
 | FA_Init_TakeControl. Since this API client cannot take control, it        |
 | simply returns control to FrameMaker.                                     |
 +-------------------------------------------------------------------------- */

VoidT F_ApiInitialize(initialization)
IntT initialization;
{
	switch (initialization) {
	case FA_Init_First:
		/* FrameMaker will call F_ApiNotify after F_ApiInitialize returns */
		break;
	case FA_Init_Subsequent:
		/* FrameMaker will call F_ApiNotify after F_ApiInitialize returns */
		break;
	case FA_Init_TakeControl:
		/* return immediately - the mml input filter cannot take control  */
		break;
	}
}

/* --------------------------------------------------------------------------+
 | When FrameMaker needs to open an mml file, it calls F_ApiNotify.          |
 |                                                                           |
 | This API client has requested to be notified only when the user opens an  |
 | mml file. Therefore, it is an error if notification != FA_Note_FilterIn.  |
 |                                                                           |
 | If the mml file is being imported into another document, docId contains   |
 | the id of the document into which the mml file is being imported.         |
 | If the mml file is being opened, (rather than imported), docId == 0.      |
 | filename contains the fully qualified path and filename of the mml file.  |
 |                                                                           |
 | After opening the mml file, this API client calls F_ApiBailOut to free    |
 | memory. This API client will be reloaded if another mml file is opened.   |
 +-------------------------------------------------------------------------- */

VoidT F_ApiNotify(notification,activedocId,filename,iparm)
IntT			notification;
F_ObjHandleT	activedocId;
StringT			filename;
IntT		iparm;
{
#ifdef MACINTOSH
#pragma unused(iparm)
#endif
/* **************************** BEGIN DEBUG **************************** */
#if 0
#undef getpid
printf("\npid = %d",getpid());
sleep(10);
printf("\nresuming execution\n");
#endif
/* ***************************** END DEBUG ***************************** */

	mmlAssertFatal(notification == FA_Note_FilterIn, MML_BAD_NOTIFICATION);
	mmlInitialize(filename);
	mmlOpenOrImport(filename);

	F_ApiReturnValue(docId);
	F_ApiBailOut();
}
