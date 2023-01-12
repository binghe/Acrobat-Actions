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

extern F_ObjHandleT docId;
extern F_ObjHandleT firstParagraphId;
extern F_TextLocT   insertionPoint;
extern F_PropValsT  parFormatProperties;
extern F_PropValsT  paragraphProperties;
extern F_PropValsT  characterProperties;
extern F_PropValsT  headerFooterCharProperties;
extern StringT		mmlErrorMessage[];

#ifdef _fullprototypes_

ChannelT mmlChanOpen (StringT filename, StringT flag) ;
VoidT fillin_doc_undefineds(VoidT);
VoidT mmlCreateDocument(VoidT);
VoidT mmlAddAllParFormats(VoidT);
BoolT mmlGetParFormat(F_ObjHandleT docId,StringT paragraphTag,
					  ParRecordT *parRecord,StringT *tabString);
VoidT mmlDeleteStableFontNameProperties(F_PropValsT *propertyList);
VoidT mmlAppendParagraph(VoidT);
VoidT mmlAppendText(StringT text);
VoidT mmlAppendAnchoredFrame(VoidT);
BoolT mmlPathOfFminit(StringT *path);
BoolT mmlPathOfTilda(StringT *path);
VoidT mmlAppendMarker(IntT markerType,StringT markerText);
StringT NativeString(StringT s);
VoidT StrCpy(StringT s1,StringT s2);
VoidT StrCatCharN(StringT s, PUCharT c, IntT n);
VoidT StrTrunc(StringT s);
BoolT StrEqual(StringT s1, StringT s2);
IntT StrLen(StringT s);
VoidT FixTildaName(BigFileNameT s);
VoidT mmlFilenameToPath(StringT filename,StringT *path);
VoidT SafeFree(PtrT *memP);

#ifdef MMLMIF
#ifndef MACINTOSH	/** The following should go into f_local.h **/
#ifndef WIN_FRAME
#if !defined(motoSVR4) && !defined(MOTOS5M88K_CC) && !defined(HPHPUXPA_CC) && !defined(SUNXMS5SPARC_CC)
int   sscanf(char *, char *, ... );
int   fprintf(FILE *, char *, ... );
int   fputc(char, FILE *);
#endif
char *sprintf(char *, char *, ... );
void  fputs(char *, FILE *);
int   fgetc(FILE *);
void  fclose(FILE *);
int   unlink(char *);
#endif /* WIN_FRAME */
int   getuid();
int   getpid();
#endif
#endif /* MMLMIF */

#else

ChannelT mmlChanOpen () ;
VoidT fillin_doc_undefineds();
VoidT mmlCreateDocument();
VoidT mmlAddAllParFormats();
BoolT mmlGetParFormat();
VoidT mmlDeleteStableFontNameProperties();
VoidT mmlAppendParagraph();
VoidT mmlAppendText();
VoidT mmlAppendAnchoredFrame();
BoolT mmlPathOfFminit();
BoolT mmlPathOfTilda();
VoidT mmlAppendMarker();
StringT NativeString();
VoidT StrCpy();
VoidT StrCatCharN();
VoidT StrTrunc();
BoolT StrEqual();
IntT StrLen();
VoidT FixTildaName();
VoidT mmlFilenameToPath();
VoidT SafeFree();

#ifdef MMLMIF
#ifndef MACINTOSH	/** The following should go into f_local.h **/
#if !defined(IBMAIXPWR_CC)
int   sscanf();
int   fprintf();
#endif
char *sprintf();
void  fputs();
int   fputc();
int   fgetc();
void  fclose();
int   unlink();
int   getuid();
int   getpid();
#endif
#endif /* MMLMIF */

#endif

#define FCalloc F_Calloc
#define FFree(p) SafeFree((PtrT *)&(p))

#define MMLMSG                        0
#define MMLxNeedsEndingSpace          1
#define MMLBadOption                  2
#define MMLBadBoolean                 3
#define MMLBadDigit                   4
#define MMLBadHexDigit                5
#define MMLBadlrcd                    6
#define MMLBadRealNumber              7
#define MMLBadStyle                   8
#define MMLBadUnit                    9
#define MMLCantFindFile               10
#define MMLCantOpenFile               11
#define MMLCantOpenTmpFile            12
#define MMLCantWriteFile              13
#define MMLDidntFindEndComment        14
#define MMLExpectedString             15
#define MMLFatal                      16
#define MMLHashTableOverflow          17
#define MMLInputStackOverflow         18
#define MMLInternalError              19
#define MMLJunkAtEnd                  20
#define MMLKeywordTooLong             21
#define MMLNotFinishedDefining        22
#define MMLNullName                   23
#define MMLOutOfMemory                24
#define MMLStringTooLong              25
#define MMLTabBufferOverflow          26
#define MMLTabStops                   27
#define MMLTooManyIOptions            28
#define MMLUndefinedMacro             29
#define MMLUnexpectedRB               30
#define MMLUsage                      31
#define MML_BAD_NOTIFICATION          32
#define MML_CANT_CREATE_TEMP_MIF_FILE 33
#define MML_EOF_IN_MIF                34
#define MML_CANT_OPEN_TEMP_MIF_FILE   35
#define MML_NO_INSERTION_POINT        36
#define MML_STRING_NOT_IN_LIST        37
#define MML_CANT_ADD_PAR_FORMAT       38
#define MML_CANT_ADD_MASTER_PAGE      39
