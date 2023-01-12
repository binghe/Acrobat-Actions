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
#include "fapi.h"
#include "futils.h"
#include "mml.h"
#include "mmlproto.h"

/* --------------------------------------------------------------------------+
 | If assertion is False, print error message that corresponds to errorCode  |
 | and exit. Error messages are define in sas file.                          |
 +-------------------------------------------------------------------------- */

VoidT mmlAssertFatal(assertion, errorCode)
BoolT assertion;
IntT  errorCode;
{
	if (!assertion) {
		F_Printf(0, mmlErrorMessage[errorCode]) ;
		close_all_input_files();
		F_ApiReturnValue(0);
		F_ApiBailOut();
		F_Exit(1);
	}
}
