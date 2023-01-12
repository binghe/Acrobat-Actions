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
#include "fmemory.h"
#include "mml.h"
#include "mmlproto.h"

#ifdef UNIX
#include "pwd.h"		
#endif

#define	StrIsEmpty(s)	(!(s) || !(*(s)))

StringT NativeString(s)
StringT s;
{
	return StrIsEmpty(s) ? 0 : F_StrCopyString(s);
}

VoidT StrCpy(s1,s2)
StringT s1;
StringT s2;
{
	if (!s1) return;

	if (s2) {
		F_StrCpy(s1,s2);
	} else {
		F_StrCpy(s1,"");
	}
}

VoidT StrCatCharN(s, c, n)
StringT s;
PUCharT c;
IntT    n;
{
	if (s) F_StrCatCharN(s, c, n);
}

VoidT StrTrunc(s)
StringT s;
{
	if (s) {
		s[0] = '\0';
	}
}

BoolT StrEqual(s1,s2)
StringT s1, s2;
{
	return F_StrEqual(s1 ? s1 : (StringT)"", s2 ? s2 : (StringT)"");
}

IntT StrLen(s)
StringT s;
{
	 return !s ? 0 : F_StrLen(s);
}

#undef getpwnam
/*#undef getenv*/
/*extern StringT getenv();*/

#ifdef MMLMIF
VoidT FixTildaName(s)
StringT s;
{
	 register StringT from, to;
	 BigFileNameT filename;
	 register IntT i, j, len;
	 UCharT c;

	 to  = filename;
	 len = BIGFILENAMESIZE;

	 for (i = 0, j = 0; s[i] && (j < len); i++)
		{
		 switch (s[i])
			{
			 case '~':
				 if (i == 0)
					{
					 if (!s[1] || s[1] == '/')
						{
						 /* Handle ~/  */
		 				 from = F_ApiGetString(0,FV_SessionId,FP_UserHomeDir);
						 while (*from && j < len)
							 to[j++] = *from++;
						}
					 else
						{
						 /* Handle ~username */
						 struct passwd *pwent;
						 StringT usrnam;

						 i++;
						 usrnam = &s[1];
						 while (s[i] && (s[i] != '/') )
							 i++;
						 c = s[i];
						 s[i] = 0;
						 pwent = getpwnam(usrnam);
						 if (pwent == NULL)
							 return;
						 s[i] = c;
						 i--;
						 from = (StringT)pwent->pw_dir;
						 while (*from && j < len)
							 to[j++] = *from++;
						}
					}
				 else  /* ~ is part of filename (e.g. backup file) */
				        to[j++] = s[i];
				 break;
			 case '$':
				 if (i == 0 || s[i - 1] != '\\')
					{
					 /* Handle environment variable. */
					 StringT envnam, envp;

					 i++;
                     envnam = &s[i];
                     while (s[i] && (s[i] != '/') )
						 i++;
					 c = s[i];
					 s[i] = 0;
                     envp = getenv(envnam);
                     if (!envp)
						 return;
					 s[i] = c;
                     i--;
					 from = envp;
					 while (*from && j < len)
                         to[j++] = *from++;
					}
				 break;
			 default:
				 to[j++] = s[i];
				 break;
			}
		}
	 to[j] = 0;
	 StrCpy(s, filename);
}
#endif

VoidT SafeFree(memP)
PtrT *memP;
{
	 if (*memP) {
		 F_Free(*memP);
		 *memP = 0;
	 }
}

StringT mmlErrorMessage[] = {
(StringT)"%s MSG: %s.\n",
(StringT)"Character '%s' needs ending space.\n",
(StringT)"%s: Bad option '%s'.\n",
(StringT)"Bad boolean: '%s'.\n",
(StringT)"Bad digit: %s. Expected a number.\n",
(StringT)"Bad hex digit, %s, in a hex number.\n",
(StringT)"Bad lrcd: '%s'.\n",
(StringT)"Bad real number: '%s'.\n",
(StringT)"Bad style: '%s'.\n",
(StringT)"Bad unit: '%s'.\n",
(StringT)"Cannot find '%s'.\n",
(StringT)"Cannot open %s.\n",
(StringT)"Cannot open temporary file.\n",
(StringT)"Cannot write %s.\n",
(StringT)"Cannot find end of comment on line %d.\n",
(StringT)"Expected string, not '%s'.\n",
(StringT)"FATAL! %s\n",
(StringT)"Hash table overflow; over 1000 macros defined.\n",
(StringT)"Input stack overflow.\n",
(StringT)"Internal Error %d\n",
(StringT)"Junk at end of command: %s.\n",
(StringT)"Keyword too long; over 1000 characters.\n",
(StringT)"Never finished defining '%s'.\n",
(StringT)"Empty macro name (< >)not allowed.\n",
(StringT)"Out of memory!\n",
(StringT)"String too long.\n",
(StringT)"Tab buffer overflow; over 40 tab stops in a paragraph.\n",
(StringT)"Tab commands allowed only within <TabStops . . .>\n",
(StringT)"Too many -I options.\n",
(StringT)"Undefined macro: %s.\n",
(StringT)"Unexpected right angle bracket.\n",
(StringT)"Usage: mmltomif [-Llanguage] [-Ipath] [input [output]]\n",
(StringT)"The mml import filter received a notification other than FA_NOTE_FILTER_IN.\n",
(StringT)"The mml import filter was unable to create a temporary file.\n",
(StringT)"The mml import filter reached end of file while reading an <AFrame > statement.\n",
(StringT)"The mml import filter was unable to open a temporary file.\n",
(StringT)"The mml import filter could not import because there was no insertion point.\n",
(StringT)"The mml import filter encountered an unknown font name or style.\n",
(StringT)"The mml import filter could not process a <!DefinePar > statement.\n",
(StringT)"The mml import filter could not add a first-page master page.\n"
};

