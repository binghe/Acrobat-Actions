/********************************************************************/
/*                                                                  */
/* ADOBE SYSTEMS INCORPORATED                                       */
/* Copyright 1986 - 2009 Adobe Systems Incorporated                 */
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
 *		Sample client for hierarchical books in FrameMaker 9.
 *
 * General Description:
 *	    Add Folder and Group to the hierarchical books. 
 *		Add files to these new components. 
 *		Also add an XML file inside a Folder and set Application 
 *		for the XML component in a hierarchical book.
 *		Add a Folder and set a template file on the folder.
 *		Traverse and Open all the files present in the Hierarchical book.
 * Invocation:
 *		From the FDK_Class menu (in a FrameMaker book main menu), choose
 *		- "Add Folder and Group component and Add Files to each"
 *		- "Add XML inside a Folder and set Application"
 *		- "Set Template on a Folder"
 *		- "Open all files in hierarchical books"
 *
 * Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		HierarchicalBook=Standard, Hierarchical books in Framemaker 9,
 *			fdk_install_dir\samples\FM9books\debug\FM9books.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fapi.h"
#include "fdetypes.h"
#include "fmemory.h"
#include "futils.h"
#include "fcodes.h"
#include "fmetrics.h"
#include "fstrings.h"

#define ADD_FG 1
#define ADD_XML 2
#define FOLDER_TEMPLATE 3
#define OPEN_ALL 4

#define CLASS_MENU_LABEL (StringT) "Hierarchical Books"
#define CLASS_BOOK_MENU_NAME (StringT) "FDKClassBookMenu"


/* Function protocols */
F_ObjHandleT FM_CreateNewBookComponent (StringT groupOrFolder,StringT compName);
F_ObjHandleT FM_InsertFolderComponentInBook ( F_ObjHandleT bookId, F_ObjHandleT parentId,StringT compName );
F_ObjHandleT FM_InsertGroupComponentInBook ( F_ObjHandleT bookId, F_ObjHandleT parentId,StringT compName );
VoidT FM_InsertFileComponentsInBook ( F_ObjHandleT bookId, F_ObjHandleT parentId,StringT fileName );
VoidT FM_InsertXMLFileComponentInBook(F_ObjHandleT bookId, F_ObjHandleT parentId,StringT fileName, StringT appName);
VoidT FM_SetFolderTemplate();
VoidT FM_OpenAllFilesInHBook( );

VoidT F_ApiInitialize(init)
IntT init;{
	F_ObjHandleT classBookMenuId;
	F_ObjHandleT bookMenuId,bookMenuId2,bookMenuId3,bookMenuId4;
	
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	switch(init){
	case FA_Init_First:
		bookMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, (StringT) "!BookMainMenu");
		if(bookMenuId){
			classBookMenuId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, CLASS_BOOK_MENU_NAME);
			if(!classBookMenuId)
				classBookMenuId = F_ApiDefineAndAddMenu(bookMenuId, CLASS_BOOK_MENU_NAME, CLASS_MENU_LABEL);
			bookMenuId =F_ApiDefineAndAddCommand(ADD_FG, classBookMenuId, (StringT) "Folder and Group", (StringT) "Add Folder and Group component and Add Files to each", (StringT) "\\!OA");
			bookMenuId2 =F_ApiDefineAndAddCommand(ADD_XML, classBookMenuId, (StringT) "XML", (StringT) "Add XML inside a Folder and set Application", (StringT) "\\!OX");
			bookMenuId3 =F_ApiDefineAndAddCommand(FOLDER_TEMPLATE, classBookMenuId, (StringT) "Folder Template", (StringT) "Set Template on a Folder", (StringT) "\\!OT");
			bookMenuId4 =F_ApiDefineAndAddCommand(OPEN_ALL, classBookMenuId, (StringT) "Open all files", (StringT) "Open all files in hierarchical books", (StringT) "\\!OH");
		}
		F_ApiBailOut();
		break;
	}
}

VoidT F_ApiCommand(command)
IntT command;{
	F_ObjHandleT bookId; /* active book ID */
	F_ObjHandleT pId,pId2;/*  parent component ID in hierarchical books*/
	BoolT userCancel = False;
	StringT compName = NULL; /* name of book component */
	
	
	switch(command){
	case ADD_FG:
		/* get ID of active book */
		bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);

		/*Add Folder component and add a fm file to it*/
		pId= FM_CreateNewBookComponent("Folder","Frontmatter");
		FM_InsertFileComponentsInBook(bookId, pId, "\\..\\FM9_BookClient\\FrontMatter.fm");
		
		/*Add Group component and add two files*/
		pId2= FM_CreateNewBookComponent("Group","ChapterFiles");
		FM_InsertFileComponentsInBook(bookId, pId2, "\\..\\FM9_BookClient\\Chapter.fm");
		FM_InsertFileComponentsInBook(bookId, pId2, "\\..\\FM9_BookClient\\ChapterSecond.fm");

		F_ApiBailOut();
		break;	

	case ADD_XML:
		/* get ID of active book */
		bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);
		
		/*Add Folder inside which the XML will be added.*/
		pId= FM_CreateNewBookComponent("Folder","XML");
		/*Add XML component to book and set Application.*/
		FM_InsertXMLFileComponentInBook(bookId, pId, "\\..\\FM9_BookClient\\OutlineSmall.xml","OutlineSmall");
		break;

	case FOLDER_TEMPLATE:
		/* get ID of active book */
		bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);
		
		/*Add Folder component*/
		pId= FM_CreateNewBookComponent("Folder","Template_Folder");
		/*Set template to Folder component in book*/
		FM_SetFolderTemplate();
		break;

	case OPEN_ALL:
		/* get ID of active book */
		bookId = F_ApiGetId(FV_SessionId, FV_SessionId, FP_ActiveBook);
		/*Function to traverse and open all the files in a Hierarchical book.*/
		FM_OpenAllFilesInHBook( );
		break;
	}		
}


/*Function to traverse and open all the files in a Hierarchical book.*/
VoidT FM_OpenAllFilesInHBook( )
{
	F_ObjHandleT bookId = 0, bookParent = 0, compId = 0;
	F_PropValsT	script, *returnParamsp = NULL;
	IntT i;

	bookId =  F_ApiGetId ( FV_SessionId, FV_SessionId, FP_ActiveBook );

	if ( !bookId )
		return;

	bookParent = F_ApiGetId(bookId, bookId, FP_BookParent);

		/*Loop to traverse inside a hierarchical book*/
		compId = F_ApiGetId (FV_SessionId, bookId, FP_FirstComponentInBook);
		while ( compId )
	{
		F_ObjHandleT nextId = 0, parentId = 0;
		IntT compType = F_ApiGetInt(bookId, compId, FP_ComponentType);
		StringT openFileName = NULL;

		if ( FV_BK_FOLDER == compType || FV_BK_GROUP == compType )
		{
			nextId = F_ApiGetId ( bookId, compId, FP_FirstComponentInBookComponent );
		}

		if ( !nextId )
		{
			nextId = F_ApiGetId ( bookId, compId, FP_NextComponentInBook );
		}

		parentId = compId;
		while ( !nextId && (parentId != 0) )
		{
			parentId = F_ApiGetId ( bookId, parentId, FP_BookComponentParent );
			nextId = F_ApiGetId ( bookId, parentId, FP_NextComponentInBook );
		}

		openFileName = F_ApiGetString(bookId, compId, FP_Name);
	
		if ( openFileName && !F_StrIsEmpty(openFileName) )
		{
			/* open the document in FM */
			
			script = F_ApiGetOpenDefaultParams();
			i = F_ApiGetPropIndex(&script, FS_MakeVisible);
			script.val[i].propVal.u.ival = True;
			i = F_ApiGetPropIndex(&script, FS_RefFileNotFound);
			script.val[i].propVal.u.ival = FV_AllowAllRefFilesUnFindable;
			i = F_ApiGetPropIndex(&script, FS_FileIsOldVersion);
			script.val[i].propVal.u.ival = FV_DoOK;
			i = F_ApiGetPropIndex(&script, FS_FontChangedMetric);
			script.val[i].propVal.u.ival = FV_DoOK;
			i = F_ApiGetPropIndex(&script, FS_FontNotFoundInCatalog);
			script.val[i].propVal.u.ival = FV_DoOK;
			i = F_ApiGetPropIndex(&script, FS_FontNotFoundInDoc);
			script.val[i].propVal.u.ival = FV_DoOK;
			i = F_ApiGetPropIndex(&script, FS_LanguageNotAvailable);
			script.val[i].propVal.u.ival = FV_DoOK;
			i = F_ApiGetPropIndex(&script, FS_LockCantBeReset);
			script.val[i].propVal.u.ival = FV_DoOK;
			i = F_ApiGetPropIndex(&script, FS_UpdateTextReferences);
			script.val[i].propVal.u.ival = FV_DoNo;
			i = F_ApiGetPropIndex(&script, FS_UpdateXRefs);
			script.val[i].propVal.u.ival = FV_DoNo;
			i = F_ApiGetPropIndex(&script, FS_UseAutoSaveFile);
			script.val[i].propVal.u.ival = FV_DoNo;
			i = F_ApiGetPropIndex(&script, FS_UseRecoverFile);
			script.val[i].propVal.u.ival = FV_DoNo;
			i = F_ApiGetPropIndex(&script, FS_AlertUserAboutFailure);
			script.val[i].propVal.u.ival = False;
			i = F_ApiGetPropIndex(&script, FS_BeefyDoc);
			script.val[i].propVal.u.ival = FV_DoOK;
			i = F_ApiGetPropIndex(&script, FS_FileIsInUse);
			script.val[i].propVal.u.ival = FV_OpenViewOnly;
			i = F_ApiGetPropIndex(&script, FS_FileIsStructured);
			script.val[i].propVal.u.ival = FV_OpenViewOnly;
			i = F_ApiGetPropIndex(&script, FS_OpenFileNotWritable);
			script.val[i].propVal.u.ival = FV_DoOK;
			F_ApiOpen(openFileName,&script,&returnParamsp);
			}
			compId = nextId;
			
	}
}

/*Set template file on a Folder*/
VoidT FM_SetFolderTemplate( )
{
	F_ObjHandleT bookId = 0, bookParent = 0, compId = 0;
	StringT clientpath = NULL;
	StringT filepathname = NULL;
	IntT len = 0;

	bookId =  F_ApiGetId ( FV_SessionId, FV_SessionId, FP_ActiveBook );

	if ( !bookId )
		return;

	bookParent = F_ApiGetId(bookId, bookId, FP_BookParent);

	clientpath = F_ApiClientDir();
	len = F_StrLen(clientpath) + 128; //enough storage
	filepathname = F_StrNew(len);
	

	/*Loop to traverse inside a hierarchical book*/
	compId = F_ApiGetId (FV_SessionId, bookId, FP_FirstComponentInBook);
	while ( compId )
	{
		F_ObjHandleT nextId = 0, parentId = 0;
		IntT compType = F_ApiGetInt(bookId, compId, FP_ComponentType);
		StringT openFileName = NULL;
		StringT compName=NULL;

		compName = F_ApiGetString(bookId, compId, FP_BookComponentTitle);
	
		/*If the component type is Folder or Group get the Id for the first child component.*/
		if ( FV_BK_FOLDER == compType || FV_BK_GROUP == compType )
		{
			nextId = F_ApiGetId ( bookId, compId, FP_FirstComponentInBookComponent );
		}
		
		/*If no child elements present move to next component in book.*/
		if ( !nextId )
		{
			nextId = F_ApiGetId ( bookId, compId, FP_NextComponentInBook );
		}
		parentId = compId;

		/*Loop inside hierarchical components.*/
		while ( !nextId && (parentId != 0) )
		{
			parentId = F_ApiGetId ( bookId, parentId, FP_BookComponentParent );
			nextId = F_ApiGetId ( bookId, parentId, FP_NextComponentInBook );
			
		}
		openFileName = F_ApiGetString(bookId, compId, FP_Name);
		
		compType = F_ApiGetInt(bookId, compId, FP_ComponentType);
		
		/*Check whether the component type is Folder and verify for the Folder name and set template on this folder*/
		if (FV_BK_FOLDER==compType && !(F_StrCmp(compName,(ConStringT)"Template_Folder")))
		{
			F_StrCpyN ( filepathname,(ConStringT)clientpath,len );
			F_StrCatN ( filepathname, "\\..\\FM9_BookClient\\Template.fm", len );
			F_ApiSetString ( bookId, compId, FP_BookComponentTemplatePath, (ConStringT)filepathname );
		}
		compId = nextId;
	}
	F_Free(filepathname);
	F_Free(clientpath);
}

/*Insert XML file in the book and set Application with the Application name provided as an argument*/
VoidT FM_InsertXMLFileComponentInBook(F_ObjHandleT bookId, F_ObjHandleT parentId,StringT filename, StringT appName)
{
	F_ElementLocT elemLoc;
	IntT fileCount = 1;
	StringT oldApps=NULL;
	F_ObjHandleT newCompId = 0;
	F_ObjHandleT bookParent = 0, compId = 0; /*  Component ID in hierarchical books*/
	IntT compType=0;
	StringT clientpath = NULL;
	StringT filepathname = NULL;
	IntT len = 0;

	clientpath = F_ApiClientDir();
	len = F_StrLen(clientpath) + 128; //enough storage
	filepathname = F_StrNew(len);
	F_StrCpyN ( filepathname,(ConStringT)clientpath,len );
	F_StrCatN ( filepathname, filename, len );

	bookParent = F_ApiGetId(bookId, bookId, FP_BookParent);
	compId = F_ApiGetId ( bookId, bookId, FP_FirstComponentInBook );

	if ( !parentId )
		parentId = F_ApiGetId ( FV_SessionId, bookId, FP_HighestLevelElement );

	elemLoc.parentId = parentId;
	elemLoc.childId = 0;
	elemLoc.offset = 0;

	/* Insert the new element.*/
	newCompId = F_ApiNewBookComponentInHierarchy ( bookId, filepathname, &elemLoc );
	
	
	/*	Loop to traverse inside the hierarchical book*/
	compId = F_ApiGetId (FV_SessionId, bookId, FP_FirstComponentInBook);
	while ( compId )
	{
		F_ObjHandleT nextId = 0, parentId = 0;

		IntT compType = F_ApiGetInt(bookId, compId, FP_BookComponentFileType);
		StringT openFileName = NULL;
		/*If the component type is Folder or Group get the Id for the first child component.*/
		if ( FV_BK_FOLDER == compType || FV_BK_GROUP == compType )
		{
			nextId = F_ApiGetId ( bookId, compId, FP_FirstComponentInBookComponent );
		}
		/*If no child elements present move to next component in book.*/
		if ( !nextId )
		{				
			nextId = F_ApiGetId ( bookId, compId, FP_NextComponentInBook );
		}
		parentId = compId;
		/*Loop inside hierarchical components.*/
		while ( !nextId && (parentId != 0) )
		{
			parentId = F_ApiGetId ( bookId, parentId, FP_BookComponentParent );
			nextId = F_ApiGetId ( bookId, parentId, FP_NextComponentInBook );
		}
		openFileName = F_ApiGetString(bookId, compId, FP_Name);

		/*Set Application for the XML Book*/
		if (FV_BK_XML==compType)
		{
			F_ApiSetString ( bookId, compId, FP_XmlApplicationForBookComponent, appName );
		}
		compId = nextId;
	}
		
	oldApps = F_ApiGetString ( bookId, newCompId, FP_XmlApplicationForBookComponent );

	F_Free(filepathname);
	F_Free(clientpath);
}

/*Creates NewBook Component Group of Folder with the name compName*/
F_ObjHandleT FM_CreateNewBookComponent (StringT groupOrFolder,StringT compName)
{
	F_ObjHandleT rootElement;
	F_ObjHandleT newCompId;

	F_ObjHandleT bookId = F_ApiGetId ( FV_SessionId, FV_SessionId, FP_ActiveBook );
	if ( !bookId )
	{
		F_ApiAlert ( "No Active Book", FF_ALERT_CONTINUE_WARN );
		return 0;
	}

	rootElement =  F_ApiGetId ( FV_SessionId, bookId, FP_HighestLevelElement );
	
	if (groupOrFolder=="Folder")
		{
			newCompId = FM_InsertFolderComponentInBook ( bookId, rootElement,compName );
		}
	else
	{
		newCompId = FM_InsertGroupComponentInBook ( bookId, rootElement,compName );
	}

	return newCompId;
}


/* Inserts files inside a Folder or a group*/
VoidT FM_InsertFileComponentsInBook ( F_ObjHandleT bookId, F_ObjHandleT parentId,StringT filename)
{
	F_ElementLocT elemLoc;
	IntT fileCount = 1;
	F_ObjHandleT newCompId = 0;
	StringT clientpath = NULL;
	StringT filepathname = NULL;
	IntT len = 0;

	clientpath = F_ApiClientDir();
	len = F_StrLen(clientpath) + 128; //enough storage
	filepathname = F_StrNew(len);
	F_StrCpyN ( filepathname,(ConStringT)clientpath,len );
	F_StrCatN ( filepathname, filename, len );

	if ( !parentId )
		parentId = F_ApiGetId ( FV_SessionId, bookId, FP_HighestLevelElement );

	elemLoc.parentId = parentId;
	elemLoc.childId = 0;
	elemLoc.offset = 0;

	/*Insert the new element.*/
	newCompId = F_ApiNewBookComponentInHierarchy ( bookId, filepathname, &elemLoc );

	F_ApiSetId ( bookId, newCompId, FP_BookComponentType, FV_BK_FOLDER );

	F_Free(filepathname);
	F_Free(clientpath);
}

/*Inserts Folder Component in Book at the location specified by the parent id*/
F_ObjHandleT FM_InsertFolderComponentInBook ( F_ObjHandleT bookId, F_ObjHandleT parentId, StringT compName)
{
	F_ElementLocT elemLoc;
	IntT fileCount = 1;

	if ( !parentId )
		parentId = F_ApiGetId ( FV_SessionId, bookId, FP_HighestLevelElement );

	elemLoc.parentId = parentId;
	elemLoc.childId = 0;
	elemLoc.offset = 0;

	return F_ApiNewBookComponentOfTypeInHierarchy ( bookId, compName, FV_BK_FOLDER, &elemLoc );
}

/*Inserts Group Component in Book at the location specified by the parent id*/
F_ObjHandleT FM_InsertGroupComponentInBook ( F_ObjHandleT bookId, F_ObjHandleT parentId, StringT compName )
{
	F_ElementLocT elemLoc;
	IntT fileCount = 1;

	if ( !parentId )
		parentId = F_ApiGetId ( FV_SessionId, bookId, FP_HighestLevelElement );

	elemLoc.parentId = parentId;
	elemLoc.childId = 0;
	elemLoc.offset = 0;

	return F_ApiNewBookComponentOfTypeInHierarchy ( bookId, compName, FV_BK_GROUP, &elemLoc );
}
