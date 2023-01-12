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
#include "fstrings.h"
#include "futils.h"
#include "mml.h"
#include "mmlproto.h"

/* --------------------------------------------------------------------------+
 | mmlFilenameToPath sets path to that prefix of filename that is a directory|
 | path.                                                                     | 
 | For example: filename = "/abc/def.c" -> path = "/abc"                     |
 +-------------------------------------------------------------------------- */

BoolT mmlFilenameToPath(filename,path)
StringT filename;
StringT *path;
{
  PathEnumT plat ;
	FilePathT *fp ;
	FilePathT *dir ;
	IntT i ;

  plat = F_PathNameType( filename ) ;

	fp = F_PathNameToFilePath( filename, NULL, plat ) ;
	if (fp == NULL)
		return False ;

  dir = F_FilePathParent( fp, &i) ;

	if ( (dir == NULL) & (i != 0)) 
	{
		F_FilePathFree( fp ) ;
		return False ;
  }

  *path = F_FilePathToPathName( dir, plat ) ;

	F_FilePathFree( fp ) ;
	F_FilePathFree( dir ) ;
	return True ;

}

/* --------------------------------------------------------------------------+
 | mmlPathOfFminit sets path to the path of the fminit directory.            |
 | mmlPathOfFminit returns False if FMHOME is not defined in the environment.|
 +-------------------------------------------------------------------------- */

BoolT mmlPathOfFminit(path)
StringT *path;
{
	FA_errno = 0 ;
	*path =  F_ApiGetString( 0, FV_SessionId, FP_FM_InitDir ) ;
	if (  FA_errno == 0 )
		return True ;
  else
		return False ;
}

#if 0
/* --------------------------------------------------------------------------+
 | mmlPathAndFilenameOfFilter sets pathAndFilename to the path and filename  |
 | of the mml import filter. Specifically, pathAndFilename is obtained by    |
 | appending the suffix "xbin/mmltomif/" or "/xbin/mmltomif/" to the path    |
 | contained in the environment variable FMHOME.                             |
 |                                                                           |
 | For example: FMHOME = "/abc" -> pathAndFilename = "/abc/xbin/mmltomif/"   |
 |                                                                           |
 | mmlPathAndFilenameOfFminit returns False if FMHOME is not defined in the  |
 | environment.                                                              |
 +-------------------------------------------------------------------------- */

BoolT mmlPathAndFilenameOfFilter(pathAndFilename)
StringT *pathAndFilename;
{
	StringT pathOfFmhome;
	IntT    lengthOfPathOfFmhome;
	IntT    lengthOfPathAndFilename;

	pathOfFmhome = (StringT)getenv("FMHOME");

	if (pathOfFmhome) {

		lengthOfPathOfFmhome = F_StrLen(pathOfFmhome);

		if (lengthOfPathOfFmhome == 0 ||
			pathOfFmhome[lengthOfPathOfFmhome-1] != '/') {

			lengthOfPathAndFilename = lengthOfPathOfFmhome + 16;
			*pathAndFilename = myalloc(lengthOfPathAndFilename);
			F_StrCpy(*pathAndFilename,pathOfFmhome);
			F_StrCatN(*pathAndFilename,"/xbin/mmltomif/",
					  lengthOfPathAndFilename);

		} else {

			lengthOfPathAndFilename = lengthOfPathOfFmhome + 15;
			*pathAndFilename = myalloc(lengthOfPathAndFilename);
			F_StrCpy(*pathAndFilename,pathOfFmhome);
			F_StrCatN(*pathAndFilename,"xbin/mmltomif/",
					  lengthOfPathAndFilename);

		}

		return True;

	} else {
		return False;
	}
}

#endif

/* --------------------------------------------------------------------------+
 | mmlPathOfTilda sets path to the path of ~. 
 +-------------------------------------------------------------------------- */

BoolT mmlPathOfTilda(path)
StringT *path;
{
  FA_errno = 0 ;
  *path = F_ApiGetString( 0, FV_SessionId, FP_UserHomeDir ) ;
	if (  FA_errno == 0 )
		return  True ;
  else
		return  False ;
}

#if 0 
/* --------------------------------------------------------------------------+
 | mmlTempMIFFilePath sets path to the path of a uniquely named temporary    |
 | MIF file, (to be created in the future), in FrameMaker's tmp directory.   |
 |                                                                           |
 | Specifically, path is obtained by appending the suffix "tmpXXXXX.MIF" or  |
 | "/tmpXXXXX.MIF/" to the path contained in the session property FP_TmpDir, |
 | where XXXXX is the pid of this api client.                                |
 |                                                                           |
 | mmlTempMIFFilePath returns False if FP_TmpDir cannot be obtained.         |
 +-------------------------------------------------------------------------- */

BoolT mmlTempMIFFilePath(path)
StringT *path;
{
	StringT pathOfTmp;
	IntT    lengthOfPathOfTmp;
	IntT    lengthOfPath;
	UCharT  filename[13];

	pathOfTmp = F_ApiGetString(0,FV_SessionId,FP_TmpDir);

	F_Sprintf(filename,"tmp%05d.MIF",getpid());

	if (pathOfTmp) {

		lengthOfPathOfTmp = F_StrLen(pathOfTmp);

		if (lengthOfPathOfTmp == 0 ||
			pathOfTmp[lengthOfPathOfTmp-1] != '/') {

			lengthOfPath = lengthOfPathOfTmp + 14;
			*path = myalloc(lengthOfPath);
			F_StrCpy(*path,pathOfTmp);
			F_StrCatN(*path,filename,lengthOfPath);

		} else {

			lengthOfPath = lengthOfPathOfTmp + 13;
			*path = myalloc(lengthOfPath);
			F_StrCpy(*path,pathOfTmp);
			F_StrCatN(*path,filename,lengthOfPath);

		}

		return True;

	} else {
		return False;
	}
}

#endif
