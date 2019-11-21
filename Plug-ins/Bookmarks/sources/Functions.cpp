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

#include "Functions.hpp"

#include "common-config.h"

#ifdef Platform_Windows
extern "C" {
#include "strcasestr.h"
}
#else
#include <strings.h>
#endif

void VisitAllBookmarks(PDDoc doc, PDBookmark aBookmark)
{
    PDBookmark treeBookmark;
    
    DURING
    // ensure that the bookmark is valid
    if (!PDBookmarkIsValid(aBookmark)) E_RTRN_VOID;
    
    // collapse the current bookmark
    if (PDBookmarkIsOpen(aBookmark)) PDBookmarkSetOpen(aBookmark, false);
    
    // process children bookmarks
    if (PDBookmarkHasChildren(aBookmark)) {
	treeBookmark = PDBookmarkGetFirstChild(aBookmark);
	
	while (PDBookmarkIsValid(treeBookmark)) {
	    VisitAllBookmarks(doc, treeBookmark);
	    treeBookmark = PDBookmarkGetNext(treeBookmark);
	}
    }
    
    HANDLER
    END_HANDLER
}

int FixAllBookmarks(PDDoc doc, PDBookmark aBookmark, int acc)
{
    PDBookmark treeBookmark;
    PDViewDestination newDest;
    PDAction newAction;
    ASText title = ASTextNew(); // to be filled by PDBookmarkGetTitleASText()
    
    DURING
    // ensure that the bookmark is valid
    if (!PDBookmarkIsValid(aBookmark)) return acc;
    
    // Fixing actions
    PDAction action = PDBookmarkGetAction(aBookmark);
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
		PDBookmarkSetAction(aBookmark, newAction);
		PDViewDestDestroy(dest);
		PDActionDestroy(action);
		acc++;
	    }
	}
    }
    
    // Fixing flags for TOC-related bookmarks
    PDBookmarkGetTitleASText(aBookmark, title);
    if (!ASTextIsEmpty(title)) {
	ASUTF16Val *u8 = ASTextGetUnicodeCopy(title, kUTF8);
	if (strcasestr((const char *)u8, "CONTENTS") ||
	    strcasestr((const char *)u8, "Inhalt")) // German "TOC"
	{
	    PDBookmarkSetFlags(aBookmark, 0x2); /* bold font */
	    acc++;
	}
	ASfree((void *)u8);
    }
    ASTextDestroy(title);
    
    // process children bookmarks
    if (PDBookmarkHasChildren(aBookmark)) {
	treeBookmark = PDBookmarkGetFirstChild(aBookmark);
	
	while (PDBookmarkIsValid(treeBookmark)) {
	    acc = FixAllBookmarks(doc, treeBookmark, acc);
	    treeBookmark = PDBookmarkGetNext(treeBookmark);
	}
    }
    
    HANDLER
    if (PDActionIsValid(newAction)) PDActionDestroy(newAction);
    if (PDViewDestIsValid(newDest)) PDViewDestDestroy(newDest);
    END_HANDLER
    
    return acc;
}

int CapitalizeAllBookmarks(PDDoc doc, PDBookmark b, int acc)
{
    PDBookmark treeBookmark;
    PDViewDestination newDest;
    PDAction newAction;
    ASText oldTitle = ASTextNew(); // to be filled by PDBookmarkGetTitleASText()
    
    DURING
    // ensure that the bookmark is valid
    if (!PDBookmarkIsValid(b)) return acc;
    
    // change bookmark title
    PDBookmarkGetTitleASText(b, oldTitle);
    if (!ASTextIsEmpty(oldTitle)) {
	// (const char *)str is now available
	ASUTF16Val *u8 = ASTextGetUnicodeCopy(oldTitle, kUTF8);
	// AVAlertNote((const char*) str);
	char *str = (char *) u8;
	size_t len = strlen((const char*)str);
	
	// 1st round: all letters to small cases
	for (int i = 0; i < len; ++i) {
	    // capitalize the current letter and turn off the flag
	    if (str[i] >= 'A' && str[i] <= 'z') {
		str[i] = tolower((const char) str[i]);
	    }
	}
	
	// A flag to decide if the current letter should be capitalized
	// initially it's always true;
	bool flag = true;
	bool strong_flag = false;
	bool exception = false;
	
	// 2nd round: selective capitalization
	for (int i = 0; i < len; ++i) {
	    // capitalize the current letter and turn off the flag
	    if (str[i] >= 'A' && str[i] <= 'z') {
		// calculate exceptions
		if (0 != i &&
		    ((str[i] == 'o' && str[i+1] == 'v' && str[i+2] == 'e' &&
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
		
		if (flag || strong_flag) {
		    if (!exception) {
			str[i] = toupper((const char) str[i]);
		    }
		    /* Exception 2: capitalize all roman numerals & abbrevs */
		    if ((str[i] == 'I' && str[i+1] == 'i') ||
			(str[i] == 'I' && str[i+1] == 'v') ||
			(str[i] == 'G' && str[i+1] == 'c' && str[i+2] == 'h' &&
			 str[i+3] == ' ') ||
			false) {
			strong_flag = true; // effective until next space
		    } else {
			flag = false;
		    }
		}
		exception = false;
	    }
	    
	    if (' ' == str[i]) {
		flag = true;
		strong_flag = false;
	    }
	}
	// AVAlertNote((const char*) str);
	
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

