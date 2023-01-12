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
 * This file contains utility routines used by the class client programs
 * To use it, include cutils.c in your client
 */
#include "fapi.h"
#include "cutils.h"

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

/* Adds a command to the specified menu */
F_ObjHandleT addCommandToMenu(menuName, cmdNum, internalCmdName, cmdString, cmdShortCut)
     StringT menuName; /* name of menu to add command to */
     IntT cmdNum; /* number identifying command */
     StringT internalCmdName; /* unique name for this command */
     StringT cmdString; /* string visible to user */
     StringT cmdShortCut; /* command shortcut */
{
  F_ObjHandleT menuId;
  F_ObjHandleT newCmdId = 0;
  F_ObjHandleT mainMenuId = 0;
  
  menuId  = F_ApiGetNamedObject(FV_SessionId, FO_Menu, menuName);
  if (!menuId) {
    mainMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, (StringT) "!MakerMainMenu");
    if (mainMenuId) {
      menuId = F_ApiDefineAndAddMenu(mainMenuId, (StringT) "fdkclassMenu",menuName);
    }
  }
  if (!menuId)
    F_ApiAlert((StringT) "Problem in creating menu", FF_ALERT_CONTINUE_WARN);
  else {
    newCmdId = F_ApiDefineAndAddCommand(cmdNum, menuId, internalCmdName, cmdString, cmdShortCut);
    if (newCmdId) {
      F_ApiSetInt(menuId, newCmdId, FP_EnabledWhen, FV_ENABLE_NEEDS_DOCP_ONLY);
    } 
  }
  return(newCmdId);
}

/* Add a command to the menu CLASS_MENU_NAME */
F_ObjHandleT addToClassMenu(cmdNum, internalCmdName, cmdString, cmdShortCut)
     IntT cmdNum; /* number identifying command */
     StringT internalCmdName; /* unique name for this command */
     StringT cmdString; /* string visible to user */
     StringT cmdShortCut; /* command shortcut */
{
  F_ObjHandleT classMenuId;
  F_ObjHandleT newCmdId = 0;
  F_ObjHandleT mainMenuId = 0;
  
  classMenuId  = F_ApiGetNamedObject(FV_SessionId, FO_Menu, CLASS_MENU_NAME);
  if (!classMenuId) {
    mainMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
    if (mainMenuId) {
      classMenuId = F_ApiDefineAndAddMenu(mainMenuId,  "fdkclassMenu", CLASS_MENU_NAME);
    }
  }
  if (!classMenuId)
    F_ApiAlert((StringT) "Problem in creating class menu", FF_ALERT_CONTINUE_WARN);
  else
    newCmdId = F_ApiDefineAndAddCommand(cmdNum, classMenuId, internalCmdName, cmdString, cmdShortCut);
  
  return(newCmdId);
}

/* Get name of currently running Frame product */
StringT getProductName()
{
  StringT productName;
  
  productName = F_ApiGetString(FV_SessionId, FV_SessionId, FP_ProductName);
  return(productName);
}

/* Get major version number of currently running Frame product */
IntT getVersionMajor()
{
  IntT versionMajor;
  
  versionMajor = F_ApiGetInt(FV_SessionId, FV_SessionId, FP_VersionMajor);
  return(versionMajor);
}

/* Get minor version number of currently running Frame product */
IntT getVersionMinor()
{
  IntT versionMinor;
  
  versionMinor = F_ApiGetInt(FV_SessionId, FV_SessionId, FP_VersionMinor);
  return(versionMinor);
}

/* Display alert message with specified content */
VoidT displayMessage(msg)
     StringT msg;
{
  F_ApiAlert(msg, FF_ALERT_CONTINUE_NOTE);
}

/* Display alert warning with specified content */
VoidT displayWarning(msg)
     StringT msg;
{
  F_ApiAlert(msg, FF_ALERT_CONTINUE_WARN);
}

/* Greet user with alert */
VoidT sayHello()
{
  displayMessage((StringT) "Hello World!");
}

VoidT sayGoodby()
{
  displayMessage((StringT) "Goodbye World!");
}

VoidT openDocGreeting()
{
  displayMessage((StringT) "Doc open notification");
}

VoidT closeDocGreeting()
{
  displayMessage((StringT) "Doc close notification");
}

VoidT warnRegistrationProblem()
{
  displayWarning((StringT) "Client is misregistered as a Document Report.");
}

VoidT addTextAtIP(docId, str)
     F_ObjHandleT docId;
     StringT str;
{
  F_TextRangeT tRange;
  F_ObjHandleT flowId, tFrameId, pgfId;

  tRange = F_ApiGetTextRange(FV_SessionId, docId, FP_TextSelection);
  if (!tRange.beg.objId) {
    flowId = F_ApiGetId(FV_SessionId, docId, FP_MainFlowInDoc);
    tFrameId = F_ApiGetId(docId, flowId, FP_FirstTextFrameInFlow);
    pgfId = F_ApiGetId(docId, tFrameId, FP_FirstPgf);    
    tRange.beg.objId = pgfId;
    tRange.beg.offset = 0;
  }
  F_ApiAddText(docId, &tRange.beg, str);
}
