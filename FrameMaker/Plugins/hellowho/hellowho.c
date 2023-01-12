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
 *  Program Name:
 *		hellowho
 *
 *  General Description:
 *		Greets the user with custom greeting established at product
 *		startup time.
 *
 *  Invocation:
 *		Once the client is installed, launch FrameMaker. Make choice
 *		from the dialog and click OK. Choose "Greet Me!" from the
 *		FDK Class Menu.
 *
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name hellowho>
 *			<Description Greets user with custom greeting defined at startup.>
 *			<Directory fdk_install_dir/samples/hellowho>
 *			<CommandLine $FAPIDIR/fa.hellowho>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.hellowho>
 *		to:
 *			<SharedLibrary fa.hellowho.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your product.ini (for example, maker.ini) file:
 *
 *		hellowho=Standard,Greets user with custom greeting defined at startup,
 *			fdk_install_dir\samples\hellowho\debug\hellowho.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fstrings.h"
#include "fmemory.h"
#include "futils.h"

#include "cutils.h"

#define GREET_NOW 1
#define MAXSTRING 255

#undef MACINTOSH 

VoidT setUp();

StringT msg; /* global variable used to hold greeting message */

/* initialization callback to run at product start up time */
VoidT F_ApiInitialize(init)
     IntT init;
{
  StringT platform;

  /* Making it unicode enabled. */
  F_FdeInit();
  F_ApiEnableUnicode(True);
  F_FdeInitFontEncs("UTF-8");

  switch (init)  {
  case FA_Init_First:
    platform = F_ApiGetString(FV_SessionId, FV_SessionId, FP_Platform);
    if (F_StrEqual(platform, (StringT) "Macintosh"))
      return;
    setUp();
    break;
  case FA_Init_TakeControl:
    platform = F_ApiGetString(FV_SessionId, FV_SessionId, FP_Platform);
    if (F_StrEqual(platform, (StringT) "Macintosh"))
      setUp();
    break;   
  case FA_Init_DocReport:
    F_ApiBailOut();
    F_ApiAlert((StringT) "Client misregistered as document report.",
               FF_ALERT_CONTINUE_WARN);
    break;
  }
}

/* Callback to respond to the user choosing menu items */
VoidT F_ApiCommand(command)
     IntT command;
{
  switch(command) {
  case GREET_NOW: /* Display the message constructed at start-up */
    F_ApiAlert(msg, FF_ALERT_CONTINUE_NOTE);
    break;
  }
}

VoidT setUp()
{
  IntT err;
  IntT choice; /* choice of greeting */
  
  StringT personToGreet; /* person to greet */
  F_StringsT greetings;

    /* Initialize the FDE */
    F_FdeInit();
    
    /* Add GREET command to class menu */
    addToClassMenu(GREET_NOW, (StringT) "greetNowCmd", (StringT) "Greet me!", 
                   (StringT)"\\!GM");
    
    /* Initialize greeting list to be displayed in scroll box */
    
    /* Set up high level struct of type  F_StringsT */
    greetings.val = (StringT *) F_Alloc(6*sizeof(StringT), NO_DSE);
    greetings.len = 6;
    
    /* Establish values */
    greetings.val[0] = F_StrCopyString((StringT) "Hello");
    greetings.val[1] = F_StrCopyString((StringT) "Greetings");
    greetings.val[2] = F_StrCopyString((StringT) "Top of the morning");
    greetings.val[3] = F_StrCopyString((StringT) "Good afternoon");
    greetings.val[4] = F_StrCopyString((StringT) "Good day");
    greetings.val[5] = F_StrCopyString((StringT) "Good night");
    
    /* Ask user to make a choice */ 
    err = F_ApiScrollBox(&choice, (StringT) "Choose a greeting.",
                         &greetings, (IntT) 5);
    if (err) {
      F_ApiAlert((StringT) "Default greeting will be used.", 
                 FF_ALERT_CONTINUE_WARN);  
      choice = 1;
    }
    
    /* Ask user to choose person to greet */
    err = F_ApiPromptString(&personToGreet, (StringT) "Name person to greet?", 
                            (StringT) "World");
    if (err) {
      F_ApiAlert((StringT) "Default greeting will be used.", 
                 FF_ALERT_CONTINUE_WARN);  
      personToGreet = F_StrNew(MAXSTRING);
      F_StrCpyNEnc(personToGreet, (StringT) "World", MAXSTRING, fdeUTF8EncodingId);
    }
    /* construct the greeting */
    msg = F_StrNew(MAXSTRING + 1);     /* allocate space */
    F_StrCatNEnc(msg, greetings.val[choice], MAXSTRING, fdeUTF8EncodingId);       
    F_StrCatNEnc(msg, (StringT) " ", MAXSTRING + 1, fdeUTF8EncodingId);
    F_StrCatNEnc(msg, personToGreet, MAXSTRING + 1, fdeUTF8EncodingId);

	/* Deallocate StringT and F_StringsT */
	 if(personToGreet != NULL)
    	F_Free(personToGreet);
    F_ApiDeallocateStrings(&greetings);
}
