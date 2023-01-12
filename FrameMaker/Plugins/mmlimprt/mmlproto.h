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

/* Why? */
#ifdef MMLMIF
#define fgets Sfgets
#define sprintf Ssprintf
#define fclose Sfclose
#define fputs Sfputs

#include "fstdio.h"

#undef fgets
#undef sprintf
#undef fclose
#undef fputs
#endif

#ifndef EOF
#define EOF -1
#endif

typedef struct {
	IntT Name;
	IntT Alignment;
	IntT FirstIndent;
	IntT LeftIndent;
	IntT RightIndent;
	IntT SpaceAbove;
	IntT SpaceBelow;
	IntT Leading;
	IntT AutoNum;
	IntT AutoNumString;
	IntT Hyphenate;
	IntT Start;
	IntT KeepWithNext;
	IntT AdjHyphens;
	IntT BlockLines;
	IntT FontFamily;
	IntT FontSize;
	IntT FontAngle;
	IntT FontWeight;
	IntT Underline;
	IntT StrikeOut;
	IntT Position;
} mmlPgfIndexCacheT;

typedef struct {
	IntT FontFamily;
	IntT FontSize;
	IntT FontAngle;
	IntT FontWeight;
	IntT Underline;
	IntT StrikeOut;
	IntT Position;
} mmlFontIndexCacheT;

#ifdef _fullprototypes_

VoidT F_ApiInitialize(IntT initialization);
VoidT F_ApiNotify(IntT notification,F_ObjHandleT docId,StringT filename,IntT iparm);
VoidT mmlOpenOrImport(StringT filename);
VoidT mmlOpen(StringT filename);
VoidT mmlImport(F_ObjHandleT docId);
VoidT mmlAppendParagraph(VoidT);
F_ObjHandleT mmlCreateParagraph(F_ObjHandleT docId,
								F_ObjHandleT prevParagraphId,
								F_PropValsT	*paragraphProperties,
								F_TabsT *paragraphTabs);
VoidT mmlParRecordToPropVals(mmlPgfIndexCacheT 	*pgfIndexCache,
							 BoolT				*pgfIndexCacheInitialized,
							 ParRecordT			*parRecord,
							 F_PropValsT		*propVals);
VoidT mmlPropValsToParRecord(mmlPgfIndexCacheT 	*pgfIndexCache,
							 BoolT				*pgfIndexCacheInitialized,
							 F_PropValsT		*propVals,
							 ParRecordT			*parRecord);
VoidT mmlAppendText(StringT text);
VoidT mmlInsertText(F_ObjHandleT docId,
					F_TextLocT insertionPoint,
					StringT text,
					F_PropValsT *characterProperties);
F_TextRangeT mmlLocAndLenToRange(F_TextLocT loc,IntT len);
VoidT mmlFontRecordToPropVals(mmlFontIndexCacheT *fontIndexCache,
							  BoolT *fontIndexCacheInitialized,
							  FontRecordT *fontRecord,
							  F_PropValsT *propVals);
VoidT mmlAppendMarker(IntT markerType,StringT markerText);
VoidT mmlInsertMarker(F_ObjHandleT docId,
					  F_TextLocT insertionPoint,
					  IntT markerType,
					  StringT markerText);
IntT mmlMapFontAngle(BoolT italic);
IntT mmlMapFontWeight(BoolT bold);
IntT mmlMapFontFamily(IntT family);
IntT mmlIndexInStrings(F_StringsT strings,StringT string);
VoidT mmlCreateDocument(VoidT);
VoidT fillin_doc_undefineds(VoidT);
VoidT mmlInitialize(StringT filename);
VoidT mmlRun(StringT inputFileName);
MetricT mmlMeasureToMetric(MeasureT	measure);
BoolT mmlStrEqualIgnoreType(StringT str1,StringT str2);
VoidT mmlDeleteAllParFormats(F_ObjHandleT docId);
VoidT mmlAddAllParFormats(VoidT);
VoidT mmlAddParFormat(F_ObjHandleT docId,ParRecordT	*parRecord);
BoolT mmlGetParFormat(F_ObjHandleT docId,StringT paragraphTag,
					  ParRecordT *parRecord,StringT *tabString);
VoidT mmlParFormatToPropVals(ParRecordT *parRecord,F_PropValsT *propVals);
F_TabsT *mmlTabStringToFTabs(StringT tabString);
VoidT mmlFreeFTabs(F_TabsT *fTabs);
VoidT mmlCreateHeaderAndFooter(VoidT);
VoidT mmlCreateHeaderOrFooter(F_ObjHandleT docId,F_ObjHandleT pageId,
							  MetricT x,MetricT y,MetricT width,MetricT height,
							  StringT leftString,
							  StringT centerString,
							  StringT rightString,
							  F_PropValsT *characterProperties);
F_ObjHandleT mmlCreateTextColumn(F_ObjHandleT docId,F_ObjHandleT pageId,
								 MetricT x,MetricT y,
								 MetricT width,MetricT height);
VoidT mmlAppendAnchoredFrame(VoidT);
FilePathT *GenerateUniqueFilePath(FilePathT *pathp);
BoolT mmlWriteAnchoredFrameMIFToFile(ChannelT channel);
F_ObjHandleT mmlOpenMIFFile(FilePathT *pathp);
VoidT mmlApplyFormatsToDocument(F_ObjHandleT formatsDocId,F_ObjHandleT contentsDocId);
VoidT mmlCopyEverythingToClipboard(F_ObjHandleT docId);
VoidT mmlAppendClipboard(VoidT);
VoidT mmlInsertClipboard(F_ObjHandleT docId,F_TextLocT insertionPoint);
ChannelT  mmlChanOpen(StringT filename, StringT flag);
MeasureT mmlMetricToMeasure(MetricT	metric);
BoolT mmlUnMapFontAngle(IntT index);
BoolT mmlUnMapFontWeight(IntT index);
IntT mmlUnMapFontFamily(IntT family);
StringT mmlFTabsToTabString(F_TabsT *tabStruct);
VoidT mmlMapAutoNumberString(IntT mmlHashIndex,StringT *mifString);
VoidT mmlUnMapAutoNumberString(IntT *mmlHashIndex,StringT mifString);
BoolT mmlFilenameToPath(StringT filename,StringT *path);
BoolT mmlPathOfFminit(StringT *path);
BoolT mmlPathOfTilda(StringT *path);
BoolT mmlTempMIFFilePath(StringT *path);
F_ObjHandleT mmlInsertPageNumber(F_ObjHandleT docId,F_TextLocT insertionPoint);
VoidT mmlInitializePgfIndexCache(mmlPgfIndexCacheT	*pgfIndexCache,
								 F_PropValsT		*propVals);
VoidT mmlInitializeFontIndexCache(mmlFontIndexCacheT *fontIndexCache,
								  F_PropValsT *propVals);
VoidT mmlDeleteHeadersAndFooters(F_ObjHandleT docId);
F_ObjHandleT mmlCreateFirstPageMasterPage(F_ObjHandleT docId);
VoidT mmlAssertFatal(BoolT assertion,IntT errorCode);
StringT NativeString(StringT s);
VoidT StrCpy(StringT s1,StringT s2);
VoidT StrCatCharN(StringT s, PUCharT c, IntT n);
VoidT StrTrunc(StringT s);
BoolT StrEqual(StringT s1, StringT s2);
IntT StrLen(StringT s);
VoidT FixTildaName(BigFileNameT s);
VoidT mmlDeleteStableFontNameProperties(F_PropValsT *propertyList);
VoidT mmlDeleteProperty(F_PropValsT *propertyList,IntT property);

UCharT *myalloc(IntT size);
IntT new_hash_entry(StringT s, IntT slen, TokenT n, StringT m);
VoidT close_all_input_files(VoidT);
FilePathT *current_input_file(VoidT);
VoidT next_char(VoidT);
VoidT start_par(VoidT);
VoidT finish_string(VoidT);
VoidT fillin_font_undefineds(FontRecordT *font_state);
#define Index IntT
ErrorT SrGet(Index stringIndex,StringT strp);
VoidT SafeFree(PtrT *memP);

/** Don't we have FDK functions for this purpose? **/
#ifdef MMLMIF 
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

#else

VoidT F_ApiInitialize();
VoidT F_ApiNotify();
VoidT mmlOpenOrImport();
VoidT mmlOpen();
VoidT mmlImport();
VoidT mmlAppendParagraph();
F_ObjHandleT mmlCreateParagraph();
VoidT mmlParRecordToPropVals();
VoidT mmlPropValsToParRecord();
VoidT mmlAppendText();
VoidT mmlInsertText();
F_TextRangeT mmlLocAndLenToRange();
VoidT mmlFontRecordToPropVals();
VoidT mmlAppendMarker();
VoidT mmlInsertMarker();
IntT mmlMapFontAngle();
IntT mmlMapFontWeight();
IntT mmlMapFontFamily();
IntT mmlIndexInStrings();
VoidT mmlCreateDocument();
VoidT fillin_doc_undefineds();
VoidT mmlInitialize();
VoidT mmlRun();
MetricT mmlMeasureToMetric();
BoolT mmlStrEqualIgnoreType();
VoidT mmlDeleteAllParFormats();
VoidT mmlAddAllParFormats();
VoidT mmlAddParFormat();
BoolT mmlGetParFormat();
VoidT mmlParFormatToPropVals();
F_TabsT *mmlTabStringToFTabs();
VoidT mmlFreeFTabs();
VoidT mmlCreateHeaderAndFooter();
VoidT mmlCreateHeaderOrFooter();
F_ObjHandleT mmlCreateTextColumn();
VoidT mmlAppendAnchoredFrame();
FilePathT *GenerateUniqueFilePath();
BoolT mmlWriteAnchoredFrameMIFToFile();
F_ObjHandleT mmlOpenMIFFile();
VoidT mmlApplyFormatsToDocument();
VoidT mmlCopyEverythingToClipboard();
VoidT mmlAppendClipboard();
VoidT mmlInsertClipboard();
MeasureT mmlMetricToMeasure();
BoolT mmlUnMapFontAngle();
BoolT mmlUnMapFontWeight();
IntT mmlUnMapFontFamily();
StringT mmlFTabsToTabString();
VoidT mmlMapAutoNumberString();
VoidT mmlUnMapAutoNumberString();
BoolT mmlFilenameToPath();
BoolT mmlPathOfFminit();
BoolT mmlPathOfTilda();
BoolT mmlTempMIFFilePath();
F_ObjHandleT mmlInsertPageNumber();
VoidT mmlInitializePgfIndexCache();
VoidT mmlInitializeFontIndexCache();
VoidT mmlDeleteHeadersAndFooters();
F_ObjHandleT mmlCreateFirstPageMasterPage();
VoidT mmlAssertFatal();
StringT NativeString();
VoidT StrCpy();
VoidT StrCatCharN();
VoidT StrTrunc();
BoolT StrEqual();
IntT StrLen();
VoidT FixTildaName();
VoidT mmlDeleteStableFontNameProperties();
VoidT mmlDeleteProperty();

UCharT *myalloc();
IntT new_hash_entry();
VoidT close_all_input_files();
FilePathT *current_input_file();
VoidT next_char();
VoidT start_par();
VoidT finish_string();
VoidT fillin_font_undefineds();
ErrorT SrGet();
VoidT SafeFree();

/** Don't we have FDK functions for this purpose? **/
#ifdef MMLMIF
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

#endif

#define MAX_HASH_SIZE 1000

extern HashEntryT		hash[MAX_HASH_SIZE + 1];
extern IntT				hash_entries;

extern IntT				emptyStringHashIndex;

extern StreamT			errput;

extern UnitT			units;

extern FontRecordT		font_state;

extern ParRecordT		par_state;

extern IntT				cur_char;
extern SmallT			cur_type;

#define STARTS_MACRO	3
#define ENDS_MACRO		4

#define FONTFAMILY      2
#define STRING          3

#define PAR_DEF         89
#define PAR_REF         90

extern MeasureT			pagewidth;
extern MeasureT			pageheight;
extern MeasureT			topmargin;
extern MeasureT			bottommargin;
extern MeasureT			leftmargin;
extern MeasureT			rightmargin;
extern NumberT			columns;
extern MeasureT			columngap;
extern UniqueStringT	leftheader;
extern UniqueStringT	centerheader;
extern UniqueStringT	rightheader;
extern UniqueStringT	leftfooter;
extern UniqueStringT	centerfooter;
extern UniqueStringT	rightfooter;
extern FontRecordT		headerfont;
extern MeasureT			headertopmargin;
extern MeasureT			headerbottommargin;
extern MeasureT			headerleftmargin;
extern MeasureT			headerrightmargin;
extern numberStyleT		headerpagenumberstyle;
extern BoolT			firstpageheader;
extern BoolT			firstpagefooter;
extern BoolT			doublesided;
extern BoolT			firstpageleft;
extern NumberT			firstpagenumber;

#define UNDEFINED 0x80000000

extern MeasureT			def_pagewidth;
extern MeasureT			def_pageheight;
extern MeasureT			def_topmargin;
extern MeasureT			def_bottommargin;
extern MeasureT			def_leftmargin;
extern MeasureT			def_rightmargin;
extern MeasureT			def_columngap;
extern MeasureT			def_headertopmargin;
extern MeasureT			def_headerbottommargin;
extern MeasureT			def_headerleftmargin;
extern MeasureT			def_headerrightmargin;

extern F_ObjHandleT			docId;
extern F_ObjHandleT			firstParagraphId;
extern F_TextLocT			insertionPoint;
extern F_PropValsT			paragraphProperties;
extern F_PropValsT			characterProperties;
extern F_PropValsT			headerFooterCharProperties;
extern mmlFontIndexCacheT	fontIndexCache;
extern BoolT				fontIndexCacheInitialized;
extern mmlPgfIndexCacheT	pgfFmtIndexCache;
extern BoolT				pgfFmtIndexCacheInitialized;
extern mmlPgfIndexCacheT	pgfIndexCache;
extern BoolT				pgfIndexCacheInitialized;
extern StringT				mmlErrorMessage[];

#define PROPVAL(propList,propIndex,propType) \
(((propList)->val)[(propIndex)].propVal.u.propType)

#define POINTTOMETRIC(pointSize)  ((MetricT)((pointSize)  * 65536.0))
#define METRICTOPOINT(metricSize) ((PointsT)((metricSize) / 65536.0))

#define FCalloc F_Calloc
#define myfree(p) FFree(p)
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

