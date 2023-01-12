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
#include "fm_imml.h"

/* --------------------------------------------------------------------------+
 | Returns a linear dimension specified as a MetricT equivalent to the linear|
 | dimension measure specified as a MeasureT. If the MeasureT's unit of      |
 | measurement is default, (measure.munit == dflt), the defualt unit of      |
 | measurement is obtained from the global variable units.                   |
 |                                                                           |
 | size_in_inch in * 72 pt/in * 65536 metric/pt = size_in_metric             |
 | size_in_cm cm * .3937 cm/in * 72 pt/in * 65536 metric/pt = size_in_metric |
 | size_in_mm mm * .03937 cm/in * 72 pt/in * 65536 metric/pt=size_in_metric  |
 | size_in_pica pc * 12 pt/pc * 65536 metric/pt = size_in_metric             |
 | size_in_point pt * 65536 metric/pt = size_in_metric                       |
 +-------------------------------------------------------------------------- */

MetricT mmlMeasureToMetric(measure)
MeasureT	measure;
{
	switch(measure.munit == dflt ? units : measure.munit) {
	case inch:
		return (MetricT)(measure.mamt * 1.00000 * 72.0 * 65536.0);
	case cm:
		return (MetricT)(measure.mamt * 0.39370 * 72.0 * 65536.0);
	case mm:
		return (MetricT)(measure.mamt * 0.03937 * 72.0 * 65536.0);
	case pica:
		return (MetricT)(measure.mamt * 12.0 * 65536.0);
	default:
	case pt:
		return (MetricT)(measure.mamt * 65536.0);
	}
}

/* --------------------------------------------------------------------------+
 | Returns a linear dimension specified as a MeasureT equivalent to the      |
 | linear dimension metric specified as a MetricT. Points were arbitrarily   |
 | selected as the MeasureT's unit of measurement.                           |
 |                                                                           |
 | size_in_metric metric * 1/65536 pt/metric = size_in_pt                    |
 +-------------------------------------------------------------------------- */

MeasureT mmlMetricToMeasure(metric)
MetricT	metric;
{
	MeasureT measure;

	measure.munit = pt;
	measure.mamt  = (RealT)(metric / 65536.0);

	return measure;
}

/* --------------------------------------------------------------------------+
 | If italic == True, returns the index of the string "Italic" in the        |
 | session's list of font angle names. If italic == False, returns the index |
 | of the word "Regular" in the session's list of font angle names.          |
 | The indexes are constant during a session, and are therefore cached for   |
 | efficiency.                                                               |
 +-------------------------------------------------------------------------- */

IntT mmlMapFontAngle(italic)
BoolT	italic;
{
	static IntT		firstCall = True;
	static IntT		indexItalic;
	static IntT		indexRegular;

	if (firstCall) {

		F_StringsT	angleNames;

		angleNames   = F_ApiGetStrings(0,FV_SessionId,FP_FontAngleNames);

		indexItalic  = mmlIndexInStrings(angleNames,"Italic");
		indexRegular = mmlIndexInStrings(angleNames,"Regular");

		firstCall    = False;
	}

	return italic ? indexItalic : indexRegular;
}


/* --------------------------------------------------------------------------+
 | Returns False if index is index of the string "Regular" in the session's  |
 | list of font angle names. Otherwise returns True. Thus all angles other   |
 | than "Regular" are mapped to italic. The index of the word "Regular" is   |
 | constant during a session, and is therefore cached for efficiency.        |
 +-------------------------------------------------------------------------- */

BoolT mmlUnMapFontAngle(index)
IntT	index;
{
	static IntT		firstCall = True;
	static IntT		indexRegular;

	if (firstCall) {

		F_StringsT	angleNames;

		angleNames   = F_ApiGetStrings(0,FV_SessionId,FP_FontAngleNames);

		indexRegular = mmlIndexInStrings(angleNames,"Regular");

		firstCall    = False;
	}

	return index != indexRegular;
}

/* --------------------------------------------------------------------------+
 | If bold == True, returns the index of the string "Bold" in the            |
 | session's list of font angle names. If bold == False, returns the index   |
 | of the word "Regular" in the session's list of font angle names.          |
 | The indexes are constant during a session, and are therefore cached for   |
 | efficiency.                                                               |
 +-------------------------------------------------------------------------- */

IntT mmlMapFontWeight(bold)
BoolT	bold;
{
	static IntT		firstCall = True;
	static IntT		indexBold;
	static IntT		indexRegular;

	if (firstCall) {

		F_StringsT	weightNames;

		weightNames  = F_ApiGetStrings(0,FV_SessionId,FP_FontWeightNames);

		indexBold    = mmlIndexInStrings(weightNames,"Bold");
		indexRegular = mmlIndexInStrings(weightNames,"Regular");

		firstCall    = False;
	}

	return bold ? indexBold : indexRegular;
}


/* --------------------------------------------------------------------------+
 | Returns False if index is index of the string "Regular" in the session's  |
 | list of font weight names. Otherwise returns True. Thus all weights other |
 | than "Regular" are mapped to bold. The index of the word "Regular" is     |
 | constant during a session, and is therefore cached for efficiency.        |
 +-------------------------------------------------------------------------- */

BoolT mmlUnMapFontWeight(index)
IntT	index;
{
	static IntT		firstCall = True;
	static IntT		indexRegular;

	if (firstCall) {

		F_StringsT	weightNames;

		weightNames  = F_ApiGetStrings(0,FV_SessionId,FP_FontWeightNames);

		indexRegular = mmlIndexInStrings(weightNames,"Regular");

		firstCall    = False;
	}

	return index != indexRegular;
}

/* --------------------------------------------------------------------------+
 | family is the index of a font family name in the global hash table hash.  |
 | The string that represents the font family name is stored in              |
 | hash[family].name.  mmlMapFontFamily returns the index in the session's   |
 | list of font family names of the string stored in hash[family].name.      |
 |                                                                           |
 | The indexes are constant during a session. Therefore, the index of the    |
 | most recently requested font family name is cached for efficiency.        |
 +-------------------------------------------------------------------------- */

IntT mmlMapFontFamily(family)
IntT	family;
{
	static	IntT	firstCall = True;

	static	IntT	cachedFamily;
	static	IntT	cachedIndexFamily;

	IntT	indexFamily;

	if (firstCall || family != cachedFamily) {

		F_StringsT	familyNames;

		familyNames = F_ApiGetStrings(0,FV_SessionId,FP_FontFamilyNames);

		indexFamily = mmlIndexInStrings(familyNames, hash[family].name);

		cachedFamily		= family;
		cachedIndexFamily	= indexFamily;

		firstCall = False;

	} else {

		indexFamily = cachedIndexFamily;
	}

	return indexFamily;
}


/* --------------------------------------------------------------------------+
 | family is the index of a font family name in the session's list of font   |
 | family names. mmlUnMapFontFamily obtains the string representation of the |
 | font family name from the session's list of font family names and returns |
 | the index of this string in the global hash table hash. If the font family|
 | does not exist in the hash table, it is added to the hash table.          |
 |                                                                           |
 | The indexes are constant during a session. Therefore, the index of the    |
 | most recently requested font family name is cached for efficiency.        |
 +-------------------------------------------------------------------------- */

IntT mmlUnMapFontFamily(family)
IntT	family;
{
	static	IntT	firstCall = True;

	static	IntT	cachedFamily;
	static	IntT	cachedIndexFamily;

	IntT	indexFamily;

	if (firstCall || family != cachedFamily) {

		F_StringsT	familyNames;
		StringT		familyName;
		IntT		familyNameLength;
		StringT		hashName;
		IntT		hashNameLength;

		familyNames      = F_ApiGetStrings(0,FV_SessionId,FP_FontFamilyNames);
		familyName       = familyNames.val[family];
		familyNameLength = F_StrLen(familyName);

		hashNameLength   = familyNameLength + 1;
		hashName = myalloc(hashNameLength+1);
		F_StrCpy(hashName,familyName);
		hashName[hashNameLength - 1] = '\001';
		hashName[hashNameLength]     = '\0';

		indexFamily=new_hash_entry(hashName,hashNameLength+1,FONTFAMILY,NULL);

		myfree(hashName);

		cachedFamily		= family;
		cachedIndexFamily	= indexFamily;

		firstCall = False;

	} else {

		indexFamily = cachedIndexFamily;
	}

	return indexFamily;
}

/* --------------------------------------------------------------------------+
 | Returns the index of the string string in the array of strings strings.   |
 | A fatal error occurs if string is not in strings.                         |
 | Equality is tested with mmlStrEqualIgnoreType.                            |
 +-------------------------------------------------------------------------- */

IntT mmlIndexInStrings(strings,string)
F_StringsT	strings;
StringT		string;
{
	UIntT	index; 

	for (index = 0; 
		 index < strings.len && 
		 !mmlStrEqualIgnoreType((strings.val)[index], string);
		 index++);

	mmlAssertFatal(index<strings.len,MML_STRING_NOT_IN_LIST);

	return index;
}

/* --------------------------------------------------------------------------+
 | Returns True if the prefix of str1 which does not contain characters      |
 | '\000' - '\003' is equal to the prefix of str2 which does not contain     |
 | characters '\000' - '\003'. This sense of equality is used when comparing |
 | strings to entries in the global hash table hash. hash appends one of the |
 | characters '\000', '\001', '\002', or '\003' to some strings to give them |
 | a type. This idea is that characters '\000' - '\003' cannot be entered    |
 | from the keyboard.                                                        |
 +-------------------------------------------------------------------------- */

BoolT mmlStrEqualIgnoreType(str1,str2)
StringT	str1;
StringT	str2;
{
	BoolT prefixesAreEqual = True;

	while (prefixesAreEqual && *str1 > '\003' && *str2 > '\003') {
		prefixesAreEqual = (*str1++ == *str2++);
	}

	return prefixesAreEqual;
}

/* --------------------------------------------------------------------------+
 | tabString specifies an array of tab stops in the string representation    |
 | used in the global hash table hash. mmlTabStringToFTabs returns the       |
 | F_TabsT representation of this array of tab stops.                        |
 | The F_TabsT representation is used by API calls.                          |
 +-------------------------------------------------------------------------- */

F_TabsT *mmlTabStringToFTabs(tabString)
StringT tabString;
{
	F_TabsT  *tabStruct;
	F_TabT   *tabArray;

	IntT     numberOfTabs;

	IntT     typeOfTab;
	IntT     leaderChar;
	MeasureT tabLocation;

	UCharT   *s  ;
	IntT     i;

	if (tabString == NULL) {
		numberOfTabs = 0;
	} else {
		numberOfTabs = tabString[0] - 1;
	}

	tabStruct = (F_TabsT *)myalloc(sizeof(F_TabsT));

	if (numberOfTabs > 0) {
		tabArray  = (F_TabT  *)myalloc(numberOfTabs * sizeof(F_TabT));
	}

	tabStruct->len = numberOfTabs;
	tabStruct->val = tabArray;

	s = tabString + 1;

	for (i=0; i<numberOfTabs; i++) {

		F_Sscanf(s,(StringT) "%d%d%f%d", 
			   &typeOfTab, &leaderChar, &tabLocation.mamt, &tabLocation.munit);

		while (*s++ != '\003');

		switch (typeOfTab) {
		case LEFT:
			tabArray[i].type = FV_TAB_LEFT;
			break;
		case RIGHT:
			tabArray[i].type = FV_TAB_RIGHT;
			break;
		case CENTER:
			tabArray[i].type = FV_TAB_CENTER;
			break;
		case DECIMAL:
			tabArray[i].type = FV_TAB_DECIMAL;
			break;
		}

		tabArray[i].decimal   = '.';

		tabArray[i].x         = mmlMeasureToMetric(tabLocation);

		tabArray[i].leader    = (StringT)myalloc(2);
		tabArray[i].leader[0] = (UCharT)leaderChar;
		tabArray[i].leader[1] = '\0';
	}

	return tabStruct;
}

/* --------------------------------------------------------------------------+
 | mmlFreeFTabs frees the FTabsT structure returned by mmlTabStringToFTabs.  |
 +-------------------------------------------------------------------------- */

VoidT mmlFreeFTabs(fTabs)
F_TabsT *fTabs;
{
	F_TabT  *tabArray    = fTabs ->val;
	IntT    numberOfTabs = fTabs ->len;
	IntT    i;

	for (i=0; i<numberOfTabs; i++) {
		myfree(tabArray[i].leader);
	}

	if (numberOfTabs > 0) {
		myfree(tabArray);
	}

	myfree(fTabs);
}

/* --------------------------------------------------------------------------+
 | tabStruct specifies an array of tab stops in the FTabsT representation    |
 | used by API calls. mmlFtabsToTabString returns the string representation  |
 | of this array of tab stops. The string representation is used by the      |
 | global hash table hash. FTabsT represents the leader as a string. Only    |
 | the first character of the leader string is used by mml in the string     |
 | representation of the tab stops.                                          |
 +-------------------------------------------------------------------------- */

StringT mmlFTabsToTabString(tabStruct)
F_TabsT *tabStruct;
{
	IntT     numberOfTabs;
	F_TabT   *tabArray;

	IntT     typeOfTab;
	IntT     leaderChar;
	MeasureT tabLocation;

	StringT  tabString;

	UCharT   *s;
	IntT     i;

	numberOfTabs = tabStruct->len;
	tabArray     = tabStruct->val;

	tabString    = (StringT)myalloc(19 * numberOfTabs + 3);
	tabString[0] = numberOfTabs + 1;

	s = tabString + 1;

	for (i=0; i<numberOfTabs; i++) {

		switch (tabArray[i].type) {
		case FV_TAB_LEFT:
			typeOfTab = LEFT;
			break;
		case FV_TAB_RIGHT:
			typeOfTab = RIGHT;
			break;
		case FV_TAB_CENTER:
			typeOfTab = CENTER;
			break;
		case FV_TAB_DECIMAL:
			typeOfTab = DECIMAL;
			break;
		}

		leaderChar  = tabArray[i].leader[0];

		tabLocation = mmlMetricToMeasure(tabArray[i].x);


		F_Sprintf(s," %d %d %f %d \003", 
				typeOfTab, leaderChar, tabLocation.mamt, tabLocation.munit);

		while (*s++ != '\003');
	}

	F_Sprintf(s,"\003");

	return tabString;
}

/* --------------------------------------------------------------------------+
 | mmlHashIndex is the index of an mml paragraph autonumber format string in |
 | the global hash table hash. The actual mml paragraph autonumber format    |
 | string is stored in hash[mmlHashIndex].name unless mmlHashIndex ==        |
 | MAX_HASH_SIZE. In this case, the mml paragraph autonumber format string   |
 | is the empty string, (""). mmlMapAutoNumberString sets mifString to a     |
 | newly allocated string which contains the mif equivalent of the mml       |
 | string. The following syntax transformations are applied to convert an    |
 | mml autonumber string to a mif autonumber string.                         |
 |                                                                           |
 | "+" -> "<n+>"                                                             |
 | "#" -> "<n>"                                                              |
 | "1" -> "<n=1>"                                                            |
 |                                                                           |
 | Note that mml always uses arabic numerals for autonumbering.              |
 | The '\002', used by the hash table to type the string, is discarded.      |
 +-------------------------------------------------------------------------- */

VoidT mmlMapAutoNumberString(mmlHashIndex,mifString)
IntT	mmlHashIndex;
StringT	*mifString;
{
	if (mmlHashIndex == MAX_HASH_SIZE) {
		*mifString = (StringT)myalloc(1);
		**mifString = '\0';
	} else {
		/* Worst case expansion: "1" -> "<n=1>" (5 times as long) */
		StringT mmlString     = hash[mmlHashIndex].name;
		StringT tempMifString = (StringT)myalloc(5*F_StrLen(mmlString)+1);
		UCharT  *mmlP         = (UCharT *)mmlString;
		UCharT  *mifP         = (UCharT *)tempMifString;

		while (*mmlP != '\002') {
			if (*mmlP == '+') {
				*mifP++ = '<';
				*mifP++ = 'n';
				*mifP++ = '+';
				*mifP++ = '>';
				mmlP++;
			} else if (*mmlP == '#') {
				*mifP++ = '<';
				*mifP++ = 'n';
				*mifP++ = '>';
				mmlP++;
			} else if (*mmlP >= '0' && *mmlP <= '9') {
				*mifP++ = '<';
				*mifP++ = 'n';
				*mifP++ = '=';
				while (*mmlP >= '0' && *mmlP <= '9') {
					*mifP++ = *mmlP++;
				}
				*mifP++ = '>';
			} else {
				if        (*mmlP == '\t') {
					*mifP++ = 0x08;
				} else if (*mmlP == '`' ) {
					*mifP++ = 0xD4;
				} else if (*mmlP == '\'') {
					*mifP++ = 0xD5;
				} else {
					*mifP++ = *mmlP;
				}
				++mmlP;
			}
		}

		*mifP = '\0';

		*mifString = (StringT)myalloc(F_StrLen(tempMifString)+1);
		F_StrCpy(*mifString,tempMifString);
		myfree(tempMifString);
	}
}

/* --------------------------------------------------------------------------+
 | mifString specifies a paragraph autonumber format string in mif syntax.   |
 | mmlUnMapAutoNumberString creates a string which specifies the equivalent  |
 | mml autonumber format and adds that string to the global hash table       |
 |  hash. The index of this string in hash is returned in mmlHashIndex.      |
 |  Note that '\002' is appended to the mml string to provide the            |
 | type information used in the hash table hash. Note that "n", "a", "A",    |
 | "r", and "R" are all treated as arabic numbers, (mml does not support     |
 | alphabetic or roman numeral counters). The following translations are     |
 | performed:                                                                |
 |                                                                           |
 | "<n+>"  -> "+"                                                            |
 | "<n>"   -> "#"                                                            |
 | "<n=1>" -> "1"                                                            |
 +-------------------------------------------------------------------------- */

VoidT mmlUnMapAutoNumberString(mmlHashIndex,mifString)
IntT 	*mmlHashIndex;
StringT	mifString;
{
	StringT	mmlString = (StringT)myalloc(F_StrLen(mifString)+2);
	UCharT	*mmlP     = mmlString;
	UCharT	*mifP     = mifString;

	while (*mifP) {
		if (*mifP == '<') { /* "<n>", "<n+>", "<n=123>" */
			mifP += 2; 
			if (*mifP == '>') {
				*mmlP++ = '#';
				mifP++;
			} else if (*mifP == '+') {
				*mmlP++ = '+';
				mifP += 2;
			} else if (*mifP == '=') {
				mifP++;
				while (*mifP >= '0' && *mifP <= '9') {
					*mmlP++ = *mifP++;
				}
				mifP++;
			}
		} else {
			if        (*mifP == 0x08) {
				*mmlP++ = '\t';
			} else if (*mifP == 0xD4) {
				*mmlP++ = '`';
			} else if (*mifP == 0xD5) {
				*mmlP++ = '\'';
			} else {
				*mmlP++ = *mifP;
			}
			++mifP;
		}
	}

	*mmlP++ = '\002';
	*mmlP   = '\0';

	*mmlHashIndex = new_hash_entry(mmlString, F_StrLen(mmlString)+1,
								   STRING, NULL);
	myfree(mmlString);
}

/* --------------------------------------------------------------------------+
 | Deletes FP_FontPlatformName, FP_FontPanoseName, and FP_FontPostScriptName |
 | properties from propertyList. This prevents these properties from         |
 | overriding the FP_FontAngle, FP_FontWeight, and FP_FontFamily properties. |
 +-------------------------------------------------------------------------- */

VoidT mmlDeleteStableFontNameProperties(propertyList)
F_PropValsT *propertyList;
{
	mmlDeleteProperty(propertyList,FP_FontPlatformName);
	mmlDeleteProperty(propertyList,FP_FontPanoseName);
	mmlDeleteProperty(propertyList,FP_FontPostScriptName);
}

/* --------------------------------------------------------------------------+
 | Deletes the element with property-number specified by property from the   |
 | property-list specified by propertyList. If there is no element with      |
 | property-number property in propertyList, mmlDeleteProperty does nothing. |
 +-------------------------------------------------------------------------- */

VoidT mmlDeleteProperty(propertyList,property)
F_PropValsT	*propertyList;
IntT		property; 
{
	F_PropValT	*propertyArray		= propertyList->val;
	UIntT		numberOfProperties	= propertyList->len;
	UIntT		propertyIndex;

	propertyIndex = F_ApiGetPropIndex(propertyList,property);

	if (propertyIndex != FE_BadPropNum) {
		F_ApiDeallocatePropVal(&propertyArray[propertyIndex]);
		for (;propertyIndex + 1 < numberOfProperties; propertyIndex++) {
			propertyArray[propertyIndex] = propertyArray[propertyIndex + 1];
		}
		--numberOfProperties;
	}

	propertyList->len = numberOfProperties;
}
