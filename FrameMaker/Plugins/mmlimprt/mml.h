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

#ifndef MMLMIF
#define public
#define private
#define local static
#endif

typedef IntT SmallT;

typedef SmallT UnitT;
#define dflt 0
#define inch 1
#define cm 2
#define mm 3
#define pica 4
#define pt 5

typedef struct
{
	 RealT mamt;
	 SmallT munit;
} MeasureT;

typedef IntT TokenT;
typedef RealT	PointsT;
typedef IntT	NumberT;

typedef IntT FontFamilyT;	 /* actually a position in the hash table */
typedef IntT UniqueStringT;	 /* actually a position in the hash table */

typedef SmallT LrcdT;
#define DECIMAL 1
#define LEFT 2
#define RIGHT 4
#define LEFTRIGHT 8
#define CENTER 16

typedef SmallT numberStyleT;
#define arabic 0
#define lcroman 1
#define ucroman 2
#define lcalpha 3
#define ucalpha 4

#define BIGFILENAMESIZE 1023
typedef UCharT BigFileNameT[BIGFILENAMESIZE+1];

typedef struct
{
	 StringT name;
	 TokenT type;
	 StringT modifier;
} HashEntryT;

typedef struct
{
	 StringT key_name;
	 SmallT key_val;
} KeywordRecordT;

#define NORM 0
#define SUP  1
#define SUB  2
typedef struct
{
	 FontFamilyT family;
	 PointsT pts;
	 BoolT italic;
	 BoolT bold;
	 BoolT underline;
	 BoolT strike;
	 IntT script;
} FontRecordT;

typedef struct
{
	 StringT 		partag;
	 MeasureT 		leftindent;
	 MeasureT 		rightindent;
	 MeasureT 		firstindent;
	 MeasureT 		spacebefore;
	 MeasureT 		spaceafter;
	 MeasureT 		leading;
	 LrcdT 			alignment;
	 BoolT 			autonumber;
	 BoolT 			hyphenate;
	 BoolT 			columntop;
	 BoolT 			withnext;
	 BoolT 			forcefont;
	 FontRecordT 	parafont;
	 NumberT 		tolerance;
	 NumberT 		blocksize;
	 UniqueStringT 	numberformat;
	 LrcdT 			tabstoptype;
	 IntT 			tabstopleader;
	 UniqueStringT  tabstops;
} ParRecordT;

/*<copyright.c<*/
/*>copyright.c>*/
/*<mmltomif.c<*/
#ifdef _fullprototypes_
private UCharT *myalloc(IntT size);
private IntT new_hash_entry(StringT s, IntT slen, TokenT n, StringT m);
private VoidT close_all_input_files(VoidT);
private FilePathT *current_input_file(VoidT);
private VoidT next_char(VoidT);
private VoidT fillin_font_undefineds(FontRecordT *font_state);
private VoidT finish_string(VoidT);
private VoidT start_par(VoidT);
private VoidT mmlInitialize(StringT filename);
private VoidT mmlRun(StringT inputFileName);
#else
private UCharT *myalloc();
private IntT new_hash_entry();
private VoidT close_all_input_files();
private FilePathT *current_input_file();
private VoidT next_char();
private VoidT fillin_font_undefineds();
private VoidT finish_string();
private VoidT start_par();
private VoidT mmlInitialize();
private VoidT mmlRun();
#endif
/*>mmltomif.c>*/
