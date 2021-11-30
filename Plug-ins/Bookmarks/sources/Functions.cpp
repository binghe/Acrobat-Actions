//
//  Functions.cpp
//  Bookmarks
//
//  Created by Chun Tian on 21/11/19.
//
//

// Acrobat Headers.
#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif

#ifdef WIN_PLATFORM
extern "C" {
#include "strcasestr.h"
}
#else
#include <strings.h>
#endif

#include <cstring>
#include <cstdio>

// VS2015 doesn't support this well
// #include <regex>

#include "Functions.hpp"

void CollapseAllBookmarks(PDDoc doc, PDBookmark b)
{
    PDBookmark treeBookmark;
    
DURING
    // ensure that the bookmark is valid
    if (!PDBookmarkIsValid(b)) E_RTRN_VOID;
    
    // collapse the current bookmark
    if (PDBookmarkIsOpen(b)) PDBookmarkSetOpen(b, false);
    
    // process children bookmarks
    if (PDBookmarkHasChildren(b)) {
    treeBookmark = PDBookmarkGetFirstChild(b);
    
    while (PDBookmarkIsValid(treeBookmark)) {
        CollapseAllBookmarks(doc, treeBookmark);
        treeBookmark = PDBookmarkGetNext(treeBookmark);
    }
    }

HANDLER
END_HANDLER
}

// Fix the FitType of all bookmarks plus changing "Contents" to Bold font.
int FixAllBookmarks(PDDoc doc, PDBookmark b, int acc)
{
    PDBookmark treeBookmark;
    PDViewDestination newDest;
    PDAction newAction;
    ASText title = ASTextNew(); // to be filled by PDBookmarkGetTitleASText()

DURING
    // ensure that the bookmark is valid
    if (!PDBookmarkIsValid(b)) {
#if defined(WIN_PLATFORM) && defined(_DEBUG)
	DO_RETURN(acc);
#else
	return acc;
#endif
    }

    // Fixing actions
    PDAction action = PDBookmarkGetAction(b);
    if (PDActionIsValid(action)) {
	PDViewDestination dest = PDActionGetDest(action);
	if (PDViewDestIsValid(dest)) {
	    ASInt32 pageNum;
	    ASAtom fitType, targetFitType = ASAtomFromString("XYZ");
	    ASFixedRect destRect;
	    ASFixed zoom;
	    PDViewDestGetAttr(dest, &pageNum, &fitType, &destRect, &zoom);
	    if (fitType != targetFitType || zoom != PDViewDestNULL) {
		PDPage page = PDDocAcquirePage(doc, pageNum);
		newDest =
		PDViewDestCreate(doc,
				 page,	    /* := pageNum */
				 targetFitType,   /* XYZ */
				 &destRect,
				 PDViewDestNULL,  /* when FitType is XYZ */
				 0);		    /* unused */
		newAction = PDActionNewFromDest(doc, newDest, doc);
		PDBookmarkSetAction(b, newAction);
		PDViewDestDestroy(dest);
		PDActionDestroy(action);
		acc++;
	    }
	}
    }
    
    // Fixing flags for TOC-related bookmarks
    PDBookmarkGetTitleASText(b, title);
    if (!ASTextIsEmpty(title)) {
	ASUTF16Val *u8 = ASTextGetUnicodeCopy(title, kUTF8);
	if (strcasestr((const char *)u8, "CONTENTS") ||
	    strcasestr((const char *)u8, "Inhalt")) // German "TOC"
	{
            ASInt32 flags = PDBookmarkGetFlags(b);
            // AVAlertNote("Found a TOC");
	    PDBookmarkSetFlags(b, flags | (ASInt32)2); /* + bold font */
	    acc++;
	}
	ASfree((void *)u8);
    }
    ASTextDestroy(title);

    // process children bookmarks
    if (PDBookmarkHasChildren(b)) {
	treeBookmark = PDBookmarkGetFirstChild(b);
	
	while (PDBookmarkIsValid(treeBookmark)) {
	    acc = FixAllBookmarks(doc, treeBookmark, acc);
	    treeBookmark = PDBookmarkGetNext(treeBookmark);
	}
    }

HANDLER
    if (PDActionIsValid(newAction)) {
        PDActionDestroy(newAction);
    }
    if (PDViewDestIsValid(newDest)) {
        PDViewDestDestroy(newDest);
    }
END_HANDLER
    return acc;
}

bool is_roman(char c) {
    switch (c) {
	case 'i':
	case 'I':
	case 'v':
	case 'V':
	case 'x':
	case 'X':
	    return true;
	default:
	    return false;
    }
}

bool is_stop(char c) {
    return (c == ' ' && c == '.');
}

int CapitalizeAllBookmarks(PDDoc doc, PDBookmark b, int acc)
{
    PDBookmark treeBookmark;
    ASText oldTitle = ASTextNew(); // to be filled by PDBookmarkGetTitleASText()
    
DURING
    // ensure that the bookmark is valid
    if (!PDBookmarkIsValid(b)) {
#if defined(WIN_PLATFORM) && defined(_DEBUG)
	DO_RETURN(acc);
#else
	return acc;
#endif
    }

    // change bookmark title
    PDBookmarkGetTitleASText(b, oldTitle);
    if (!ASTextIsEmpty(oldTitle)) {
	// (const char *)str is now available
	ASUTF16Val *u8 = ASTextGetUnicodeCopy(oldTitle, kUTF8);
	// AVAlertNote((const char*) str);
	char *str = (char *) u8;
	size_t len = strlen((const char*)str);
	
	// 1st round: all letters to small cases
	for (size_t i = 0; i < len; ++i) {
	    // capitalize the current letter and turn off the flag
	    if (str[i] >= 'A' && str[i] <= 'z') {
		str[i] = tolower((const char) str[i]);
	    }
	}
	
	// A flag to decide if the current letter should be capitalized
	// initially it's always true:
	bool weak_flag = true;
	// Another flag to decide if the next letter should be capitalized:
	bool strong_flag = false;
	bool exception = false;
	bool new_sentence = true;

	// 2nd round: selective capitalization
	for (size_t i = 0; i < len; ++i) {
	    // capitalize the current letter and turn off the flag
	    if (str[i] >= 'A' && str[i] <= 'z') {
		// calculate exceptions
		if (!new_sentence &&
		    (('o' == str[i] && str[i+1] == 'v' && str[i+2] == 'e' &&
		      str[i+3] == 'r' && str[i+4] == ' ') ||
		     (str[i] == 'a' && str[i+1] == 'n' && str[i+2] == 'd' &&
		      str[i+3] == ' ') ||
		     (str[i] == 'f' && str[i+1] == 'o' && str[i+2] == 'r' &&
		      str[i+3] == ' ') ||
		     (str[i] == 't' && str[i+1] == 'h' && str[i+2] == 'e' &&
		      str[i+3] == ' ') ||
		     (str[i] == 'i' && str[i+1] == 'n' && str[i+2] == ' ') ||
		     (str[i] == 'o' && str[i+1] == 'n' && str[i+2] == ' ') ||
		     (str[i] == 'o' && str[i+1] == 'f' && str[i+2] == ' ') ||
		     (str[i] == 'a' && str[i+1] == 't' && str[i+2] == ' ') ||
		     (str[i] == 'a' && str[i+1] == 'n' && str[i+2] == ' ') ||
		     (str[i] == 'a' && str[i+1] == ' ') ||
		     false)) {
			exception = true; // used only once below, then reset
		    }

		if (weak_flag || strong_flag) {
		    // Exception 2: capitalize all roman numerals & abbrevs
		    if ((is_roman(str[i]) && is_stop(str[i+1])) ||
			(is_roman(str[i]) && is_roman(str[i+1]) && is_stop(str[i+2])) ||
			(is_roman(str[i]) && is_roman(str[i+1]) && is_roman(str[i+2]) &&
			 is_stop(str[i+3])) ||
			(is_roman(str[i]) && is_roman(str[i+1]) && is_roman(str[i+2]) &&
			 is_roman(str[i+3]) && is_stop(str[i+4])) ||
			(str[i] == 'G' && str[i+1] == 'c' && str[i+2] == 'h' &&
			 str[i+3] == ' ') || false) {
			strong_flag = true; // effective until next space
		    } else {
			weak_flag = false;
		    }
		    if (!exception) {
			str[i] = toupper((const char) str[i]);
		    }
		}
		exception = false;
	    }
	    
	    // capitalize next letter after a space (in general)
	    if (' ' == str[i]) {
		weak_flag = true;
		strong_flag = false;
	    } else if ('.' == str[i]) {
		new_sentence = true;
	    } else {
		new_sentence = false;
	    }
	}

	ASText newTitle = ASTextFromUnicode(u8, kUTF8);
	ASfree((void *)u8);
	if (!ASTextEqual(oldTitle, newTitle)) {
	    PDBookmarkSetTitleASText(b, newTitle);
	    ++acc;
	}
	ASTextDestroy(newTitle);
    }
    ASTextDestroy(oldTitle);
    
    // process children bookmarks
    if (PDBookmarkHasChildren(b)) {
	treeBookmark = PDBookmarkGetFirstChild(b);
	
	while (PDBookmarkIsValid(treeBookmark)) {
	    acc = CapitalizeAllBookmarks(doc, treeBookmark, acc);
	    treeBookmark = PDBookmarkGetNext(treeBookmark);
	}
    }
    
HANDLER
END_HANDLER
    return acc;
}

int FixAllTextAnnotations(PDDoc doc)
{
    PDPage page;
    ASInt32 i, j;
    PDAnnot annot;
    char setbuf[200];
    int count = 0;

    // Iterate through the PDF document page by page
    for (i = 0; i < PDDocGetNumPages(doc); i++) {
        // Get each page within the document
        page = PDDocAcquirePage(doc, i);

        // Get each annotation on the page
        for (j = 0; j < PDPageGetNumAnnots(page); j++) {
            // Get a specific annotation
            annot = PDPageGetAnnot(page, j);
            if (PDAnnotIsValid(annot)) {
                // Determine if the annotation is a Highlight annotation
                if (PDAnnotGetSubtype(annot) == ASAtomFromString("Highlight")) {
                    // Create a character pointer to store the annotation's text
                    char *annBuf;
                    ASInt32 bufSize = PDTextAnnotGetContents(annot, NULL, 0) +1;

                    // Allocate the size of bufSize to the character pointer
                    annBuf = (char*)ASmalloc((os_size_t)bufSize);

                    // Populate annBuf with the annotation's text
                    PDTextAnnotGetContents(annot, annBuf, bufSize);

                    // Compare the contents of annBuf with a string
                    if (strcmp(annBuf, "This is initial text") == 0) {
                        // Modify the annotation's text
                        sprintf (setbuf, "This is the new text for the annotation.");
                        PDTextAnnotSetContents (annot, setbuf, (ASInt32)strlen(setbuf));
                        count ++;
                    }
                }
            }
        }
    }
    return count;
}
