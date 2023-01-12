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
/*
 *	Program Name:
 *		mmlimport
 *
 *	General Description:
 *		API input filter client for opening and importing mml files.
 *		A sample mml file can be found in the FrameMaker product installation.
 *		Look for the MML subdirectory of the Samples subdirectory. Documentation
 *		for MML can be found in the FrameMaker OnlineManuals subdirectory.
 *
 *	Invocation (UNIX and Windows):
 *		Select "MMLImport" from the list of file types to convert
 *		from when opening or importing a MML file.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apicients file:
 *
 *		<APIclient
 *			<Name MMLImport>
 *			<Type TextImport>
 *			<FormatId MML>
 *			<Facet MML>
 *			<VendorId FAPI>
 *			<Suffix mml>
 *			<Directory fdk_install_dir/samples/mmlimprt>
 *			<CommandLine $FAPIDIR/mmlimport>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/mmlimport>
 *		to:
 *			<SharedLibrary mmlimport.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your product.ini (for example, maker.ini) file:
 *
 *		MMLImport=TextImport, MML, MML, FAPI, MMLImport, MML import client,
 *			fdk_install_dir\samples\mmlimprt\debug\mmlimprt.dll, all, ^.mml
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None
 */

#define ID_LINE (StringT)"mmltomif 1.3"

#include "fdk_env.h"

#ifdef MACINTOSH
#ifndef MMLAPI
#define MMLAPI
#endif
#endif

#ifdef MMLAPI

#include "fstdio.h"
#include "fdetypes.h"
#include "fapi.h"
#include "fmemory.h"
#include "fstrings.h"
#include "fchannel.h"
#include "futils.h"
#include "mml.h"
#include "fm_imml.h"

#endif /* MMLAPI */

#ifdef MMLMIF
#include "dim_stdio.h"
#include "dim_SrStrings.h"
#include "unix_SrStrings.h"
#include "fm_strings.h" 
#include "dim_HeapMgr.h"
#include "dd_paths.h"
#define DocumentT GenericT
#include "unix_paths.h"
#undef DocumentT
#include "fam_unix.h"
#include "fam_FileNames.h"
#include "dim_HeapMgr.h"
#include "fm_strings.h"
#include "unix_flamingo.h"
#endif

/************************* Defines follow **************************/

#define true  1
#define false 0

#define myfree(p) FFree(p);

#define MAXCHARBUFFINDEX	100
#define MAX_HASH_SIZE		1000
#define MAX_LINE_LENGTH		1000
#define MAX_INPUT_STACK		100
#define MAX_TAB_SPEC		1000
#define MAX_I_OPTIONS		100
#define BELL_POS			55
#define UNDEFINED			0x80000000
#define FUNDEFINED			-223.223
#define NOSTRING			MAX_HASH_SIZE


#define par_cmd par_command; finish_par();
#define font_cmd if (limited==0) {text_command; start_par(); finish_line();}

/* character input types */
#define REGULAR		 0
#define SPACER		 1
#define CHAR_DEFFED	 2
#define STARTS_MACRO 3
#define ENDS_MACRO	 4
#define BACKSLASH	 5
#define REGULAR2	 6

#define REG_OUTPUT 	0
#define TAB_OUTPUT 	1
#define BS_OUTPUT 	2
#define LQ_OUTPUT 	3
#define RQ_OUTPUT 	4
#define NO_OUTPUT 	5
#define HEX_OUTPUT 	6
#define HR_OUTPUT	7
#define HS_OUTPUT	8
#define NOHYPH_OUTPUT	9
#define DISCHYPH_OUTPUT	10

#define no_input			0
#define file_input			1
#define string_input		2

#define unit_section 		0
#define font_section 		1
#define paragraph_section 	2
#define document_section 	3
#define text_section 		4
#define end_section 		5

#define upto(s) if (MIFsection<s) nowin(s)
#define font_command upto(font_section)
#define par_command upto(paragraph_section)
#define doc_command upto(document_section)
#define text_command upto(text_section)
#define end_command upto(end_section)

#ifdef MMLMIF
#define MIF(x) fprintf(output,(StringT)x)
#define MIF2(x,y) fprintf(output,(StringT)x,y)
#endif


/*
Commands are one of the following.  Note that if you add to this list, you MUST
also add a call to "prim" in the "init_primitives" procedure!
*/

#define MML		 0
#define COMMENT		 1
#define FONTFAMILY	 2	/* not a real command */
#define STRING		 3 	/* not a real command */
#define TABBUF		 4	/* not a real command */
#define INCLUDE		 5
#define MACRO_CALL	 6
#define FIRST_RETURNABLE	 7	/* above are syntactic cmds */
#define NOP		 	 8
#define REGULAR_CHAR 9
#define RIGHT_BRACE	 10
#define DEFINEMACRO	 11
#define DEFINECHAR	 12
#define ALIAS		 13
#define UNITS		 14
#define FAMILY		 15
#define ITALIC		 16
#define NOITALIC	 17
#define BOLD		 18
#define NOBOLD		 19
#define UNDERLINE	 20 
#define NOUNDERLINE  21
#define STRIKE		 22
#define NOSTRIKE	 23
#define PLAIN		 24
#define OBLIQUE		 25
#define NOOBLIQUE	 26
#define	 NORMAL		 27
#define	 SUPERSCRIPT 28
#define	 SUBSCRIPT	 29
#define PTS			 30
#define DEFINEFONT	 31 
#define PAR          32 
#define IMPLICITPAR  33	
#define LEFTINDENT	 34
#define RIGHTINDENT	 35
#define FIRSTINDENT	 36
#define SPACEBEFORE	 37
#define SPACEAFTER	 38
#define LEADING		 39
#define ALIGNMENT	 40
#define AUTONUMBER	 41
#define HYPHENATE	 42
#define COLUMNTOP	 43
#define WITHNEXT	 44
#define FORCEFONT	 45
#define TOLERANCE	 46
#define BLOCKSIZE	 47
#define NUMBERFORMAT 48
#define TABSTOPTYPE	 49 
#define TABSTOPLEADER 50
#define TABSTOP		 51 
#define TABSTOPS	 52 
#define DEFINEPAR	 53 
#define DEFINETAG	 54 
#define LEFTHEADER	 55 
#define CENTERHEADER 56
#define RIGHTHEADER	 57 
#define LEFTFOOTER	 58 
#define CENTERFOOTER 59
#define RIGHTFOOTER	 60 
#define HEADERFONT	 61
#define HEADERTOPMARGIN 62	
#define HEADERBOTTOMMARGIN 63
#define HEADERLEFTMARGIN 64
#define HEADERRIGHTMARGIN 65
#define HEADERPAGENUMBERSTYLE 66
#define PAGEWIDTH	 67
#define PAGEHEIGHT	 68
#define TOPMARGIN	 69
#define BOTTOMMARGIN 70
#define LEFTMARGIN	 71
#define RIGHTMARGIN	 72
#define COLUMNS		 73
#define COLUMNGAP	 74
#define FIRSTPAGEHEADER 75
#define FIRSTPAGEFOOTER 76
#define DOUBLESIDED	 77
#define FIRSTPAGELEFT 78
#define FIRSTPAGENUMBER 79
#define CHARACTER	 80 
#define MESSAGE		 81 
#define ENDOFINPUT	 82 
#define AFRAME		 83 

#ifdef MMLMIF
#define LAST_PRIMITIVE 84
/* Op-codes not directly reachable from primitives: */
#define FONT_CALL	 85
#define PAR_CALL	 86
#define MARKER		 87
#endif

#ifdef MMLAPI
#define MARKER		 84
#define MTYPE		 85
#define MTEXT		 86
#define LAST_PRIMITIVE 87
/* Op-codes not directly reachable from primitives: */
#define FONT_CALL	 88
#define PAR_DEF      89
#define PAR_REF      90
#endif


/***************** Structure declarations follow ******************/

local struct
{
	 IntT input_type;	/* from defines above */
#ifdef MMLMIF
	 StreamT input_file;	/* points to file if input_type=file_input */
#endif
#ifdef MMLAPI
	 ChannelT input_channel;	/* points to input channel */ 
#endif
	 StringT input_string;	/* points to string if input_type==string_input */
	 IntT line_number;
} input_stack[MAX_INPUT_STACK + 1], input_state;

/******************** Global variables follow *********************/

BoolT	running = true;			/* turned off when we're all through */
IntT	emptyStringHashIndex;
IntT	cur_hash;
TokenT	cur_cmd;				/* the current command */
StringT	cur_modifier;

#ifdef MMLAPI
UCharT charBuff[MAXCHARBUFFINDEX+1];
IntT   charBuffIndex;
UCharT sbuf[2048] ;
IntT	markerType;
#endif

/* Hash table layout: */
public HashEntryT hash[MAX_HASH_SIZE + 1];	/* The hash table */
public IntT hash_entries = 0;		 		/* number of entries in the hash table */

/* The next character is always put in cur_char, and its char_type is put in cur_type. */
IntT cur_char;
SmallT cur_type;
CharT tmpChar;

/* There are a few translation arrays for efficient conversions. */
UCharT lowercase[256];
BoolT is_digit[256];
BoolT is_float_digit[256];

/* Unit state */
public UnitT units = inch;

/* Font state */
public FontRecordT font_state, def_font_state, undef_font_state;

/* Paragraph state */
public ParRecordT par_state, def_par_state, undef_par_state;

/* DocumentT state */
public MeasureT pagewidth;
public MeasureT pageheight;
public MeasureT topmargin;
public MeasureT bottommargin;
public MeasureT leftmargin;
public MeasureT rightmargin;
public NumberT columns;
public MeasureT columngap;
public UniqueStringT leftheader;
public UniqueStringT centerheader;
public UniqueStringT rightheader;
public UniqueStringT leftfooter;
public UniqueStringT centerfooter;
public UniqueStringT rightfooter;
public FontRecordT headerfont;
public MeasureT headertopmargin;
public MeasureT headerbottommargin;
public MeasureT headerleftmargin;
public MeasureT headerrightmargin;
public numberStyleT headerpagenumberstyle;
public BoolT firstpageheader;
public BoolT firstpagefooter;
public BoolT doublesided;
public BoolT firstpageleft;
public NumberT firstpagenumber;

public MeasureT def_pagewidth = {8.5, inch};
public MeasureT def_pageheight = {11, inch};
public MeasureT def_topmargin = {1, inch};
public MeasureT def_bottommargin = {1, inch};
public MeasureT def_leftmargin = {1, inch};
public MeasureT def_rightmargin = {1, inch};
public MeasureT def_columngap = {0.25, inch};
public MeasureT def_headertopmargin = {0.5, inch};
public MeasureT def_headerbottommargin = {0.5, inch};
public MeasureT def_headerleftmargin = {1.0, inch};
public MeasureT def_headerrightmargin = {1.0, inch};


/******************** Local variables follow **********************/

local BoolT in_tabstops = false;
local BoolT paragraph_mode = false;	/* Spaces are significant only in a paragraph */
local BoolT line_mode = false;		/* line_mode is off when paragraph_mode is off */
local BoolT string_mode = false;	/* string_mode is off when line_mode is off */
local BoolT already_cmd = false;
local BoolT already_char = false;

local UCharT reg_char;
local UCharT tabbuffer[MAX_TAB_SPEC];
local UCharT *tabptr;

local IntT line_pos;
local IntT limited = 0;
local IntT current_definee = -1;
local IntT cur_par;			 		/* hash position of most recent paragraph name */
local IntT input_depth = 0;			/* first unused spot in input_stack */
local IntT MIF_par;					/* hash position of last MIF paragraph name */
local IntT cur_I_options = 1;		/* first empty slot in I_options, we'll search cd first */

local StringT myname;
local StringT I_options[MAX_I_OPTIONS];		/* including trailing "/" */

local SmallT char_output[256];
local SmallT MIFsection = unit_section;

local ParRecordT MIFpar_state;
local FontRecordT MIFfont_state;

local UCharT char_type[256];
local UCharT buffer[MAX_LINE_LENGTH];
local StringT char_defs[256];		 /* definitions of characters of type CHAR_DEFFED */

#ifdef MMLMIF
local UCharT file_name[1024];
local StrBuffT fatals;
local StrBuffT tmp_name;
local StreamT tmp_file, real_output;
local BoolT tmp_file_exists = false;
local CharT *pending;			 	/* helps skip over non-existant sections */
local IntT aframe_id = 0;
#endif



local KeywordRecordT style_names[] = {
	 (StringT)"arabic", arabic,
	 (StringT)"lcroman", lcroman,
	 (StringT)"ucroman", ucroman,
	 (StringT)"lcalpha", lcalpha,
	 (StringT)"ucalpha", ucalpha,
	 NULL, 0
};

local KeywordRecordT lrcd_names[] = {
	 (StringT)"left", LEFT,
	 (StringT)"l", LEFT,
	 (StringT)"right", RIGHT,
	 (StringT)"r", RIGHT,
	 (StringT)"center", CENTER,
	 (StringT)"c", CENTER,
	 (StringT)"leftright", LEFTRIGHT,
	 (StringT)"lr", LEFTRIGHT,
	 (StringT)"decimal", DECIMAL,
	 (StringT)"d", DECIMAL,
	 NULL, 0
};

local KeywordRecordT unit_names[] = {
	 (StringT)"in", inch,
	 (StringT)"inch", inch,
	 (StringT)"\"", inch,
	 (StringT)"cm", cm,
	 (StringT)"mm", mm,
	 (StringT)"pica", pica,
	 (StringT)"pc", pica,
	 (StringT)"pt", pt,
	 NULL, 0
};

local KeywordRecordT boolean_names[] = {
	 (StringT)"yes", true,
	 (StringT)"y", true,
	 (StringT)"true", true,
	 (StringT)"t", true,
	 (StringT)"1", true,
	 (StringT)"no", false,
	 (StringT)"n", false,
	 (StringT)"false", false,
	 (StringT)"f", false,
	 (StringT)"0", false,
	 NULL, 0
};


/*********************** Prototypes follow ************************/

/*<mmltomif.c<*/
#ifdef _fullprototypes_
local BoolT measure_ne(MeasureT *m1, MeasureT *m2);
local VoidT initialize(VoidT);
local VoidT init_translation_arrays(VoidT);
local VoidT lowercaseify(StringT s);
local VoidT init_primitives(VoidT);
local VoidT init_hash_table(VoidT);
local UIntT hash_func(StringT s);
local StringT make_string(StringT s, IntT len);
local IntT find_hash_entry(StringT s);
local VoidT init_char_types(VoidT);
local VoidT init_input(VoidT);
local VoidT push_input(VoidT);
local VoidT pop_input(VoidT);
local VoidT start_expanding(StringT s);
local BoolT expand_file_name(StringT s);
local BoolT new_start_inputting(StringT s);
local BoolT start_inputting(StringT s);
local VoidT do_include(VoidT);
local IntT file_level(VoidT);
local VoidT start_error(VoidT);
local VoidT end_error(VoidT);
local VoidT fatal(IntT errnum);
local VoidT ifatal(IntT errnum);
local VoidT quick_next_char(VoidT);
local VoidT un_next_char(VoidT);
local IntT hex_digit(VoidT);
local VoidT skip_spaces(VoidT);
local IntT perhaps_scan_name_to_buffer(VoidT);
local IntT scan_name_to_buffer(VoidT);
local VoidT next_cmd(VoidT);
local VoidT un_next_cmd(VoidT);
local VoidT terminate_command(VoidT);
local VoidT skip_comment(VoidT);
local NumberT scan_char(VoidT);
local IntT scan_string_to_buffer(VoidT);
local IntT scan_file_name_to_buffer(VoidT);
local StringT scan_kept_string(VoidT);
local UniqueStringT scan_unique_string(VoidT);
local NumberT scan_number(VoidT);
local NumberT scan_char_or_number(VoidT);
local RealT scan_real(VoidT);
local PointsT scan_points(VoidT);
local IntT keyword_search(KeywordRecordT *k);
local BoolT scan_boolean(VoidT);
local UnitT scan_unit(BoolT errorflag);
local LrcdT scan_lrcd(LrcdT ok);
local numberStyleT scan_style(VoidT);
local VoidT scan_measure(MeasureT *m);
local FontFamilyT scan_family(VoidT);
local BoolT font_record_ne(FontRecordT *f1, FontRecordT *f2);
local VoidT init_font_state(VoidT);
local FontRecordT *copy_font_state(VoidT);
local ParRecordT *copy_par_state(VoidT);
local VoidT init_par_state(VoidT);
local VoidT fillin_par_undefineds(VoidT);
local VoidT init_doc_state(VoidT);
local VoidT init_char_output(VoidT);
local VoidT MIFchar(PUCharT c);
local VoidT MIFlrcd(LrcdT x);
local VoidT MIFboolean(BoolT b);
local VoidT MIFnumber(NumberT n);
local VoidT MIFfamily(FontFamilyT f);
local VoidT MIFunique_string(UniqueStringT s);
local VoidT MIFstyle(numberStyleT s);
local VoidT MIFUnits(UnitT u);
local VoidT MIFunits(UnitT u);
local VoidT MIFpoints(RealT p);
local VoidT MIFmeasure(MeasureT *m);
local VoidT do_pending(VoidT);
local VoidT nowin(SmallT s);
local VoidT MIF_unit(VoidT);
local VoidT MIF_font(VoidT);
local VoidT MIF_paragraph(VoidT);
local VoidT MIF_document(VoidT);
local VoidT MIF_text(VoidT);
local VoidT MIFpartag(VoidT);
local VoidT MIFleftindent(VoidT);
local VoidT MIFrightindent(VoidT);
local VoidT MIFfirstindent(VoidT);
local VoidT MIFspacebefore(VoidT);
local VoidT MIFspaceafter(VoidT);
local VoidT MIFleading(VoidT);
local VoidT MIFalignment(VoidT);
local VoidT MIFautonumber(VoidT);
local VoidT MIFhyphenate(VoidT);
local VoidT MIFcolumntop(VoidT);
local VoidT MIFwithnext(VoidT);
local VoidT MIFforcefont(VoidT);
local VoidT MIFtolerance(VoidT);
local VoidT MIFblocksize(VoidT);
local VoidT MIFnumberformat(VoidT);
local VoidT MIFxfamily(VoidT);
local VoidT MIFpts(VoidT);
local VoidT MIFitalic(VoidT);
local VoidT MIFbold(VoidT);
local VoidT MIFstrike(VoidT);
local VoidT MIFunderline(VoidT);
local VoidT MIFscript(VoidT);
local VoidT MIFfont(VoidT);
local VoidT MIFtabstops(VoidT);
local VoidT init_MIF_state(VoidT);
local VoidT MIF_begin_par(VoidT);
local VoidT MIF_end_par(VoidT);
local VoidT MIF_begin_paraline(VoidT);
local VoidT MIFpartial_font(VoidT);
local VoidT MIF_end_paraline(VoidT);
local VoidT do_predefines(VoidT);
local VoidT init_tmp_file(VoidT);
local VoidT switch_to_tmp_file(VoidT);
local VoidT concat_tmp_file(VoidT);
local VoidT look_for_uilanguage(IntT argc, StringT *argv);
local VoidT read_args(IntT argc, StringT *argv);
local VoidT do_macro_define(VoidT);
local VoidT do_char_define(VoidT);
local VoidT do_alias(VoidT);
local VoidT do_limited_commands(VoidT);
local VoidT now_defining(IntT h);
local VoidT do_par_define(VoidT);
local VoidT do_par_undefined(VoidT);
local VoidT do_font_define(VoidT);
local VoidT do_headerfont(VoidT);
local VoidT chk_in_tabstops(VoidT);
local VoidT do_tabstops(VoidT);
local VoidT do_tabstop(VoidT);
local VoidT do_cur_cmd(VoidT);
local VoidT start_string(VoidT);
local VoidT start_line(VoidT);
local VoidT finish_line(VoidT);
local VoidT new_line(VoidT);
local VoidT finish_par(VoidT);
local VoidT do_aframe_cmd(VoidT);
local VoidT done_aframes(VoidT);
local VoidT do_marker_cmd(VoidT);
local IntT scan_marker_text_to_buffer(VoidT);
local VoidT do_marker_cmd(VoidT);
#else
local BoolT measure_ne();
local VoidT initialize();
local VoidT init_translation_arrays();
local VoidT lowercaseify();
local VoidT init_primitives();
local VoidT init_hash_table();
local UIntT hash_func();
local StringT make_string();
local IntT find_hash_entry();
local VoidT init_char_types();
local VoidT init_input();
local VoidT push_input();
local VoidT pop_input();
local VoidT start_expanding();
local BoolT expand_file_name();
local BoolT new_start_inputting();
local BoolT start_inputting();
local VoidT do_include();
local IntT file_level();
local VoidT start_error();
local VoidT end_error();
local VoidT fatal();
local VoidT ifatal();
local VoidT quick_next_char();
local VoidT un_next_char();
local IntT hex_digit();
local VoidT skip_spaces();
local IntT perhaps_scan_name_to_buffer();
local IntT scan_name_to_buffer();
local VoidT next_cmd();
local VoidT un_next_cmd();
local VoidT terminate_command();
local VoidT skip_comment();
local NumberT scan_char();
local IntT scan_string_to_buffer();
local IntT scan_file_name_to_buffer();
local StringT scan_kept_string();
local UniqueStringT scan_unique_string();
local NumberT scan_number();
local NumberT scan_char_or_number();
local RealT scan_real();
local PointsT scan_points();
local IntT keyword_search();
local BoolT scan_boolean();
local UnitT scan_unit();
local LrcdT scan_lrcd();
local numberStyleT scan_style();
local VoidT scan_measure();
local FontFamilyT scan_family();
local BoolT font_record_ne();
local VoidT init_font_state();
local FontRecordT *copy_font_state();
local ParRecordT *copy_par_state();
local VoidT init_par_state();
local VoidT fillin_par_undefineds();
local VoidT init_doc_state();
local VoidT init_char_output();
local VoidT MIFchar();
local VoidT MIFlrcd();
local VoidT MIFboolean();
local VoidT MIFnumber();
local VoidT MIFfamily();
local VoidT MIFunique_string();
local VoidT MIFstyle();
local VoidT MIFUnits();
local VoidT MIFunits();
local VoidT MIFpoints();
local VoidT MIFmeasure();
local VoidT do_pending();
local VoidT nowin();
local VoidT MIF_unit();
local VoidT MIF_font();
local VoidT MIF_paragraph();
local VoidT MIF_document();
local VoidT MIF_text();
local VoidT MIFpartag();
local VoidT MIFleftindent();
local VoidT MIFrightindent();
local VoidT MIFfirstindent();
local VoidT MIFspacebefore();
local VoidT MIFspaceafter();
local VoidT MIFleading();
local VoidT MIFalignment();
local VoidT MIFautonumber();
local VoidT MIFhyphenate();
local VoidT MIFcolumntop();
local VoidT MIFwithnext();
local VoidT MIFforcefont();
local VoidT MIFtolerance();
local VoidT MIFblocksize();
local VoidT MIFnumberformat();
local VoidT MIFxfamily();
local VoidT MIFpts();
local VoidT MIFitalic();
local VoidT MIFbold();
local VoidT MIFstrike();
local VoidT MIFunderline();
local VoidT MIFscript();
local VoidT MIFfont();
local VoidT MIFtabstops();
local VoidT init_MIF_state();
local VoidT MIF_begin_par();
local VoidT MIF_end_par();
local VoidT MIF_begin_paraline();
local VoidT MIFpartial_font();
local VoidT MIF_end_paraline();
local VoidT do_predefines();
local VoidT init_tmp_file();
local VoidT switch_to_tmp_file();
local VoidT concat_tmp_file();
local VoidT look_for_uilanguage();
local VoidT read_args();
local VoidT do_macro_define();
local VoidT do_char_define();
local VoidT do_alias();
local VoidT do_limited_commands();
local VoidT now_defining();
local VoidT do_par_define();
local VoidT do_par_undefined();
local VoidT do_font_define();
local VoidT do_headerfont();
local VoidT chk_in_tabstops();
local VoidT do_tabstops();
local VoidT do_tabstop();
local VoidT do_cur_cmd();
local VoidT start_string();
local VoidT start_line();
local VoidT finish_line();
local VoidT new_line();
local VoidT finish_par();
local VoidT do_aframe_cmd();
local VoidT done_aframes();
local VoidT do_marker_cmd();
local IntT scan_marker_text_to_buffer();
local VoidT do_marker_cmd();
#endif
/*>mmltomif.c>*/

#ifdef MMLAPI
#include "fapidefs.h"
#include "mmlprot2.h"
#endif

#ifdef MMLMIF
#undef exit 
StreamT input  = stdin;
StreamT output = stdout;
StreamT errput = stderr;
#endif


private UCharT *myalloc(size)
IntT size;
{
	 UCharT *ret;

	 if (size < 0) {
		 ret = NULL;
	 } else if (size == 0) {
		 ret = (UCharT *)F_Calloc(1, 1, NO_DSE);
	 } else {
		 ret = (UCharT *)F_Calloc(1, size, NO_DSE);
	 }

	 if (ret == NULL)
		 fatal(MMLOutOfMemory);

	 return (ret);
}


#ifdef MMLMIF
local BoolT measure_ne(MeasureT m1, MeasureT m2)
{
	 if ((m1->munit != m2->munit)
			 || (m1->mamt != m2->mamt))
		 return (true);
	 return (false);
}
#endif


#ifdef MMLMIF
noproto VoidT main(IntT argc, StringT argv)
{
	 myname = argv[0];
	 look_for_uilanguage(argc, argv); /* set UILanguage from arguments */
	 initialize();
	 read_args(argc, argv);	/* may affect input stack */
	 do_predefines();	/* affects input stack */
	 while (running)
	 	{
		 next_cmd();
		 do_cur_cmd();
	 	}
	 exit(0);
}
#endif


/*
All subsystems are initialized here. Caution: The calling order is significant.
*/

local VoidT initialize()
{
#ifdef NeXT
	StrBuffT a;
	NativeCharT *p;
	extern NativeCharT *getenv();
#endif

#ifdef MMLMIF
	InitCharMaps();
#endif 

#ifdef MMLMIF
#ifdef NeXT
	StrCpyN(a, myname, sizeof(a));
	if ((p = getenv("FMHOME")) != 0) {
		StrCpyN(a, (StringT) p, sizeof(a));
		StrCatN(a, (StringT) "/desideratum", sizeof(a));
	}
	UiInitDir(a);	/* ufamily finds string resources. */
#else
	UiInitDir(myname);	/* ufamily finds string resources. */
#endif
#endif
	init_translation_arrays();
	init_hash_table();
	init_primitives();
	init_char_types();
	init_input();
	init_font_state();
	init_par_state();
	init_doc_state();
	init_char_output();
	init_MIF_state();
#ifdef MMLMIF
	init_tmp_file();
#endif
}


local VoidT init_translation_arrays()
{
	 IntT i;

	 for (i = 0; i < 256; i++)
	 	{
		 lowercase[i] = i;
		 is_digit[i] = is_float_digit[i] = false;
	 	}
	 for (i = 'A'; i <= 'Z'; i++)
		 lowercase[i] = i - 'A' + 'a';
	 for (i = '0'; i <= '9'; i++)
		 is_digit[i] = is_float_digit[i] = true;
	 is_float_digit['.'] = true;
	 is_float_digit['+'] = is_float_digit['-'] = true;
}


local VoidT lowercaseify(s)
StringT s;
{
	 StringT p;

	 for (p = s; *p; p++)
		 *p = lowercase[*p];
}


/*
Here we put all the primitive tokens into the hash table
*/

local VoidT init_primitives()
{
#define prim(s,n) new_hash_entry((StringT)s,-1,n,NULL)

	 prim("mml", MML);
	 prim("comment", COMMENT);
	 prim("!definemacro", DEFINEMACRO);
	 prim("!definechar", DEFINECHAR);
	 prim("!alias", ALIAS);
	 prim("include", INCLUDE);
	 prim("units", UNITS);
	 prim("family", FAMILY);
	 prim("italic", ITALIC);
	 prim("noitalic", NOITALIC);
	 prim("bold", BOLD);
	 prim("nobold", NOBOLD);
	 prim("underline", UNDERLINE);
	 prim("nounderline", NOUNDERLINE);
	 prim("strike", STRIKE);
	 prim("nostrike", NOSTRIKE);
	 prim("plain", PLAIN);
	 prim("oblique", OBLIQUE);
	 prim("nooblique", NOOBLIQUE);
	 prim("normal", NORMAL);
	 prim("superscript", SUPERSCRIPT);
	 prim("subscript", SUBSCRIPT);
	 prim("pts", PTS);
	 prim("!definefont", DEFINEFONT);
	 prim("par", PAR);
	 prim("leftindent", LEFTINDENT);
	 prim("rightindent", RIGHTINDENT);
	 prim("firstindent", FIRSTINDENT);
	 prim("spacebefore", SPACEBEFORE);
	 prim("spaceafter", SPACEAFTER);
	 prim("leading", LEADING);
	 prim("alignment", ALIGNMENT);
	 prim("autonumber", AUTONUMBER);
	 prim("hyphenate", HYPHENATE);
	 prim("columntop", COLUMNTOP);
	 prim("withnext", WITHNEXT);
	 prim("forcefont", FORCEFONT);
	 prim("tolerance", TOLERANCE);
	 prim("blocksize", BLOCKSIZE);
	 prim("numberformat", NUMBERFORMAT);
	 prim("tabstoptype", TABSTOPTYPE);
	 prim("tabstopleader", TABSTOPLEADER);
	 prim("tabstop", TABSTOP);
	 prim("tabstops", TABSTOPS);
	 prim("!definepar", DEFINEPAR);
	 prim("!definetag", DEFINETAG);
	 prim("leftheader", LEFTHEADER);
	 prim("centerheader", CENTERHEADER);
	 prim("rightheader", RIGHTHEADER);
	 prim("leftfooter", LEFTFOOTER);
	 prim("centerfooter", CENTERFOOTER);
	 prim("rightfooter", RIGHTFOOTER);
	 prim("headerfont", HEADERFONT);
	 prim("headertopmargin", HEADERTOPMARGIN);
	 prim("headerbottommargin", HEADERBOTTOMMARGIN);
	 prim("headerleftmargin", HEADERLEFTMARGIN);
	 prim("headerrightmargin", HEADERRIGHTMARGIN);
	 prim("headerpagenumberstyle", HEADERPAGENUMBERSTYLE);
	 prim("pagewidth", PAGEWIDTH);
	 prim("pageheight", PAGEHEIGHT);
	 prim("topmargin", TOPMARGIN);
	 prim("bottommargin", BOTTOMMARGIN);
	 prim("leftmargin", LEFTMARGIN);
	 prim("rightmargin", RIGHTMARGIN);
	 prim("columns", COLUMNS);
	 prim("columngap", COLUMNGAP);
	 prim("firstpageheader", FIRSTPAGEHEADER);
	 prim("firstpagefooter", FIRSTPAGEFOOTER);
	 prim("doublesided", DOUBLESIDED);
	 prim("firstpageleft", FIRSTPAGELEFT);
	 prim("firstpagenumber", FIRSTPAGENUMBER);
	 prim("character", CHARACTER);
	 prim("message", MESSAGE);
	 prim("aframe", AFRAME);
	 prim("endofinput", ENDOFINPUT);
	 prim("marker", MARKER);
#ifdef MMLAPI
	 prim("mtype", MTYPE);
	 prim("mtext", MTEXT);
#endif
}


local VoidT init_hash_table()
{
	 IntT i;

	 for (i = 0; i < MAX_HASH_SIZE; i++)
		 hash[i].name = NULL;
}


local UIntT hash_func(s)
StringT s;
{
	 UIntT h = 0;

	 while (*s)
		 h = h + h + *s++;
	 h = h % MAX_HASH_SIZE;
	 return (h);
}


/* Copy a string to a permanent home */

local StringT make_string(s, len)
StringT s;
IntT len;
{
	 StringT t;
	 IntT i;

	 t = myalloc(len);
	 for (i = 0; i < len; i++)
		 t[i] = s[i];
	 return (t);
}


/*
This routine puts in a new hash entry.  The name must not already be known.
Note that we copy over the string passed to us, if it has a specified length..
*/

private IntT new_hash_entry(s, slen, n, m)
StringT s;
IntT slen;
TokenT n;
StringT m;
{
	 UIntT h;

	 if (s == NULL || *s == 0)
		 ifatal(IMMLEmptyNameNew);
	 if (++hash_entries == MAX_HASH_SIZE)
		 fatal(MMLHashTableOverflow);
	 h = hash_func(s);
	 loop
	 	{			/* find a place to go */
		 if (hash[h].name == NULL)
		 	{		/* empty slot */
			 if (slen >= 0)	/* non-builtin string */
				 s = make_string(s, slen);
			 hash[h].name = s;
			 break;
		 	}
		 if (StrEqual(hash[h].name, s))
		 	{		/* old name */
			 --hash_entries; /* We didn't really take up a new slot */
			 break;
		 	}
		 if (++h == MAX_HASH_SIZE)
			 h = 0;
	 	}
	 hash[h].type = n;
	 hash[h].modifier = m;
	 return (h);
}


local IntT find_hash_entry(s)
StringT s;
{
	 UIntT h;

	 if (s == NULL || *s == 0)
		 ifatal(IMMLEmptyNameFind);
	 h = hash_func(s);
	 while (hash[h].name != NULL)
	 	{			/* find an empty spot */
		 if (StrEqual(hash[h].name, s))
			 return (h);	/* found it! */
		 if (++h == MAX_HASH_SIZE)
			 h = 0;
	 	}
	 return (MAX_HASH_SIZE);	/* loser */
}


/*
Now for the input processing.  "next_cmd" is responsible for reading the
input and figuring out the command code of the next token.  Typically, it will
be a character.  If it's a command, then "next_cmd" scans the command name,
and sees what kind of a command it is.  The command and modifier go into
cur_cmd and cur_modifier.  If it's a user-defined macro, then we put that macro
on the stack, and recursively try to get the next token.
*/

local VoidT init_char_types()
{
	 IntT i;

	 for (i = 0; i < 256; i++)
		 char_type[i] = REGULAR;
	 char_type['<'] = STARTS_MACRO;
	 char_type['>'] = ENDS_MACRO;
	 char_type[' '] = SPACER;
	 char_type['\t'] = SPACER;
	 char_type['\n'] = SPACER;
	 char_type['\\'] = BACKSLASH;
}


local VoidT init_input()
{
#ifdef MMLMIF
	 input_state.input_type = file_input;
	 input_state.input_file = input;
#endif
#ifdef MMLAPI
	 input_state.input_type = no_input;
	 input_state.input_channel = NULL ;
#endif
	 input_state.input_string = NULL;
	 input_state.line_number = 1;
	 input_depth = 0;
}


local VoidT push_input()
{
	 if (++input_depth == MAX_INPUT_STACK)
		 fatal(MMLInputStackOverflow);
	 input_stack[input_depth - 1] = input_state;
	 input_state.line_number = 1;
}

local VoidT pop_input()
{

	if (input_depth == 0) {
		input_state.input_type = no_input;
	} else {
		if (input_state.input_type == file_input) {
#ifdef MMLMIF 
			fclose(input_state.input_file);
#endif 
#ifdef MMLAPI 
		   F_ChannelClose(input_state.input_channel);
#endif 
		}

		input_depth--;
		input_state = input_stack[input_depth];
	}
}


private VoidT close_all_input_files()
{
	do {
		pop_input();
	}
	while(input_depth);
}


local VoidT start_expanding(s)
StringT s;
{
	 push_input();
#ifdef MMLAPI
	 input_state.input_channel = NULL ;
#endif
	 input_state.input_type = string_input;
	 input_state.input_string = s;
}


#ifdef MMLMIF
local BoolT expand_file_name(s)
StringT s;
{
	 StrCpy(file_name, s);
	 FixTildaName(file_name);
	 return (false);		/* success */
}
#endif 


#ifdef MMLAPI
local BoolT new_start_inputting(s)
StringT s;
{
	ChannelT inChannel ;
	IntT iopt ;
	PathEnumT plat ;
	FilePathT *anchor, *path ; 
	StringT file ;
	IntT len ;

	plat = F_PathNameType(s); 

	inChannel = mmlChanOpen(s, (StringT)"r");
	if (inChannel != NULL) {
	 	len = StrLen(s) + 1;
	 	push_input();
	 	input_state.input_type = file_input;
	 	input_state.input_channel = inChannel;
	 	input_state.input_string = make_string(s, len);
		return (false);
	} else {
		iopt = 0 ;
		loop {
			if (iopt == cur_I_options)
				return(true); 					/* failure */

			anchor = F_PathNameToFilePath (I_options[iopt],(FilePathT *)NULL,plat) ;
			path = F_PathNameToFilePath( s, anchor, plat );
			file =  F_FilePathToPathName( path, plat ) ;

			inChannel = mmlChanOpen(file, (StringT)"r");

			if (path)
				F_FilePathFree( path ) ;
			if (anchor)
				F_FilePathFree( anchor ) ;

			if (inChannel != NULL ) {
	 			len = StrLen(file)+1;
	 			push_input();
	 			input_state.input_type = file_input;
	 			input_state.input_channel = inChannel;
	 			input_state.input_string =make_string(file,len);
				return (false ) ;
			}
			iopt++ ;
		}
	}

}
#endif


#ifdef MMLMIF
local BoolT start_inputting(StringT s)
{
	 IntT len, iopt;
	 UCharT *from, *to;
	 StreamT file;
	 UCharT unex_file_name[1024];


	 if (s[0] == '/')
	 	{
		 to = file_name;
		 from = s;
		 while (*from)
			 *to++ = *from++;
		 *to++ = 0;
		 file = fopen(file_name, (StringT)"r");
		 if (file == NULL)
			 return (true);	/* failure */
	 	}
	 else if (s[0] == '~')
	 	{
		 to = file_name;
		 if (expand_file_name(s))
			 return (true);	/* failure */

		 file = fopen(file_name, (StringT)"r");
		 if (file == NULL)
			 return (true);	/* failure */
	 	}
	 else
	 	{
		 iopt = 0;
		 loop
		 	{
			 to = unex_file_name;
			 if (iopt == cur_I_options)
				 return (true);	/* failure */
			 from = I_options[iopt];
			 while (*from)
				 *to++ = *from++;
			 from = s;
			 while (*from)
				 *to++ = *from++;
			 *to++ = 0;
			 if (!expand_file_name(unex_file_name))
			 	{
				 file = fopen(file_name, (StringT)"r");
				 if (file != NULL)
					 break;	/* success */
			 	}
			 iopt++;
		 	}
	 	}
	 len = StrLen(file_name)+1;
	 push_input();
	 input_state.input_type = file_input;
	 input_state.input_file = file;
	 input_state.input_string = make_string(file_name, len);
	 return (false);		/* success */
}
#endif


local VoidT do_include()
{
	 scan_file_name_to_buffer();
	 terminate_command();
#ifdef MMLMIF
	 if (start_inputting(buffer))
#endif
#ifdef MMLAPI
	 if (new_start_inputting(buffer))
#endif
	 {
#ifdef MMLMIF
		StrBuffT msg;
#endif

		start_error();
#ifdef MMLMIF
		SrGetF(MMLCantOpenFile, msg, STRBUFFSIZE,
			      (StringT)"s", buffer);
		fputs(msg, errput);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf, mmlErrorMessage[MMLCantOpenFile], buffer);
		F_Printf(0, sbuf) ;
#endif
		end_error();
	 }
}


local IntT file_level()
{
	IntT i;
	
	input_stack[input_depth] = input_state;
	i = input_depth;
	while (input_stack[i].input_type == string_input)
		i--;
	return (i);
}


#ifdef MMLAPI
private FilePathT *current_input_file()
{
	IntT i;
	
	input_stack[input_depth] = input_state;

	for (i = input_depth; i >= 0; i--) { 
		if (input_stack[i].input_type == file_input)
			return(F_GetFilePath(input_stack[i].input_channel));
	}
	return (NULL);
}
#endif


local VoidT start_error()
{
	IntT i;
	
	i = file_level();
#ifdef MMLMIF
	fprintf(errput, (StringT)"%s ", myname);
	if (input_stack[i].input_string != NULL)
		fprintf(errput, (StringT)"\"%s\", ", input_stack[i].input_string);
	fprintf(errput, (StringT)"line %d: ", input_stack[i].line_number);
#endif
#ifdef MMLAPI
	F_Sprintf(sbuf, (StringT)"%s ", myname);
	F_Printf(0, sbuf);
	if (input_stack[i].input_string != NULL) {
		F_Sprintf(sbuf, (StringT)"\"%s\", ", input_stack[i].input_string);
		F_Printf(0, sbuf) ;
	}
	F_Sprintf(sbuf, (StringT)"line %d: ", input_stack[i].line_number);
	F_Printf(0,  sbuf ) ;
#endif
}


local VoidT end_error()
{
#ifdef MMLTOMIF
	fprintf(errput, (StringT)"\n");
#endif
#ifdef MMLAPI
	F_Sprintf(sbuf, (StringT)"\n") ;
	F_Printf(0, sbuf) ;
#endif
}


local VoidT fatal(errnum)
IntT errnum;
{
#ifdef MMLMIF
	StrBuffT s;
#endif

	start_error();
#ifdef MMLMIF
	SrGet(errnum, s);
	SrGetF(MMLFatal, fatals, STRBUFFSIZE, (StringT)"s", s);
	fprintf(errput, fatals);
#endif
#ifdef MMLAPI
	F_Sprintf(sbuf, mmlErrorMessage[MMLFatal], mmlErrorMessage[errnum]);
	F_Printf(0,  sbuf ) ;
#endif
	end_error();
#ifdef MMLMIF
	if (tmp_file_exists) {
		unlink(tmp_name);
	}
	exit(1);
#endif
#ifdef MMLAPI
	F_ApiReturnValue(0);
	F_ApiBailOut();
	F_Exit(1);
#endif
}


local VoidT ifatal(errnum)
IntT errnum;
{
	StrBuffT s;

	start_error();
#ifdef MMLMIF
	SrGetF(MMLInternalError, s, STRBUFFSIZE, (StringT)"d", errnum);
#endif
#ifdef MMLAPI
	F_Sprintf(s, mmlErrorMessage[MMLInternalError], errnum);
#endif
#ifdef MMLMIF
	if (!fatals[0])
		SrGet(MMLFatal, fatals);
	fprintf(errput, fatals, s);
#endif
#ifdef MMLAPI
	F_Sprintf(sbuf,mmlErrorMessage[MMLFatal],s);
	F_Printf(0,  sbuf ) ;
#endif
	end_error();
#ifdef MMLMIF
	if (tmp_file_exists) {
		unlink(tmp_name);
	}
	exit(1);
#endif
#ifdef MMLAPI
	F_ApiReturnValue(0);
	F_ApiBailOut();
	F_Exit(1);
#endif
}


/*
This routine gets the next character of input
*/

local VoidT quick_next_char()
{
	IntT numBytes;

	 if (already_char) {
		 already_char = false;
		 return;
	 }
	 loop {
		 switch (input_state.input_type)
		 {
			 case no_input:
				 cur_char = EOF;
				 cur_type = REGULAR;
				 return;

			 case string_input:
				 cur_char = *input_state.input_string++;
				 if (!cur_char)
					 break;
				 cur_type = char_type[cur_char];
				 return;

			 case file_input:
#ifdef MMLMIF
				 cur_char = fgetc(input_state.input_file);
#endif
#ifdef MMLAPI
				numBytes  = F_ChannelRead(&tmpChar, 1, 1, input_state.input_channel);
				cur_char = tmpChar;
				if (!numBytes) cur_char = EOF;
#endif
				 if (cur_char == '\n')
					 input_state.line_number++;
				 if (cur_char == EOF)
					 break;
				 cur_type = char_type[cur_char];
				 return;
		 }
		 pop_input();
	 }
}


/*
This routine puts back a character for the next time next_char is called.
*/

local VoidT un_next_char()
{
	if (already_char)
		ifatal(IMMLDoubleUnNextChar);
	already_char = true;
}


local IntT hex_digit()
{
#ifdef MMLMIF
	 StrBuffT msg;
#endif
	 StrBuffT msg1;

	 if (is_digit[cur_char])
		 return (cur_char - '0');
	 if (cur_char >= 'a' && cur_char <= 'f')
		 return (cur_char - 'a' + 10);
	 if (cur_char >= 'A' && cur_char <= 'F')
		 return (cur_char - 'A' + 10);
	 start_error();
	 StrTrunc(msg1);
	 StrCatCharN(msg1, cur_char, STRBUFFSIZE);
#ifdef MMLMIF
	 SrGetF(MMLBadHexDigit, msg, STRBUFFSIZE, (StringT)"s", msg1);
	 fprintf(errput, msg);
#endif
#ifdef MMLAPI
	 F_Sprintf(sbuf,mmlErrorMessage[MMLBadHexDigit],msg1);
	 F_Printf(0, sbuf ) ;
#endif
	 end_error();
	 return (0);
}


private VoidT next_char()
{
	IntT x;

	quick_next_char();
	if (cur_type == BACKSLASH) {
		quick_next_char();
		switch (cur_char)
		{
			 case 't':
				 cur_char = '\t';
				 cur_type = REGULAR;
				 break;
			 case 'h':
			 case 'r':
			 case 'n':
				 cur_char = '\r';
				 cur_type = REGULAR;
				 break;
			 case 'x':
				 quick_next_char();
				 x = hex_digit();
				 quick_next_char();
				 while (cur_type == REGULAR && cur_char != EOF)
				 	{
					 x = 16 * x + hex_digit();
					 quick_next_char();
				 	}
				 if (cur_type != SPACER)
				 	{
#ifdef MMLMIF
					 StrBuffT msg; 
#endif

					 start_error();
#ifdef MMLMIF
					 SrGetF(
					        MMLxNeedsEndingSpace, msg, STRBUFFSIZE,
						      (StringT)"s", (StringT)"\\x");
					 fputs(msg, errput);
#endif
#ifdef MMLAPI
					 F_Sprintf(sbuf,mmlErrorMessage[MMLxNeedsEndingSpace],
							 (StringT)"\\x");
				   F_Printf(0, sbuf) ;
#endif
					 end_error();
				 	}
				 cur_char = x;
				 cur_type = REGULAR;
				 break;
			 case '\\':
				 cur_type = REGULAR2;
				 break;
			 case '>':
				 cur_type = REGULAR2;
				 break;
			 case '<':
				 cur_type = REGULAR2;
				 break;
			 default:
				 cur_type = REGULAR;
				 break;
		 }
	 }
}


local VoidT skip_spaces()
{
	 do
		 quick_next_char();	/* avoid BACKSLASH processing */
	 while (cur_type == SPACER);
	 un_next_char();
}


/* Returns length of name including terminating nul */
local IntT perhaps_scan_name_to_buffer()
{
	IntT len;

	skip_spaces();
	len = 0;
	while (len < MAX_LINE_LENGTH) {
		next_char();
		if (cur_type != REGULAR)
			break;
		buffer[len++] = cur_char;
	}
	un_next_char();
	if (len == MAX_LINE_LENGTH) {
#ifdef MMLMIF
		StrBuffT msg;
#endif

		start_error();
#ifdef MMLMIF
		SrGet(MMLKeywordTooLong, msg);
		fprintf(errput, msg);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf,mmlErrorMessage[MMLKeywordTooLong]);
		F_Printf(0, sbuf ) ;
#endif
		end_error();
		len--;
		while (true) {
			next_char();
			if (cur_type != REGULAR)
				break;
		}
		un_next_char();
	 }
	buffer[len++] = 0;
	return (len);
}

local IntT scan_name_to_buffer()
{
	IntT len;

	len = perhaps_scan_name_to_buffer();
	if (len <= 1) {
#ifdef MMLMIF
		StrBuffT msg;
#endif

		start_error();
#ifdef MMLMIF
		SrGet(MMLNullName, msg);
		fprintf(errput, msg);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf ,mmlErrorMessage[MMLNullName]);
		F_Printf(0, sbuf);
#endif
		end_error();
		buffer[0] = 255;
		buffer[1] = 0;
		len = 2;
	}
	return (len);
}


local VoidT next_cmd()
{
	IntT h, i, len;

	if (already_cmd) {
		already_cmd = false;
		return;
	}
restart:
	cur_modifier = NULL;
	next_char();
	if (cur_char == EOF) {
		cur_cmd = ENDOFINPUT;
		return;
	}

	switch (cur_type)
	{
		 case REGULAR2:
		 case REGULAR:
			cur_cmd = REGULAR_CHAR;
			reg_char = cur_char;
			return;

		 case SPACER:
			if (!paragraph_mode)
				goto restart;
			if (cur_char == '\t') {
				cur_cmd = REGULAR_CHAR;
				reg_char = '\t';
				return;
			}
			i = 0;
			while (cur_type == SPACER) {
				if (cur_char == '\t')
					break;
				if (cur_char == '\n')
					i++;
				next_char();
			}
			un_next_char();
			if (i > 1)
				cur_cmd = IMPLICITPAR;
			else
				cur_cmd = REGULAR_CHAR;
			reg_char = ' ';
			return;

		 case CHAR_DEFFED:
			start_expanding(char_defs[cur_char]);
			goto restart;

		 case STARTS_MACRO:
			len = scan_name_to_buffer();
			lowercaseify(buffer);
			h = find_hash_entry(buffer);
			if (h == MAX_HASH_SIZE)
			 {
#ifdef MMLMIF
				StrBuffT msg;
#endif

				start_error();
#ifdef MMLMIF
				SrGetF(MMLUndefinedMacro,
					      msg, STRBUFFSIZE, (StringT)"s", buffer);
				fprintf(errput, msg);
#endif
#ifdef MMLAPI
				F_Sprintf(sbuf,mmlErrorMessage[MMLUndefinedMacro],buffer);
				F_Printf(0, sbuf);
#endif
				end_error();
				i = COMMENT;	/* skip the rest of the command */
				new_hash_entry(buffer, len, i, NULL);
			} else
				i = hash[h].type;

			if (i >= FIRST_RETURNABLE) {
				cur_cmd = i;
				cur_hash = h;
				cur_modifier = hash[h].modifier;
				return;
			}
			if (i == MML || i == COMMENT)
				skip_comment();
			else if (i == INCLUDE)
				do_include();
			else if (i == MACRO_CALL)
			{
				terminate_command();
				start_expanding(hash[h].modifier);
			} else
				ifatal(IMMLIllegalTypeNextCmd);
			goto restart;

		 case ENDS_MACRO:
			cur_cmd = RIGHT_BRACE;
			return;

		 case BACKSLASH:
		 default:
			ifatal(IMMLIllegalCharType);
	 }
}

local VoidT un_next_cmd()
{
	if (already_cmd)
		ifatal(IMMLDoubleUnNextCmd);
	already_cmd = true;
}


/*
A common routine to scan away the '>' at the end of commands
*/

local VoidT terminate_command()
{
	skip_spaces();
	next_char();
	if (cur_type != ENDS_MACRO) {
#ifdef MMLMIF
		StrBuffT msg;
#endif
		StrBuffT s;
		
		StrTrunc(s);
		StrCatCharN(s, '\'', sizeof(s));
		while (cur_type != ENDS_MACRO && cur_char != EOF) {
			StrCatCharN(s, cur_char, sizeof(s));
			next_char();
		}
		StrCatCharN(s, '\'', sizeof(s));

		start_error();
#ifdef MMLMIF
		SrGetF(MMLJunkAtEnd, msg, STRBUFFSIZE, (StringT)"s", s);
		fputs(msg, errput);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf,mmlErrorMessage[MMLJunkAtEnd],s);
		F_Printf(0, sbuf);
#endif
		end_error();
	 }
}


/*
Here's how to skip past the contents of a comment.  Note that a comment
has a matching number of '<' and '>' characters.  Thus, comments nest.
*/

local VoidT skip_comment()
{
	 IntT balance = 1;
	 IntT fromline;

	 fromline = input_stack[file_level()].line_number;
	 while (balance)
	 	{
		 next_char();
		 if (cur_type == STARTS_MACRO)
			 balance++;
		 else if (cur_type == ENDS_MACRO)
			 balance--;
		 else if (cur_char == EOF)
		 	{
#ifdef MMLMIF
			 StrBuffT msg;
#endif

			 start_error();
#ifdef MMLMIF
			 SrGetF(MMLDidntFindEndComment,
				      msg, 256, (StringT)"d", fromline);
			 fprintf(errput, msg);
#endif
#ifdef MMLAPI
			 F_Sprintf(sbuf,mmlErrorMessage[MMLDidntFindEndComment],fromline);
			 F_Printf(0, sbuf);
#endif
			 end_error();
			 break;
		 	}
	 	}
}


local NumberT scan_char()
{
	 next_char();
	 if (cur_type == SPACER)
		 next_char();	/* skip ONE space */
	 return (cur_char);
}


/* Get a "-delimited string into buffer */
local IntT scan_string_to_buffer()
{
	 IntT len = 0;

	 skip_spaces();
	 next_char();
	 if (cur_char != '"')
	 	{
#ifdef MMLMIF
		 StrBuffT msg; 
#endif
		 UCharT c[2];

		 start_error();
		 c[0] = cur_char;
		 c[1] = '\0';
#ifdef MMLMIF
		 SrGetF(MMLExpectedString, msg, STRBUFFSIZE, (StringT)"s", c);
		 fprintf(errput, msg);
#endif
#ifdef MMLAPI
		 F_Sprintf(sbuf,mmlErrorMessage[MMLExpectedString],c);
		 F_Printf(0, sbuf);
#endif
		 end_error();
		 buffer[0] = 0;
		 return (0);
	 	}
	 while (len < MAX_LINE_LENGTH)
	 	{
		 next_char();
		 if (cur_char == '"')
			 break;
		 buffer[len++] = cur_char;
	 	}
	 if (len == MAX_LINE_LENGTH)
	 	{
#ifdef MMLMIF
		 StrBuffT msg;
#endif

		 start_error();
#ifdef MMLMIF
		 SrGet(MMLStringTooLong, msg);
		 fprintf(errput, msg);
#endif
#ifdef MMLAPI
		 F_Sprintf(sbuf,mmlErrorMessage[MMLStringTooLong]);
		 F_Printf(0, sbuf);
#endif
		 end_error();
		 while (true)
		 	{
			 next_char();
			 if (cur_char == '"')
				 break;
		 	}
		 len--;
	 	}
	 buffer[len++] = 0;
	 return (len);
}


/* We allow file names to be quoted or not */
local IntT scan_file_name_to_buffer()
{
	 IntT len;
	 BoolT flag;

	 skip_spaces();
	 next_char();
	 flag = (cur_char == '"');
	 un_next_char();
	 if (flag)
		 len = scan_string_to_buffer();
	 else
		 len = scan_name_to_buffer();
	 return (len);
}


/* Get a string into some calloc'd memory */
local StringT scan_kept_string()
{
	 StringT s;
	 IntT len;

	 len = scan_string_to_buffer();
	 s = make_string(buffer, len);
	 return (s);
}


/* Get a string into some calloc'd memory */
local UniqueStringT scan_unique_string()
{
	 UniqueStringT s;
	 IntT len;

	 len = scan_string_to_buffer();
	 len--;			/* skip back to NULL */
	 buffer[len++] = '\002';	/* special non-user-accessable character */
	 buffer[len++] = 0;
	 s = find_hash_entry(buffer);
	 if (s == MAX_HASH_SIZE)
		 s = new_hash_entry(buffer, len, STRING, NULL);
	 return (s);
}


local NumberT scan_number()
{
	 NumberT n;
	 BoolT negative = false;

	 skip_spaces();
	 next_char();
	 if (cur_char == '+')
		 next_char();
	 else if (cur_char == '-')
	 	{
		 next_char();
		 negative = true;
	 	}
	 if (!is_digit[cur_char])
	 	{
#ifdef MMLMIF
		 StrBuffT msg; 
#endif
		 UCharT c[2];

		 start_error();
		 c[0] = cur_char;
		 c[1] = '\0';
#ifdef MMLMIF
		 SrGetF(MMLBadDigit, msg, STRBUFFSIZE, (StringT)"s", c);
		 fprintf(errput, msg);
#endif
#ifdef MMLAPI
		 F_Sprintf(sbuf,mmlErrorMessage[MMLBadDigit],c);
		 F_Printf(0, sbuf);
#endif
		 end_error();
	 	}
	 n = cur_char - '0';
	 next_char();
	 while (is_digit[cur_char])
	 	{
		 n = n * 10 + cur_char - '0';
		 next_char();
	 	}
	 un_next_char();
	 if (negative)
		 n = -n;
	 return (n);
}


/* Expecting digits, or \x, to define a character number */
local NumberT scan_char_or_number()
{
	 NumberT n;

	 skip_spaces();
	 quick_next_char();	/* N.B.: doesn't expand backslashes */
	 if (cur_char == '\\')
	 	{
		 un_next_char();	/* put back backslash */
		 next_char();	/* get \x */
		 n = cur_char;
	 	}
	 else
	 	{
		 un_next_char();	/* put back the first digit */
		 n = scan_number();
	 	}
	 return (n);
}


local RealT scan_real()
{
	 IntT i = 0;
	 RealT r;
	 CharT c;

	 skip_spaces();
	 next_char();
	 while (is_float_digit[cur_char])
	 	{
		 buffer[i++] = cur_char;
		 next_char();
	 	}
	 un_next_char();
	 buffer[i] = 0;
#ifdef MMLAPI
	 i = F_Sscanf(buffer, (StringT)"%f%c", &r, &c);
#endif
#ifdef MMLMIF
	 i = sscanf(buffer, (StringT)"%f%c", &r, &c);
#endif
	 if (i == 0)
	 	{
#ifdef MMLMIF
		 StrBuffT msg;
#endif

		 start_error();
#ifdef MMLMIF
		 SrGetF(MMLBadRealNumber, msg, STRBUFFSIZE,
			      (StringT)"s", buffer);
		 fprintf(errput, msg);
#endif
#ifdef MMLAPI
		 F_Sprintf(sbuf,mmlErrorMessage[MMLBadRealNumber],buffer);
		 F_Printf(0, sbuf);
#endif
		 end_error();
	 	}
	 return (r);
}


local PointsT scan_points()
{
	PointsT p;
	
	p = scan_real();
	return (p);
}


/* Leaves keyword in buffer */
local IntT keyword_search(k)
KeywordRecordT *k;
{
	perhaps_scan_name_to_buffer();
	lowercaseify(buffer);
	while (k->key_name) {
		if (StrEqual(k->key_name, buffer))
		 return (k->key_val);
		k++;
	}
	return (-1);
}


local BoolT scan_boolean()
{
	IntT i;
	
	i = keyword_search(&boolean_names[0]);
	if (i < 0) {
#ifdef MMLMIF
		 StrBuffT msg;
#endif

		start_error();
#ifdef MMLMIF
		SrGetF(MMLBadBoolean, msg, STRBUFFSIZE,
			      (StringT)"s", buffer);
		fprintf(errput, msg);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf,mmlErrorMessage[MMLBadBoolean],buffer);
		F_Printf(0, sbuf);
#endif
		end_error();
	}
	return (i);
}


local UnitT scan_unit(errorflag)
BoolT errorflag;
{
	 IntT i;

	 i = keyword_search(&unit_names[0]);
	 if (i < 0)
	 	{
		 if (errorflag)
		 	{
#ifdef MMLMIF
			 StrBuffT msg;
#endif

			 start_error();
#ifdef MMLMIF
			 SrGetF(MMLBadUnit, msg, STRBUFFSIZE,
				      (StringT)"s", buffer);
			 fprintf(errput, msg);
#endif
#ifdef MMLAPI
			 F_Sprintf(sbuf,mmlErrorMessage[MMLBadUnit],buffer);
			 F_Printf(0, sbuf);
#endif
			 end_error();
		 	}
		 else
		 	{
			 start_expanding(buffer);
		 	}
	 	}
	 return (i);
}


local LrcdT scan_lrcd(ok)
LrcdT ok;
{
	 IntT i;

	 i = keyword_search(&lrcd_names[0]);
	 if (i < 0 || !(i & ok))
	 	{
#ifdef MMLMIF
		 StrBuffT msg;
#endif

		 start_error();
#ifdef MMLMIF
		 SrGetF(MMLBadlrcd, msg, STRBUFFSIZE,
			      (StringT)"s", buffer);
		 fprintf(errput, msg);
#endif
#ifdef MMLAPI
		 F_Sprintf(sbuf,mmlErrorMessage[MMLBadlrcd],buffer);
		 F_Printf(0, sbuf);
#endif
		 end_error();
	 	}
	 return (i);
}


local numberStyleT scan_style()
{
	 IntT i;

	 i = keyword_search(&style_names[0]);
	 if (i < 0)
	 	{
#ifdef MMLMIF
		 StrBuffT msg;
#endif

		 start_error();
#ifdef MMLMIF
		 SrGetF(MMLBadStyle, msg, STRBUFFSIZE,
			      (StringT)"s", buffer);
		 fprintf(errput, msg);
#endif
#ifdef MMLAPI
		 F_Sprintf(sbuf,mmlErrorMessage[MMLBadStyle],buffer);
		 F_Printf(0, sbuf);
#endif
		 end_error();
	 	}
	 return (i);
}


local VoidT scan_measure(m)
MeasureT *m;
{
	 UnitT u;

	 m->mamt = scan_real();
	 u = scan_unit(false);
	 if (u == -1)
		 u = dflt;
	 m->munit = u;
}


local FontFamilyT scan_family()
{
	 FontFamilyT f;
	 IntT len;

	 len = scan_name_to_buffer();
	 len--;			/* skip back to NULL */
	 buffer[len++] = '\001';	/* special non-user-accessable character */
	 buffer[len++] = 0;
	 f = find_hash_entry(buffer);
	 if (f == MAX_HASH_SIZE)
		 f = new_hash_entry(buffer, len, FONTFAMILY, NULL);
	 return (f);
}


#ifdef MMLMIF
local BoolT font_record_ne(FontRecordT *f1, FontRecordT *f2)
{
	 if (f1->family != f2->family
			 || f1->pts != f2->pts
			 || f1->italic != f2->italic
			 || f1->bold != f2->bold
			 || f1->underline != f2->underline
			 || f1->strike != f2->strike
			 || f1->script != f2->script
		 )
		 return (true);
	 return (false);
}
#endif


local VoidT init_font_state()
{
	 undef_font_state.family = UNDEFINED;
	 undef_font_state.pts = (RealT)FUNDEFINED;
	 undef_font_state.italic = UNDEFINED;
	 undef_font_state.bold = UNDEFINED;
	 undef_font_state.underline = UNDEFINED;
	 undef_font_state.strike = UNDEFINED;
	 undef_font_state.script = UNDEFINED;

	 def_font_state.family = new_hash_entry((StringT)"Times\001", -1, FONTFAMILY, NULL);
	 def_font_state.italic = false;
	 def_font_state.bold = false;
	 def_font_state.underline = false;
	 def_font_state.strike = false;
	 def_font_state.script = NORM;
	 def_font_state.pts = 12;
	 font_state = undef_font_state;	/* drf - 9/14/87 */
}


private VoidT fillin_font_undefineds(font_state)
FontRecordT *font_state;
{
	 if (font_state->family == undef_font_state.family)
		 font_state->family = def_font_state.family;
	 if (font_state->pts == undef_font_state.pts)
		 font_state->pts = def_font_state.pts;
	 if (font_state->italic == undef_font_state.italic)
		 font_state->italic = def_font_state.italic;
	 if (font_state->bold == undef_font_state.bold)
		 font_state->bold = def_font_state.bold;
	 if (font_state->underline == undef_font_state.underline)
		 font_state->underline = def_font_state.underline;
	 if (font_state->strike == undef_font_state.strike)
		 font_state->strike = def_font_state.strike;
	 if (font_state->script == undef_font_state.script)
		 font_state->script = def_font_state.script;
}


local FontRecordT *copy_font_state()
{
	FontRecordT *f;
	
	f = (FontRecordT *) myalloc(sizeof(FontRecordT));
	*f = font_state;
	return (f);
}


local ParRecordT *copy_par_state()
{
	ParRecordT *p;
	
	p = (ParRecordT *) myalloc(sizeof(ParRecordT));
	*p = par_state;
	return (p);
}


local VoidT init_par_state()
{
	undef_par_state.leftindent.munit = UNDEFINED;
	undef_par_state.rightindent.munit = UNDEFINED;
	undef_par_state.firstindent.munit = UNDEFINED;
	undef_par_state.spacebefore.munit = UNDEFINED;
	undef_par_state.spaceafter.munit = UNDEFINED;
	undef_par_state.leading.munit = UNDEFINED;
	undef_par_state.alignment = UNDEFINED;
	undef_par_state.autonumber = UNDEFINED;
	undef_par_state.hyphenate = UNDEFINED;
	undef_par_state.columntop = UNDEFINED;
	undef_par_state.withnext = UNDEFINED;
	undef_par_state.forcefont = true /* N.B. */ ;
	undef_par_state.parafont = undef_font_state;	/* N.B. */
	undef_par_state.tolerance = UNDEFINED;
	undef_par_state.blocksize = UNDEFINED;
	undef_par_state.numberformat = UNDEFINED;
	undef_par_state.tabstoptype = UNDEFINED;
	undef_par_state.tabstopleader = UNDEFINED;
	undef_par_state.tabstops = UNDEFINED;

	def_par_state.partag = (StringT)"Paragraph";
	def_par_state.leftindent.mamt = 0;
	def_par_state.leftindent.munit = inch;
	def_par_state.rightindent.mamt = 0;
	def_par_state.rightindent.munit = inch;
	def_par_state.firstindent.mamt = 0;
	def_par_state.firstindent.munit = inch;
	def_par_state.spacebefore.mamt = 0;
	def_par_state.spacebefore.munit = pt;
	def_par_state.spaceafter.mamt = 0;
	def_par_state.spaceafter.munit = pt;
	def_par_state.leading.mamt = 2;
	def_par_state.leading.munit = pt;
	def_par_state.alignment = LEFTRIGHT;
	def_par_state.autonumber = false;
	def_par_state.hyphenate = true;
	def_par_state.columntop = false;
	def_par_state.withnext = false;
	def_par_state.forcefont = true;
	def_par_state.parafont = def_font_state;
	def_par_state.tolerance = 2;
	def_par_state.blocksize = 1;
	def_par_state.numberformat = NOSTRING;
	def_par_state.tabstoptype = LEFT;
	def_par_state.tabstopleader = ' ';
	def_par_state.tabstops = NOSTRING;

	par_state = def_par_state;
#ifdef MMLMIF
	cur_par = new_hash_entry(par_state.partag, -1, PAR_CALL, NULL);
#endif
#ifdef MMLAPI
	cur_par = new_hash_entry(par_state.partag, -1, PAR_DEF, NULL);
#endif
	 hash[cur_par].modifier = (StringT) copy_par_state();
}


local VoidT fillin_par_undefineds()
{
	if (par_state.leftindent.munit == undef_par_state.leftindent.munit)
		par_state.leftindent = def_par_state.leftindent;
	if (par_state.rightindent.munit == undef_par_state.rightindent.munit)
		par_state.rightindent = def_par_state.rightindent;
	if (par_state.firstindent.munit == undef_par_state.firstindent.munit)
		par_state.firstindent = def_par_state.firstindent;
	if (par_state.spacebefore.munit == undef_par_state.spacebefore.munit)
		par_state.spacebefore = def_par_state.spacebefore;
	if (par_state.spaceafter.munit == undef_par_state.spaceafter.munit)
		par_state.spaceafter = def_par_state.spaceafter;
	if (par_state.leading.munit == undef_par_state.leading.munit)
		par_state.leading = def_par_state.leading;
	if (par_state.alignment == undef_par_state.alignment)
		par_state.alignment = def_par_state.alignment;
	if (par_state.autonumber == undef_par_state.autonumber)
		par_state.autonumber = def_par_state.autonumber;
	if (par_state.hyphenate == undef_par_state.hyphenate)
		par_state.hyphenate = def_par_state.hyphenate;
	if (par_state.columntop == undef_par_state.columntop)
		par_state.columntop = def_par_state.columntop;
	if (par_state.withnext == undef_par_state.withnext)
		par_state.withnext = def_par_state.withnext;
	if (par_state.forcefont == undef_par_state.forcefont)
		par_state.forcefont = def_par_state.forcefont;
	if (par_state.tolerance == undef_par_state.tolerance)
		par_state.tolerance = def_par_state.tolerance;
	if (par_state.blocksize == undef_par_state.blocksize)
		par_state.blocksize = def_par_state.blocksize;
	if (par_state.numberformat == undef_par_state.numberformat)
		par_state.numberformat = def_par_state.numberformat;
	if (par_state.tabstoptype == undef_par_state.tabstoptype)
		par_state.tabstoptype = def_par_state.tabstoptype;
	if (par_state.tabstopleader == undef_par_state.tabstopleader)
		par_state.tabstopleader = def_par_state.tabstopleader;
	if (par_state.tabstops == undef_par_state.tabstops)
		par_state.tabstops = def_par_state.tabstops;
}


local VoidT init_doc_state()
{
	pagewidth.munit = UNDEFINED;
	pageheight.munit = UNDEFINED;
	topmargin.munit = UNDEFINED;
	bottommargin.munit = UNDEFINED;
	leftmargin.munit = UNDEFINED;
	rightmargin.munit = UNDEFINED;
	columns = UNDEFINED;
	columngap.munit = UNDEFINED;
	leftheader = UNDEFINED;
	centerheader = UNDEFINED;
	rightheader = UNDEFINED;
	leftfooter = UNDEFINED;
	centerfooter = UNDEFINED;
	rightfooter = UNDEFINED;
	headerfont = undef_font_state;	/* N.B. */
	headertopmargin.munit = UNDEFINED;
	headerbottommargin.munit = UNDEFINED;
	headerleftmargin.munit = UNDEFINED;
	headerrightmargin.munit = UNDEFINED;
	headerpagenumberstyle = UNDEFINED;
	firstpageheader = UNDEFINED;
	firstpagefooter = UNDEFINED;
	doublesided = UNDEFINED;
	firstpageleft = UNDEFINED;
	firstpagenumber = UNDEFINED;
}


local VoidT init_char_output()
{
	IntT i;
	
	for (i = 0; i < 128; i++)
		char_output[i] = REG_OUTPUT;
	for (i = 128; i < 256; i++)
		char_output[i] = HEX_OUTPUT;
	for (i = 0x0; i < 0x20; i++)
		char_output[i] = NO_OUTPUT;
	char_output[4] = HS_OUTPUT;
	char_output[5] = NOHYPH_OUTPUT;
	char_output[6] = DISCHYPH_OUTPUT;
	char_output[0x7F] = NO_OUTPUT;
	char_output[0xFF] = NO_OUTPUT;
	char_output['`'] = LQ_OUTPUT;
	char_output['\''] = RQ_OUTPUT;
	char_output['\t'] = TAB_OUTPUT;
	char_output['\r'] = HR_OUTPUT;
#ifdef MMLMIF
	char_output['>'] = char_output['\\'] = BS_OUTPUT;
#endif
}


#ifdef MMLMIF
local VoidT MIFchar(PUCharT c)
{
	 switch (char_output[c])
	 	{
		 case REG_OUTPUT:
			 MIF2("%c", c);
			 break;
		 case TAB_OUTPUT:
			 MIF("\\t");
			 break;
		 case BS_OUTPUT:
			 MIF2("\\%c", c);
			 break;
		 case LQ_OUTPUT:
			 MIF("\\xD4 ");
			 break;
		 case RQ_OUTPUT:
			 MIF("\\xD5 ");
			 break;
		 case HEX_OUTPUT:
			 MIF2("\\x%x ", c);
			 break;
		 case NO_OUTPUT:
			 break;
		 default:
			 ifatal(IMMLIllegalMIFChar);
	 	}
}
#endif


#ifdef MMLMIF
local VoidT MIFlrcd(LrcdT x)
{
	switch (x)
	{
		case DECIMAL:
			MIF("Decimal");
			break;
		case LEFT:
			MIF("Left");
			break;
		case RIGHT:
			MIF("Right");
			break;
		case LEFTRIGHT:
			MIF("LeftRight");
			break;
		case CENTER:
			MIF("Center");
			break;
	}
}
#endif


#ifdef MMLMIF
local VoidT MIFboolean(BoolT b)
{
	if (b)
		MIF("Yes");
	else
		MIF("No");
}
#endif


#ifdef MMLMIF
local VoidT MIFnumber(NumberT n)
{
	MIF2("%d", n);
}
#endif


#ifdef MMLMIF
local VoidT MIFfamily(FontFamilyT f)
{
	StringT p;
	
	p = hash[f].name;
	MIF("`");
	while (*p > '\001')
		MIFchar(*p++);
	MIF("'");
}
#endif


#ifdef MMLMIF
local VoidT MIFunique_string(UniqueStringT s)
{
	StringT p;
	
	if (s == MAX_HASH_SIZE)
		p = (StringT)"\002";
	else
		p = hash[s].name;
	MIF("`");
	while (*p > '\002')
		MIFchar(*p++);
	MIF("'");
}
#endif


#ifdef MMLMIF
local VoidT MIFstyle(numberStyleT s)
{
	switch (s)
	{
		case arabic:
			MIF("Arabic");
			break;
		case lcroman:
			MIF("LCRoman");
			break;
		case ucroman:
			MIF("UCRoman");
			break;
		case lcalpha:
			MIF("LCAlpha");
			break;
		case ucalpha:
			MIF("UCAlpha");
			break;
	}
}
#endif


#ifdef MMLMIF
local VoidT MIFUnits(UnitT u)
{
	switch (u)
	{
		case inch:
			MIF("Uin");
			break;
		case cm:
			MIF("Ucm");
			break;
		case mm:
			MIF("Umm");
			break;
		case pica:
			MIF("Upica");
			break;
		case pt:
			MIF("Upt");
			break;
		default:
			ifatal(IMMLBadGlobalUnit);
	}
}
#endif


#ifdef MMLMIF
local VoidT MIFunits(UnitT u)
{
	if (u == units)
		return;

	switch (u)
	{
		case dflt:
			break;
		case inch:
			MIF("inch");
			break;
		case cm:
			MIF("cm");
			break;
		case mm:
			MIF("mm");
			break;
		case pica:
			MIF("pica");
			break;
		case pt:
			MIF("pt");
			break;
		default:
			ifatal(IMMLBadLocalUnit);
	}
}
#endif


/*
 * Avoids floats from being promoted to doubles.
 */
#ifdef MMLMIF
local VoidT MIFpoints(RealT p)
{
	MIF2("%g", p);
}
#endif


#ifdef MMLMIF
local VoidT MIFmeasure(MeasureT *m)
{
	MIFpoints(m->mamt);
	MIFunits(m->munit);
}
#endif


#ifdef MMLMIF
local VoidT do_pending(VoidT)
{
	if (pending) {
#ifdef MMLMIF
		MIF(pending);
#endif
		pending = 0;
	}
}
#endif


local VoidT nowin(s)
SmallT s;
{
	while (MIFsection < s) {
		switch (MIFsection)
		{
			case unit_section:
				MIF_unit();
				break;
			case font_section:
				MIF_font();
				break;
			case paragraph_section:
				MIF_paragraph();
				break;
			case document_section:
				MIF_document();
				break;
			case text_section:
				MIF_text();
				break;
		}
		MIFsection++;
	}
}


local VoidT MIF_unit()
{
#ifdef MMLMIF
	MIF2("<MIFFile 1.01> # Generated by %s\n", ID_LINE);
	MIF("include(mif_read.m4)\n\n");
	MIF("<Units ");
	MIFUnits(units);
	MIF(">\n\n");
#endif
}


local VoidT MIF_font()
{
#ifdef MMLMIF
	MIF("<Catalog\n");
#endif
}


local VoidT MIF_paragraph()
{
#ifdef MMLMIF
	MIF("> # end of Catalog\n\n");

	MIF("# Start of the Document section\n");
#endif
}


local VoidT MIF_document()
{
#ifdef MMLMIF
	 FontRecordT tmp_font_state;

	 pending = "<Document\n";
	 if (pagewidth.munit != UNDEFINED || pageheight.munit != UNDEFINED)
	 	{
		 do_pending();
		 if (pagewidth.munit == UNDEFINED)
			 pagewidth = def_pagewidth;
		 if (pageheight.munit == UNDEFINED)
			 pageheight = def_pageheight;
		 MIF(" <DPageSize ");
		 MIFmeasure(&pagewidth);
		 MIF(" ");
		 MIFmeasure(&pageheight);
		 MIF(">\n");
	 	}
	 if (columns != UNDEFINED ||
		 leftmargin.munit != UNDEFINED || rightmargin.munit  != UNDEFINED ||
		 topmargin.munit  != UNDEFINED || bottommargin.munit != UNDEFINED)
	 	{
		 do_pending();
		 if (leftmargin.munit == UNDEFINED)
			 leftmargin = def_leftmargin;
		 if (rightmargin.munit == UNDEFINED)
			 rightmargin = def_rightmargin;
		 if (topmargin.munit == UNDEFINED)
			 topmargin = def_topmargin;
		 if (bottommargin.munit == UNDEFINED)
			 bottommargin = def_bottommargin;
		 MIF(" <DMargins ");
		 MIFmeasure(&leftmargin);
		 MIF(" ");
		 MIFmeasure(&topmargin);
		 MIF(" ");
		 MIFmeasure(&rightmargin);
		 MIF(" ");
		 MIFmeasure(&bottommargin);
		 MIF(">\n");
	 	}
	 if (columns != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <DColumns ");
		 MIFnumber(columns);
		 MIF(">\n");
	 	}
	 if (columns != UNDEFINED || columngap.munit != UNDEFINED)
	 	{
		 do_pending();
		 if (columngap.munit == UNDEFINED)
			 columngap = def_columngap;
		 MIF(" <DColumnGap ");
		 MIFmeasure(&columngap);
		 MIF(">\n");
	 	}
	 if (firstpageheader != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <DHeadOnFirst ");
		 MIFboolean(firstpageheader);
		 MIF(">\n");
	 	}
	 if (firstpagefooter != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <DFootOnFirst ");
		 MIFboolean(firstpagefooter);
		 MIF(">\n");
	 	}
	 if (doublesided != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <DTwoSides ");
		 MIFboolean(doublesided);
		 MIF(">\n");
	 	}
	 if (firstpageleft != UNDEFINED)
	 	{
		 do_pending();
		 if (firstpageleft)
			 MIF(" <DParity FirstLeft>\n");
		 else
			 MIF(" <DParity FirstRight>\n");
	 	}
	 if (firstpagenumber != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <DStartPage ");
		 MIFnumber(firstpagenumber);
		 MIF(">\n");
	 	}
	 if (!pending)
		 MIF("> # End Document\n");

	 pending = "<Page\n <PageType MasterPage>\n";
	 if (leftheader != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <HeaderL ");
		 MIFunique_string(leftheader);
		 MIF(">\n");
	 	}
	 if (centerheader != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <HeaderC ");
		 MIFunique_string(centerheader);
		 MIF(">\n");
	 	}
	 if (rightheader != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <HeaderR ");
		 MIFunique_string(rightheader);
		 MIF(">\n");
	 	}
	 if (leftfooter != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <FooterL ");
		 MIFunique_string(leftfooter);
		 MIF(">\n");
	 	}
	 if (centerfooter != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <FooterC ");
		 MIFunique_string(centerfooter);
		 MIF(">\n");
	 	}
	 if (rightfooter != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <FooterR ");
		 MIFunique_string(rightfooter);
		 MIF(">\n");
	 	}

	 do_pending();
	 if (headerleftmargin.munit == UNDEFINED)
		 headerleftmargin = def_headerleftmargin;
	 if (headerrightmargin.munit == UNDEFINED)
		 headerrightmargin = def_headerrightmargin;
	 if (headertopmargin.munit == UNDEFINED)
		 headertopmargin = def_headertopmargin;
	 if (headerbottommargin.munit == UNDEFINED)
		 headerbottommargin = def_headerbottommargin;
	 MIF(" <HFMargins ");
	 MIFmeasure(&headerleftmargin);
	 MIF(" ");
	 MIFmeasure(&headertopmargin);
	 MIF(" ");
	 MIFmeasure(&headerrightmargin);
	 MIF(" ");
	 MIFmeasure(&headerbottommargin);
	 MIF(">\n");

	 tmp_font_state = font_state;
	 font_state = headerfont;
	 MIFfont_state = undef_font_state;	/* force output of full font spec */
	 if (font_record_ne(&font_state, &undef_font_state))
	 	{
		 do_pending();
		 MIF(" <HFFont\n");
		 MIFpartial_font();
		 MIF(" >\n");
	 	}
	 font_state = tmp_font_state;
	 if (headerpagenumberstyle != UNDEFINED)
	 	{
		 do_pending();
		 MIF(" <NumStyle ");
		 MIFstyle(headerpagenumberstyle);
		 MIF(">\n");
	 	}
	 if (!pending)
	 	{
		 MIF("> # End MasterPage\n");
		 MIF("# End of the Document section\n\n");
	 	}

	 switch_to_tmp_file();
	 MIF("<TextFlow\n");
#endif
#ifdef MMLAPI
	fillin_doc_undefineds();
	mmlCreateDocument();
	
	F_ApiSetInt(0,FV_SessionId,FP_Reformatting,False);
	
	paragraphProperties   = F_ApiGetProps(docId,insertionPoint.objId);
	mmlDeleteStableFontNameProperties(&paragraphProperties);
	
	characterProperties   = F_ApiGetTextProps(docId,&insertionPoint);
	mmlDeleteStableFontNameProperties(&characterProperties);
	
	mmlAddAllParFormats();
#endif
}


local VoidT MIF_text()
{
#ifdef MMLMIF
	MIF("> # End of TextFlow\n");
#endif
}


#ifdef MMLMIF
local VoidT MIFpartag(VoidT)
{
	MIF("  <PgfTag `");
	MIF2("%s", par_state.partag);
	MIF("'>\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFleftindent(VoidT)
{
	MIF("  <PgfLIndent ");
	MIFmeasure(&par_state.leftindent);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFrightindent(VoidT)
{
	MIF("  <PgfRIndent ");
	MIFmeasure(&par_state.rightindent);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFfirstindent(VoidT)
{
	MIF("  <PgfFIndent ");
	MIFmeasure(&par_state.firstindent);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFspacebefore(VoidT)
{
	MIF("  <PgfSpBefore ");
	MIFmeasure(&par_state.spacebefore);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFspaceafter(VoidT)
{
	MIF("  <PgfSpAfter ");
	MIFmeasure(&par_state.spaceafter);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFleading(VoidT)
{
	MIF("  <PgfLeading ");
	MIFmeasure(&par_state.leading);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFalignment(VoidT)
{
	MIF("  <PgfAlignment ");
	MIFlrcd(par_state.alignment);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFautonumber(VoidT)
{
	MIF("  <PgfAutoNum ");
	MIFboolean(par_state.autonumber);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFhyphenate(VoidT)
{
	MIF("  <PgfHyphenate ");
	MIFboolean(par_state.hyphenate);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFcolumntop(VoidT)
{
	MIF("  <PgfColumnTop ");
	MIFboolean(par_state.columntop);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFwithnext(VoidT)
{
	MIF("  <PgfWithNext ");
	MIFboolean(par_state.withnext);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFforcefont(VoidT)
{
	MIF("  <PgfForceFont ");
	MIFboolean(par_state.forcefont);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFtolerance(VoidT)
{
	MIF("  <PgfTolerance ");
	MIFnumber(par_state.tolerance);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFblocksize(VoidT)
{
	MIF("  <PgfBlockSize ");
	MIFnumber(par_state.blocksize);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFnumberformat(VoidT)
{
	MIF("  <PgfNumFormat ");
	MIFunique_string(par_state.numberformat);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFxfamily(VoidT)
{
	MIF("    <FFamily ");
	MIFfamily(font_state.family);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFpts(VoidT)
{
	MIF("    <FSize ");
	MIFpoints(font_state.pts);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFitalic(VoidT)
{
	MIF("    <FItalic ");
	MIFboolean(font_state.italic);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFbold(VoidT)
{
	MIF("    <FBold ");
	MIFboolean(font_state.bold);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFstrike(VoidT)
{
	MIF("    <FStrike ");
	MIFboolean(font_state.strike);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFunderline(VoidT)
{
	MIF("    <FUnderline ");
	MIFboolean(font_state.underline);
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFscript(VoidT)
{
	MIF("    <FDY ");
	switch (font_state.script)
	{
		case SUB:
			MIF("5");
			break;
		case SUP:
			MIF("-5");
			break;
		default:
			MIF("0");
			break;
	}
	MIF(">\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFfont(VoidT)
{
	MIF("   <Font\n");
	MIFxfamily();
	MIFpts();
	MIFitalic();
	MIFbold();
	MIFstrike();
	MIFunderline();
	MIFscript();
	MIF("   > # end of Font\n");
}
#endif


#ifdef MMLMIF
local VoidT MIFtabstops(VoidT)
{
	 NumberT n;
	 StringT s;
	 MeasureT m;
	 IntT typ, ldr;

	 if (par_state.tabstops == NOSTRING)
	    {
		 n = 0;
		 s = NULL;
	    }
	 else
	 	{
		 s = hash[par_state.tabstops].name;
		 n = (*s++) - 1;
	 	}
	 MIF("  <PgfNumTabs ");
	 MIFnumber(n);
	 MIF(">\n");
	 while (n--)
	 	{
		 sscanf(s, (StringT)"%d%d%f%d", &typ, &ldr, &m.mamt, &m.munit);
		 while (*s >= ' ')
			 s++;
		 s++;
		 MIF("  <TabStop\n");
		 MIF("   <TSX ");
		 MIFmeasure(&m);
		 MIF(">\n");
		 MIF("   <TSType ");
		 MIFlrcd(typ);
		 MIF(">\n");
		 MIF("   <TSLeader ");
		 MIFnumber(ldr);
		 MIF(">\n");
		 MIF("  > # end TabStop\n");
	 	}
}
#endif


local VoidT init_MIF_state()
{
	MIFpar_state = par_state;
	MIFfont_state = font_state;
	MIF_par = cur_par;
}


#ifdef MMLMIF
local VoidT MIF_begin_par(VoidT)
{
	 MIF(" <Para\n");
	 if (cur_par != MIF_par)
	 	{
		 MIFpartag();
		 MIF_par = cur_par;
		 MIFpar_state = *(ParRecordT *) hash[MIF_par].modifier;
	 	}

	 if (MIFpar_state.forcefont == true)
		 MIFfont_state = MIFpar_state.parafont;

	 if (par_state.alignment != undef_par_state.alignment)
		 if (MIFpar_state.alignment != par_state.alignment)
			 MIFalignment();
	 if (par_state.autonumber != undef_par_state.autonumber)
		 if (MIFpar_state.autonumber != par_state.autonumber)
			 MIFautonumber();
	 if (par_state.hyphenate != undef_par_state.hyphenate)
		 if (MIFpar_state.hyphenate != par_state.hyphenate)
			 MIFhyphenate();
	 if (par_state.columntop != undef_par_state.columntop)
		 if (MIFpar_state.columntop != par_state.columntop)
			 MIFcolumntop();
	 if (par_state.withnext != undef_par_state.withnext)
		 if (MIFpar_state.withnext != par_state.withnext)
			 MIFwithnext();
	 if (par_state.forcefont != undef_par_state.forcefont)
		 if (MIFpar_state.forcefont != par_state.forcefont)
			 MIFforcefont();
	 if (par_state.tolerance != undef_par_state.tolerance)
		 if (MIFpar_state.tolerance != par_state.tolerance)
			 MIFtolerance();
	 if (par_state.blocksize != undef_par_state.blocksize)
		 if (MIFpar_state.blocksize != par_state.blocksize)
			 MIFblocksize();
	 if (par_state.numberformat != undef_par_state.numberformat)
		 if (MIFpar_state.numberformat != par_state.numberformat)
			 MIFnumberformat();
	 if (par_state.tabstops != undef_par_state.tabstops)
		 if (MIFpar_state.tabstops != par_state.tabstops)
			 MIFtabstops();

	 if (par_state.leftindent.munit != undef_par_state.leftindent.munit)
		 if (measure_ne(&MIFpar_state.leftindent, &par_state.leftindent))
			 MIFleftindent();
	 if (par_state.rightindent.munit != undef_par_state.rightindent.munit)
		 if (measure_ne(&MIFpar_state.rightindent, &par_state.rightindent))
			 MIFrightindent();
	 if (par_state.firstindent.munit != undef_par_state.firstindent.munit)
		 if (measure_ne(&MIFpar_state.firstindent, &par_state.firstindent))
			 MIFfirstindent();
	 if (par_state.spacebefore.munit != undef_par_state.spacebefore.munit)
		 if (measure_ne(&MIFpar_state.spacebefore, &par_state.spacebefore))
			 MIFspacebefore();
	 if (par_state.spaceafter.munit != undef_par_state.spaceafter.munit)
		 if (measure_ne(&MIFpar_state.spaceafter, &par_state.spaceafter))
			 MIFspaceafter();
	 if (par_state.leading.munit != undef_par_state.leading.munit)
		 if (measure_ne(&MIFpar_state.leading, &par_state.leading))
			 MIFleading();

	 MIFpar_state = par_state;
}
#endif


#ifdef MMLMIF
local VoidT MIF_end_par(VoidT)
{
	MIF(" > # end Para\n");
}
#endif


#ifdef MMLMIF
local VoidT MIF_begin_paraline(VoidT)
{
	MIF("  <ParaLine\n");
	MIFpartial_font();
}
#endif


#ifdef MMLMIF
local VoidT MIFpartial_font(VoidT)
{
	 if (font_record_ne(&font_state, &undef_font_state))
		 if (font_record_ne(&MIFfont_state, &font_state))
		 	{
			 MIF("   <Font\n");
			 if (font_state.family != undef_font_state.family)
				 if (MIFfont_state.family != font_state.family)
					 MIFxfamily();
			 if (font_state.pts != undef_font_state.pts)
				 if (MIFfont_state.pts != font_state.pts)
					 MIFpts();
			 if (font_state.italic != undef_font_state.italic)
				 if (MIFfont_state.italic != font_state.italic)
					 MIFitalic();
			 if (font_state.bold != undef_font_state.bold)
				 if (MIFfont_state.bold != font_state.bold)
					 MIFbold();
			 if (font_state.strike != undef_font_state.strike)
				 if (MIFfont_state.strike != font_state.strike)
					 MIFstrike();
			 if (font_state.underline != undef_font_state.underline)
				 if (MIFfont_state.underline != font_state.underline)
					 MIFunderline();
			 if (font_state.script != undef_font_state.script)
				 if (MIFfont_state.script != font_state.script)
					 MIFscript();
			 MIF("   > # end of Font\n");
			 MIFfont_state = font_state;
		 	}
}
#endif


#ifdef MMLMIF
local VoidT MIF_end_paraline(VoidT)
{
	MIF("  > # End ParaLine\n");
}
#endif


/* The predefine macros */
local VoidT do_predefines()
{
	 start_expanding((StringT)"\
<!DefineMacro Tab \"<Character 9>\">\
<!DefineMacro HardReturn \"<Character 13>\">\
<!DefineMacro HardSpace \"<Character 4>\">\
<!DefineMacro NoHyphen \"<Character 5>\">\
<!DefineMacro DiscHyphen \"<Character 6>\">\
<!DefineMacro Bullet \"<Character 165>\">\
<!DefineMacro Cent \"<Character 162>\">\
<!DefineMacro Pound \"<Character 163>\">\
<!DefineMacro Yen \"<Character 180>\">\
<!DefineMacro EnDash \"<Character 208>\">\
<!DefineMacro EmDash \"<Character 209>\">\
<!DefineMacro Dagger \"<Character 160>\">\
<!DefineMacro DoubleDagger \"<Character 224>\">\
");
}


#ifdef MMLMIF
local VoidT init_tmp_file(VoidT)
{
	 StringT tmpdir, home;
	IntT pid;
	
	home   = FMuserhomedir;
	tmpdir = FMtmpdir; 
	pid = FMpid; 
	tmp_file = NULL;
	if (!StrIsEmpty(tmpdir)) {
		sprintf(tmp_name, (StringT)"%s/mmltmp.%d", tmpdir, pid);
		tmp_file = fopen(tmp_name, (StringT)"w");
	}
	if (tmp_file == NULL) {
		sprintf(tmp_name, (StringT)"/tmp/mmltmp.%d", pid);
		tmp_file = fopen(tmp_name, (StringT)"w");
	}
	if (tmp_file == NULL && home) {
		sprintf(tmp_name, (StringT)"%s/mmltmp.%d", home, pid);
		tmp_file = fopen(tmp_name, (StringT)"w");
	}
	if (tmp_file == NULL) {
		sprintf(tmp_name, (StringT)"mmltmp.%d", pid);
		tmp_file = fopen(tmp_name, (StringT)"w");
	}
	if (tmp_file == NULL)
		fatal(MMLCantOpenTmpFile);
	tmp_file_exists = true;
}
#endif


#ifdef MMLMIF
local VoidT switch_to_tmp_file(VoidT)
{
	output = tmp_file;
}
#endif


#ifdef MMLMIF
local VoidT concat_tmp_file(VoidT)
{
	IntT c;
	
	fclose(tmp_file);
	tmp_file = fopen(tmp_name, (StringT)"r");
	if (tmp_file == NULL)
		ifatal(IMMLCantReopenTmpFile);
	while ((c = fgetc(tmp_file)) != EOF)
		fputc(c, real_output);
	fclose(tmp_file);
	unlink(tmp_name);
	tmp_file_exists = false;
}
#endif


#ifdef MMLMIF
local VoidT look_for_uilanguage(IntT argc, StringT argv)
{
	IntT i;
	
	i = 1;
	for (i = 1; i < argc; i++) {
		if (argv[i][0] != '-')
			continue;
		if (argv[i][1] == 'L') {
			UILanguage = CopyString((StringT)&(argv[i][2]));
			break;
		}
	}
	if (StrIsEmpty(UILanguage))
		UILanguage = NativeString("usenglish");
}
#endif


#ifdef MMLMIF
local VoidT read_args(IntT argc, StringT argv)
{
	 StringT s;
	 IntT len;
	 I_options[0] = NullString;
	 while (--argc > 0 && (*++argv)[0] == '-')
		 for (s = argv[0] + 1; *s; s++)
			 switch (*s)
			 	{
				 case 'I':
					 len = 0;
					 while (*++s)
						 buffer[len++] = *s;
					 --s;	/* helps exit "for" loop */
					 if (len == 0)
						 break;	/* silently allowed */
					 if (buffer[len - 1] != '/')
						 buffer[len++] = '/';
					 buffer[len++] = 0;
					 I_options[cur_I_options++] = (StringT)
						 make_string(buffer, len);
					 if (cur_I_options == MAX_I_OPTIONS)
						 fatal(MMLTooManyIOptions);
					 break;
				 case 'L':
					 while (*++s)
						 ;
					 --s;	/* helps exit "for" loop */
					 break;
				 default:
					 	{
#ifdef MMLMIF
						 StrBuffT msg; 
#endif
						 UCharT c[2];

						 c[0] = *s;
						 c[1] = '\0';
#ifdef MMLMIF
						 SrGetF(MMLBadOption,
							      msg, STRBUFFSIZE, (StringT)"ss", myname, c);
#endif
#ifdef MMLAPI
						 F_Sprintf(sbuf,mmlErrorMessage[MMLBadOption],
								 myname,c);
						 F_Printf(0, sbuf);
#endif
						 argc = -1;
					 	}
			 	}
	 if (argc == 1 || argc == 2)
	 	{
		 if (start_inputting(*argv))
		 	{
#ifdef MMLMIF
			 StrBuffT msg;
			 SrGetF(MMLCantFindFile, msg, STRBUFFSIZE,
				      (StringT)"ss", myname, *argv);
			 fprintf(errput, (StringT)"%s\n", msg);
			 if (tmp_file_exists) {
				 unlink(tmp_name);
			 }
			 exit(1);
#endif
#ifdef MMLAPI
			 F_Sprintf(sbuf,mmlErrorMessage[MMLCantFindFile],*argv);
			 F_Printf(0, sbuf);
			 F_ApiReturnValue(0);
			 F_ApiBailOut();
			 F_Exit(1);
#endif
		 	}
		 input_depth = 0; /* do not read from stdin after end of input file */
		 argc--;
		 argv++;
	 	}
	 if (argc == 1)
	 	{
		 if (expand_file_name(*argv))
			 output = NULL;
		 else
			 output = fopen(file_name, (StringT)"w");
		 if (output == NULL)
		 	{
#ifdef MMLMIF
			 StrBuffT msg;
			 SrGetF(MMLCantWriteFile, msg, STRBUFFSIZE,
				      (StringT)"ss", myname, *argv);
			 fprintf(errput, (StringT)"%s\n", msg);
			 if (tmp_file_exists) {
				 unlink(tmp_name);
			 }
			 exit(1);
#endif
#ifdef MMLAPI
			 F_Sprintf(sbuf,mmlErrorMessage[MMLCantWriteFile],*argv);
			 F_Printf(0, sbuf); 
			 F_ApiReturnValue(0);
			 F_ApiBailOut();
			 F_Exit(1);
#endif
		 	}
		 argc--;
		 argv++;
	 	}
	 if (argc != 0)
	 	{
#ifdef MMLMIF
		 StrBuffT msg;
		 SrGetF(MMLUsage, msg, STRBUFFSIZE, (StringT)"s", myname);
		 fprintf(errput, (StringT)"%s\n", msg);
		 if (tmp_file_exists) {
			 unlink(tmp_name);
		 }
		 exit(1);
#endif
#ifdef MMLAPI
		 F_Sprintf(sbuf,mmlErrorMessage[MMLUsage]);
		 F_Printf(0, sbuf);
		 F_ApiReturnValue(0);
		 F_ApiBailOut();
		 F_Exit(1);
#endif
	 	}
	 real_output = output;
}
#endif


/* Routines for complex commands */
local VoidT do_macro_define()
{
	IntT macro_name;
	StringT definition;
	IntT len;
	
	len = scan_name_to_buffer();
	lowercaseify(buffer);
	macro_name = new_hash_entry(buffer, len, MACRO_CALL, NULL);
	definition = scan_kept_string();
	hash[macro_name].modifier = definition;
}


local VoidT do_char_define()
{
	StringT def;
	NumberT c;
	
	c = scan_char();
	def = scan_kept_string();
	char_type[c] = CHAR_DEFFED;
	char_defs[c] = def;
}


local VoidT do_alias()
{
	IntT alias_to, alias_from;
	IntT len;
	
	len = scan_name_to_buffer();
	lowercaseify(buffer);
	alias_to = new_hash_entry(buffer, len, COMMENT, NULL);
	scan_name_to_buffer();
	lowercaseify(buffer);
	alias_from = find_hash_entry(buffer);
	hash[alias_to].type = hash[alias_from].type;
	hash[alias_to].modifier = hash[alias_from].modifier;
}


local VoidT do_limited_commands()
{
	limited++;
	while (running) {
		next_cmd();
		if (cur_cmd == RIGHT_BRACE)
			break;

		if (!(cur_cmd == REGULAR_CHAR && char_type[reg_char] == SPACER))
			do_cur_cmd();

	}
	limited--;
}


local VoidT now_defining(h)
IntT h;
{
	if (current_definee >= 0 && h >= 0) {
#ifdef MMLMIF
		StrBuffT msg;
#endif

		start_error();
#ifdef MMLMIF
		SrGetF(MMLNotFinishedDefining, msg, STRBUFFSIZE,
					(StringT)"s", hash[current_definee].name);
		fprintf(errput, msg);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf,mmlErrorMessage[MMLNotFinishedDefining],
				hash[current_definee].name);
		F_Printf(0, sbuf);
#endif
		end_error();
		hash[current_definee].type = NOP;
		/* since new definition might refer to old incomplete one! */
	}
	current_definee = h;
}


local VoidT do_par_define()
{
	StringT s;
	IntT len;
	IntT h;
	
	len = scan_name_to_buffer();
	s = make_string(buffer, len);
	lowercaseify(buffer);
#ifdef MMLMIF
	h = new_hash_entry(buffer, len, PAR_CALL, NULL);
#endif
#ifdef MMLAPI
	h = new_hash_entry(buffer, len, PAR_DEF, NULL);
#endif
	now_defining(h);
	par_state.partag = s;
	do_limited_commands();
	fillin_font_undefineds(&font_state);
	fillin_par_undefineds();
	par_state.parafont = font_state;
	hash[h].modifier = (StringT) copy_par_state();
	now_defining(-1);

#ifdef MMLMIF

	MIF(" <Pgf\n");
	MIFpartag();
	MIFleftindent();
	MIFrightindent();
	MIFfirstindent();
	MIFspacebefore();
	MIFspaceafter();
	MIFleading();
	MIFalignment();
	MIFautonumber();
	MIFhyphenate();
	MIFcolumntop();
	MIFwithnext();
	MIFforcefont();
	MIFfont();
	MIFtolerance();
	MIFblocksize();
	MIFnumberformat();
	MIFtabstops();
	MIF(" > # end of Pgf\n");

#endif

	MIFpar_state = par_state;
	MIFfont_state = font_state;
}


local VoidT do_par_undefined()
{
	StringT s;
	IntT len;
	IntT h;
	ParRecordT tmp_par_state;

	len = scan_name_to_buffer();
	s = make_string(buffer, len);
	lowercaseify(buffer);
#ifdef MMLMIF
	h = new_hash_entry(buffer, len, PAR_CALL, NULL);
#endif
#ifdef MMLAPI
	h = new_hash_entry(buffer, len, PAR_REF, NULL);
#endif
	now_defining(h);
	tmp_par_state = par_state;
#ifdef MMLMIF
	par_state = undef_par_state;
	par_state.partag = s;
#endif
#ifdef MMLAPI
	par_state = def_par_state;
	par_state.partag = s;
#endif
	hash[h].modifier = (StringT) copy_par_state();
	now_defining(-1);
	par_state = tmp_par_state;
}


local VoidT do_font_define()
{
	IntT len;
	IntT h;
	
	len = scan_name_to_buffer();
	lowercaseify(buffer);
	h = new_hash_entry(buffer, len, FONT_CALL, NULL);
	now_defining(h);
	do_limited_commands();
	fillin_font_undefineds(&font_state);
	hash[h].modifier = (StringT) copy_font_state();
	now_defining(-1);
}


local VoidT do_headerfont()
{
	do_limited_commands();
	fillin_font_undefineds(&font_state);
	headerfont = font_state;
}


local VoidT chk_in_tabstops()
{
#ifdef MMLMIF
	StrBuffT msg;
#endif

	if (in_tabstops)
		return;
	start_error();
#ifdef MMLMIF
	SrGet(MMLTabStops, msg);
	fputs(msg, errput);
#endif
#ifdef MMLAPI
	F_Sprintf(sbuf,mmlErrorMessage[MMLTabStops]);
	F_Printf(0, sbuf);
#endif
	end_error();
	in_tabstops = true;
	tabptr = &tabbuffer[1];
}


local VoidT do_tabstops()
{
	UniqueStringT s;
	IntT len;
	
	in_tabstops = true;
	tabbuffer[0] = 1;	/* number of tab stops + 1 */
	tabptr = &tabbuffer[1];
	do_limited_commands();
	in_tabstops = false;
	*tabptr++ = '\003';
	*tabptr++ = 0;
	len = tabptr - &tabbuffer[0];
	if (len >= MAX_TAB_SPEC)
		fatal(MMLTabBufferOverflow);
	s = find_hash_entry(tabbuffer);
	if (s == MAX_HASH_SIZE)
		s = new_hash_entry(tabbuffer, len, TABBUF, NULL);
	par_state.tabstops = s;
}


local VoidT do_tabstop()
{
	MeasureT m;
	
	tabbuffer[0]++;  /* increment number-of-tab-stops counter */
	scan_measure(&m);

#ifdef MMLMIF
	sprintf(tabptr, (StringT)" %d %d %f %d ", par_state.tabstoptype,
			par_state.tabstopleader, m.mamt, m.munit);
#endif
#ifdef MMLAPI
	F_Sprintf(tabptr, (StringT)"%ld %ld %f %ld", par_state.tabstoptype,
			par_state.tabstopleader, m.mamt, m.munit);
#endif

	while (*tabptr)
		tabptr++;
	*tabptr++ = '\003';
	if (tabptr >= &tabbuffer[MAX_TAB_SPEC])
		fatal(MMLTabBufferOverflow);
}


/*
The main command loop
*/


local VoidT do_cur_cmd()
{
	switch (cur_cmd)
	{
		case NOP:
			break;
		case DEFINEMACRO:
			do_macro_define();
			break;
		case DEFINECHAR:
			do_char_define();
			break;
		case ALIAS:
			do_alias();
			break;
		case UNITS:
			units = scan_unit(true);
			break;
		case FAMILY:
			font_cmd;
			font_state.family = scan_family();
			break;
		case OBLIQUE:
		case ITALIC:
			font_cmd;
			font_state.italic = true;
			break;
		case NOOBLIQUE:
		case NOITALIC:
			font_cmd;
			font_state.italic = false;
			break;
		case BOLD:
			font_cmd;
			font_state.bold = true;
			break;
		case NOBOLD:
			font_cmd;
			font_state.bold = false;
			break;
		case UNDERLINE:
			font_cmd;
			font_state.underline = true;
			break;
		case NOUNDERLINE:
			font_cmd;
			font_state.underline = false;
			break;
		case STRIKE:
			font_cmd;
			font_state.strike = true;
			break;
		case NOSTRIKE:
			font_cmd;
			font_state.strike = false;
			break;
		case NORMAL:
			font_cmd;
			font_state.script = NORM;
			break;
		case SUPERSCRIPT:
			font_cmd;
			font_state.script = SUP;
			break;
		case SUBSCRIPT:
			font_cmd;
			font_state.script = SUB;
			break;
		case PLAIN:
			font_cmd;
			font_state.italic = false;
			font_state.bold = false;
			font_state.underline = false;
			font_state.strike = false;
			font_state.script = NORM;
			break;
		case PTS:
			font_cmd;
			font_state.pts = scan_points();
			break;
		case DEFINEFONT:
			font_command;
			do_font_define();
			return;
		case PAR:
			terminate_command();
			/* fall through... */
		case IMPLICITPAR:
			finish_par();
			return;
		case LEFTINDENT:
			par_cmd;
			scan_measure(&par_state.leftindent);
			break;
		case RIGHTINDENT:
			par_cmd;
			scan_measure(&par_state.rightindent);
			break;
		case FIRSTINDENT:
			par_cmd;
			scan_measure(&par_state.firstindent);
			break;
		case SPACEBEFORE:
			par_cmd;
			scan_measure(&par_state.spacebefore);
			break;
		case SPACEAFTER:
			par_cmd;
			scan_measure(&par_state.spaceafter);
			break;
		case LEADING:
			par_cmd;
			scan_measure(&par_state.leading);
			break;
		case ALIGNMENT:
			par_cmd;
			par_state.alignment =
			 scan_lrcd(LEFT + RIGHT + CENTER + LEFTRIGHT);
			break;
		case AUTONUMBER:
			par_cmd;
			par_state.autonumber = scan_boolean();
			break;
		case NUMBERFORMAT:
			par_cmd;
			par_state.numberformat = scan_unique_string();
			break;
		case HYPHENATE:
			par_cmd;
			par_state.hyphenate = scan_boolean();
			break;
		case COLUMNTOP:
			par_cmd;
			par_state.columntop = scan_boolean();
			break;
		case WITHNEXT:
			par_cmd;
			par_state.withnext = scan_boolean();
			break;
		case FORCEFONT:
			par_cmd;
			par_state.forcefont = scan_boolean();
			break;
		case TOLERANCE:
			par_cmd;
			par_state.tolerance = scan_number();
			break;
		case BLOCKSIZE:
			par_cmd;
			par_state.blocksize = scan_number();
			break;
		case TABSTOPTYPE:
			par_cmd;
			chk_in_tabstops();
			par_state.tabstoptype =
			 scan_lrcd(LEFT + RIGHT + CENTER + DECIMAL);
			break;
		case TABSTOPLEADER:
			par_cmd;
			chk_in_tabstops();
			par_state.tabstopleader = scan_char();
			break;
		case TABSTOP:
			par_cmd;
			chk_in_tabstops();
			do_tabstop();
			break;
		case TABSTOPS:
			par_cmd;
			do_tabstops();
			return;
		case DEFINEPAR:
			par_command;
			do_par_define();
			return;
		case DEFINETAG:
			par_command;
			do_par_undefined();
			break;
		case PAGEWIDTH:
			doc_command;
			scan_measure(&pagewidth);
			break;
		case PAGEHEIGHT:
			doc_command;
			scan_measure(&pageheight);
			break;
		case TOPMARGIN:
			doc_command;
			scan_measure(&topmargin);
			break;
		case BOTTOMMARGIN:
			doc_command;
			scan_measure(&bottommargin);
			break;
		case LEFTMARGIN:
			doc_command;
			scan_measure(&leftmargin);
			break;
		case RIGHTMARGIN:
			doc_command;
			scan_measure(&rightmargin);
			break;
		case COLUMNS:
			doc_command;
			columns = scan_number();
			break;
		case COLUMNGAP:
			doc_command;
			scan_measure(&columngap);
			break;
		case LEFTHEADER:
			doc_command;
			leftheader = scan_unique_string();
			break;
		case CENTERHEADER:
			doc_command;
			centerheader = scan_unique_string();
			break;
		case RIGHTHEADER:
			doc_command;
			rightheader = scan_unique_string();
			break;
		case LEFTFOOTER:
			doc_command;
			leftfooter = scan_unique_string();
			break;
		case CENTERFOOTER:
			doc_command;
			centerfooter = scan_unique_string();
			break;
		case RIGHTFOOTER:
			doc_command;
			rightfooter = scan_unique_string();
			break;
		case HEADERFONT:
			doc_command;
			do_headerfont();
			return;
		case HEADERTOPMARGIN:
			doc_command;
			scan_measure(&headertopmargin);
			break;
		case HEADERBOTTOMMARGIN:
			doc_command;
			scan_measure(&headerbottommargin);
			break;
		case HEADERLEFTMARGIN:
			doc_command;
			scan_measure(&headerleftmargin);
			break;
		case HEADERRIGHTMARGIN:
			doc_command;
			scan_measure(&headerrightmargin);
			break;
		case HEADERPAGENUMBERSTYLE:
			doc_command;
			headerpagenumberstyle = scan_style();
			break;
		case FIRSTPAGEHEADER:
			doc_command;
			firstpageheader = scan_boolean();
			break;
		case FIRSTPAGEFOOTER:
			doc_command;
			firstpagefooter = scan_boolean();
			break;
		case DOUBLESIDED:
			doc_command;
			doublesided = scan_boolean();
			break;
		case FIRSTPAGELEFT:
			doc_command;
			firstpageleft = scan_boolean();
			break;
		case FIRSTPAGENUMBER:
			doc_command;
			firstpagenumber = scan_number();
			break;
		case RIGHT_BRACE:
			{
#ifdef MMLMIF
				StrBuffT msg;
#endif

				start_error();
#ifdef MMLMIF
				SrGet(MMLUnexpectedRB, msg);
				fprintf(errput, msg);
#endif
#ifdef MMLAPI
				F_Sprintf(sbuf,mmlErrorMessage[MMLUnexpectedRB]);
				F_Printf(0, sbuf);
#endif
				end_error();
				return;
			 }

		case REGULAR_CHAR:
			goto got_reg_char;
		case CHARACTER:
			reg_char = scan_char_or_number();
			terminate_command();
			goto got_reg_char;
			
		case AFRAME:
			text_command;
			start_line();  /* Might be first thing in paragraph */
#ifdef MMLMIF
			do_aframe_cmd();
#endif
#ifdef MMLAPI
			mmlAppendAnchoredFrame();
#endif
			return;

		case MESSAGE:
			{
#ifdef MMLMIF
				StrBuffT msg;
#endif

				scan_string_to_buffer();
#ifdef MMLMIF
				SrGetF(MMLMSG, msg, STRBUFFSIZE, (StringT)"ss",
					      myname, buffer);
				fprintf(errput, (StringT)"%s\n", msg);
#endif
#ifdef MMLAPI
				F_Sprintf(sbuf,mmlErrorMessage[MMLMSG],myname,buffer);
				F_Printf(0, sbuf);
#endif
				break;
			}

		case FONT_CALL:
			font_cmd;
			font_state = *(FontRecordT *) cur_modifier;
			break;
#ifdef MMLMIF
		case PAR_CALL:
#endif
#ifdef MMLAPI
		case PAR_DEF:
		case PAR_REF:
#endif
			par_cmd;
			par_state = *(ParRecordT *) cur_modifier;
			if (par_state.forcefont)
				font_state = par_state.parafont;
			cur_par = cur_hash;
			break;
		case ENDOFINPUT:
			finish_par();
			end_command;
			running = false;
#ifdef MMLMIF
			done_aframes();
			concat_tmp_file();
			fclose(output);
#endif
			return;
#ifdef MMLMIF
		case MARKER:
			text_command;
			start_line();  /* Might be first thing in paragraph */
			do_marker_cmd();
			return;
#endif 
#ifdef MMLAPI
		case MARKER:
			text_command;
			start_line();  /* Might be first thing in paragraph */
			do_marker_cmd();
			return;
		case MTYPE:
			markerType = scan_number();
			break;
		case MTEXT:
			scan_marker_text_to_buffer();
			break;
#endif 
	}
	terminate_command();	/* clear '>' */
	return;

got_reg_char:			 /* Most of our time will be spent down here */
#ifdef MMLMIF
	text_command;
	start_string();
	do {
		if (++line_pos > BELL_POS && reg_char == ' ')
			new_line();
		MIFchar(reg_char);
		if (reg_char == 13)
			new_line();
		next_cmd();
	}
	while (cur_cmd == REGULAR_CHAR);
	un_next_cmd();
#endif
#ifdef MMLAPI
	text_command;
	start_string();
	
	charBuffIndex = 0;

	do {
		switch (char_output[reg_char])
		{
			case REG_OUTPUT:
			case HEX_OUTPUT:
				charBuff[charBuffIndex++] = reg_char;
				break;
			case TAB_OUTPUT:
				charBuff[charBuffIndex++] = 0x08;
				break;
			case LQ_OUTPUT:
				charBuff[charBuffIndex++] = 0xD4;
				break;
			case RQ_OUTPUT:
				charBuff[charBuffIndex++] = 0xD5;
				break;
			case HR_OUTPUT:
				charBuff[charBuffIndex++] = 0x09;
				break;
			case HS_OUTPUT:
				charBuff[charBuffIndex++] = 0x11;
				break;
			case NOHYPH_OUTPUT:
				charBuff[charBuffIndex++] = 0x05;
				break;
			case DISCHYPH_OUTPUT:
				charBuff[charBuffIndex++] = 0x04;
				break;
			case NO_OUTPUT:
			case BS_OUTPUT:
				break;
			default:
				ifatal(IMMLIllegalMIFChar);
		}

		if (charBuffIndex == MAXCHARBUFFINDEX) {
			charBuff[charBuffIndex] = '\0';
			mmlAppendText(charBuff);
			charBuffIndex = 0;
		}
		next_cmd();
	} while (cur_cmd == REGULAR_CHAR);
	un_next_cmd();

	charBuff[charBuffIndex] = '\0';
	mmlAppendText(charBuff);
	charBuffIndex = 0;
#endif
}


local VoidT start_string()
{
	start_line();
	if (!string_mode) {
		string_mode = true;
#ifdef MMLMIF
		MIF("   <String `");
#endif
	}
}


private VoidT finish_string()
{
	if (string_mode) {
		string_mode = false;
#ifdef MMLMIF
		MIF("'>\n");
#endif
	}
}


local VoidT start_line()
{
	start_par();
	if (!line_mode) {
		line_mode = true;
#ifdef MMLMIF
		MIF_begin_paraline();
#endif
		line_pos = 0;
	}
}


local VoidT finish_line()
{
	if (line_mode){
		finish_string();
		line_mode = false;
#ifdef MMLMIF
		MIF_end_paraline();
#endif
	}
}


#ifdef MMLMIF
local VoidT new_line(VoidT)
{
	finish_line();
	start_string();
}
#endif


private VoidT start_par()
{
	if (!paragraph_mode) {
		paragraph_mode = true;
		if (par_state.forcefont)
			font_state = par_state.parafont;
#ifdef MMLMIF
		MIF_begin_par();
#endif
#ifdef MMLAPI
		mmlAppendParagraph();
#endif
	}
}


local VoidT finish_par()
{
	if (paragraph_mode) {
		finish_line();
#ifdef MMLMIF
		if (font_record_ne(&font_state, &undef_font_state)) {
			if (font_record_ne(&MIFfont_state, &font_state)) {
				/* force update of font state */
				MIF_begin_paraline();
				MIF_end_paraline();
			}
		}
#endif
		paragraph_mode = false;
#ifdef MMLMIF
		MIF_end_par();
#endif
	}
}


#ifdef MMLMIF
local VoidT do_aframe_cmd(VoidT)
{
	IntT balance = 1;
	
	start_par();
	finish_string();
	if (aframe_id == 0)
		fputs( (StringT)"<AFrames\n", real_output);
	aframe_id++;
	fputs((StringT)" <Frame\n", real_output);
	fprintf(real_output, (StringT) "  <ID %d>\n", aframe_id);
	fputs( (StringT)"  <FrameType Below>\n", real_output);
	fputs((StringT)"  ", real_output);
	loop {
		next_char();
		if (cur_type == STARTS_MACRO) {
			balance++;
			fputc('<', real_output);
		} 
		else if (cur_type == ENDS_MACRO)
		{
			balance--;
			if (balance == 0)
				break;
			fputc('>', real_output);
		}
		else if (cur_char == EOF)
			break;
		else
			fputc(cur_char, real_output);
	}
	fputs((StringT)"\n > # end of Frame \n", real_output);
	MIF2("   <AFrame %d>\n", aframe_id);
}
#endif


#ifdef MMLMIF
local VoidT done_aframes(VoidT)
{
	 if (aframe_id > 0)
		 fputs((StringT)"> # end of AFrames\n", real_output);
}
#endif


local VoidT do_marker_cmd()
{
#ifdef MMLMIF
	IntT balance = 1;

	start_par();
	finish_string();
	MIF(" <Marker\n");
	while (1) {
		next_char();
		if (cur_type == STARTS_MACRO) {
			balance++;
			MIF("<");
		}
		else if (cur_type == ENDS_MACRO)
		{
			balance--;
			if (balance == 0)
				break;
			MIF(">");
		}
		else if (cur_type == REGULAR2)
		{
			MIF2("\\%c",cur_char);
		}
		else if (cur_char == EOF)
			break;
		else
			MIF2("%c",cur_char);
	}
	MIF("\n > # end of Marker \n");
#endif

#ifdef MMLAPI
	do_limited_commands();
	mmlAppendMarker(markerType,buffer);
#endif
}


/* To Do:
	 dynamic hash table
*/


#ifdef MMLAPI
private VoidT mmlInitialize(filename)
StringT filename;
{
	myname = (StringT)"mmlimport";
	
	initialize();
	
	cur_I_options = 0;
	
	I_options[cur_I_options++] = (StringT)"";
	
	mmlFilenameToPath(filename, &I_options[cur_I_options++]);
	
	if (mmlPathOfFminit(&I_options[cur_I_options]))
		++cur_I_options;

	if (mmlPathOfTilda(&I_options[cur_I_options]))
		++cur_I_options;

	emptyStringHashIndex = new_hash_entry(" ", 2, STRING, NULL);
}
#endif


#ifdef MMLAPI
private VoidT mmlRun(inputFileName)
StringT inputFileName;
{
#ifdef MMLMIF
	start_inputting(inputFileName);
	input_depth = 0; /* do not read from stdin after end of input file */
#endif
#ifdef MMLAPI
	new_start_inputting(inputFileName);
#endif

	do_predefines();
	
	running = true;
	
	while (running) {
		next_cmd();
		do_cur_cmd();
	}

	close_all_input_files();		/* If this hasn't been done, do it now */

	F_ApiDelete(docId,firstParagraphId);

	if (!firstpageheader || !firstpagefooter) {
		F_ObjHandleT firstBodyPageId =F_ApiGetId(FV_SessionId,docId,FP_FirstBodyPageInDoc);
		F_ApiSetInt(docId,firstBodyPageId,FP_PageBackground,FV_BGD_OTHER);
		F_ApiSetString(docId,firstBodyPageId,FP_MasterPage,"firstPage");
	}

	F_ApiSetInt(0,FV_SessionId,FP_Reformatting,True);
	F_ApiReformat(docId);
}
#endif


#ifdef MMLAPI
local IntT scan_marker_text_to_buffer()
{
	IntT len = 0;
	
	skip_spaces();
	next_char();
	if (cur_char != '`') {
#ifdef MMLMIF
		StrBuffT msg; 
#endif
		UCharT c[2];
		
		start_error();
		c[0] = cur_char;
		c[1] = '\0';
#ifdef MMLMIF
		SrGetF(MMLExpectedString, msg, STRBUFFSIZE, (StringT)"s", c);
		fprintf(errput, msg);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf,mmlErrorMessage[MMLExpectedString],c);
		F_Printf(0, sbuf);
#endif
		end_error();
		buffer[0] = 0;
		return (0);
	}
	while (len < MAX_LINE_LENGTH) {
		next_char();
		if (cur_char == '\'')
			break;
		buffer[len++] = cur_char;
	}
	if (len == MAX_LINE_LENGTH) {
#ifdef MMLMIF
		StrBuffT msg;
#endif

		start_error();
#ifdef MMLMIF
		SrGet(MMLStringTooLong, msg);
		fprintf(errput, msg);
#endif
#ifdef MMLAPI
		F_Sprintf(sbuf,mmlErrorMessage[MMLStringTooLong]);
		F_Printf(0, sbuf);
#endif
		end_error();
		while (true) {
			next_char();
			if (cur_char == '\'')
				break;
		}
		len--;
	}
	buffer[len++] = 0;
	return (len);
}
#endif


