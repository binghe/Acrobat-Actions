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

#define WARN 0
#define NOTE 1

#define CLASS_MENU_NAME (StringT) "FDKClassMenu"
#define CLASS_MENU_LABEL (StringT) "Plugins"
#define CLASS_BOOK_MENU_NAME (StringT) "FDKClassBookMenu"
#define UNI_REPLACEMENT_CHAR (IntT)0x0000FFFD
#define UNI_MAX_UTF32        (IntT)0x7FFFFFFF

StringT getProductName();
IntT getVersionMajor();
IntT getVersionMinor();
VoidT displayMessage();
VoidT displayWarning();
VoidT sayHello();
VoidT sayGoodby();
VoidT openDocGreeting();
VoidT closeDocGreeting();
F_ObjHandleT addToClassMenu();
F_ObjHandleT addCommandToMenu();
VoidT addTextAtIP();
VoidT warnRegistrationProblem();