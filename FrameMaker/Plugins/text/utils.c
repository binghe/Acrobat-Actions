/********************************************************************/
/*                                                                  */
/* ADOBE SYSTEMS INCORPORATED                                       */
/* Copyright 1986 - 2005 Adobe Systems Incorporated                 */
/* All Rights Reserved                                              */
/*                                                                  */
/* NOTICE:  Adobe permits you to use, modify, and distribute this   */
/* file in accordance with the terms of the Adobe license agreement */
/* accompanying it.  If you have received this file from a source   */
/* other than Adobe, then your use, modification, or distribution   */
/* of it requires the prior written permission of Adobe.            */
/*                                                                  */
/********************************************************************/

/*
 * Program Name:
 *	    text                         
 *                                                                      
 *********************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fmemory.h"
#include "fstrings.h"
#include "utils.h"

/***************************************************************
 * Create a string from an F_TextItemsT structure.
 ****************************************************************/
StringT CreateStringFromTextItems(F_TextItemsT textItems)
{
	StringT s1 = NULL, s2 = NULL;
	UIntT i = 0, j = 0;
	BoolT GOTSTRING = False;

	for(i = 0; i < textItems.len; i++)
	{
		if(textItems.val[i].dataType == FTI_String)
		{
			s1 = F_StrCopyString((StringT)textItems.val[i].u.sdata);
			GOTSTRING = True;
			j = i;
			break;
		}
	}

	if(GOTSTRING == False)
		return(NULL);
	else
	{
		for(i = j + 1; i < textItems.len; i++) {
			if(textItems.val[i].dataType == FTI_String)
			{
  				s2 = F_StrCopyString((StringT)textItems.val[i].u.sdata);
  				s1 = (StringT)F_Realloc(s1, F_StrLen(s1)+F_StrLen(s2) +1, NO_DSE);
  				F_StrCat((StringT)s1,(StringT)s2);
				if(s2 != NULL)
           			F_Free((StringT)s2);
			}
		}
	}
   return(s1);
}

/***************************************************************
 * Sorts the items in an F_TextItemsT structure.
 ****************************************************************/
VoidT SortTextItems(F_TextItemsT *ti)
{
	F_TextItemT tempTextItem;
	UIntT i = 0, j = 0;

	if(ti->len <= 1)
		return;
	else
	{
		for (i = 0; i < ti->len - 1; i++)
		{
			for (j = 0; j < ti->len - 1; j++)
			{
				if(ti->val[j].offset > ti->val[j +1].offset)
				{
					tempTextItem = ti->val[j];
					ti->val[j] = ti->val[j + 1];
					ti->val[j + 1] = tempTextItem;
				}
			}
		}
	}
	return;
}

