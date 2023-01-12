/********************************************************************/
/*                                                                  */
/* ADOBE SYSTEMS INCORPORATED                                       */
/* Copyright 1986 - 2012 Adobe Systems Incorporated                 */
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
 *	    dita2book
 *
 * General Description:
 *		This application is the same as the example application presented
 *		in Chapter 1 of the FDK Programmer's Guide.
 *
 *		It adds a menu to the DitaMap menu bar. The menu includes items
 *		that Save a ditamap to a flat book or a nested book. The book will be genereated in 
 *		the directory where the dll is located, i.e $FDKINSTALLDIR\samples\dita2book\debug	
 *
 * Invocation:
 *		To start this application, follow the instructions in Install Info
 *		below. Then, start the Frame product. 
 *		This menu will only appear if you open a ditamap file. 
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		dita2book=Standard, Sample apiclient,
 *			fdk_install_dir\samples\dita2book\debug\dita2book.dll, all 
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
#include "fencode.h"
#include "fdetypes.h"
#include "fstrings.h"

#define FBOOK 1
#define NBOOK 2
#define OUTBOOK "\\out.book"

VoidT GenerateBook(IntT book);

VoidT F_ApiInitialize(IntT initialization)
        /* Code for initialization type */
{
	F_ObjHandleT menuBarId, menuId;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs((ConStringT)"UTF-8");

	/* Get ID of the DitaMap menu bar. */
	menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu,
									(ConStringT)"!DitamapMainMenu");
	/* Add menu named "SaveDitamap" to the DitaMap menu bar. */
	menuId = F_ApiDefineAndAddMenu(menuBarId, (ConStringT)"SaveDitamap", (ConStringT)"SaveDitamap");
	
	/* Add items to SaveDitamap menu. */
	F_ApiDefineAndAddCommand(FBOOK, menuId,(ConStringT)"FLATBOOK",(ConStringT)"FlatBook",(ConStringT)"\\!CD");
	F_ApiDefineAndAddCommand(NBOOK, menuId,(ConStringT)"NESTEDBOOK", (ConStringT)"NestedBook",(ConStringT)"\\!SF");
}

VoidT F_ApiCommand(IntT command)

{
		
	switch (command)
	{
	case FBOOK:    
			GenerateBook(FBOOK);
		break;
	
	case NBOOK:  
			GenerateBook(NBOOK);
		break;
	
	}
}

VoidT GenerateBook(IntT book) {

		F_ObjHandleT docId,bookId;
		IntT index;
		F_PropValsT params, *returnParamsp=NULL;
		StringT clientDir;

		docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
		if(!docId) return; /* Return if there is no active document. */

		params = F_ApiGetSaveDefaultParams();
		index = F_ApiGetPropIndex(&params, FS_FileType);
		params.val[index].propVal.u.ival = FV_SaveFmtBookWithFm;

		index = F_ApiGetPropIndex(&params, FS_DitaGenerateFlatBook);
		if(book == FBOOK)
		{
			params.val[index].propVal.u.ival = FV_DoYes;
		}else {

			params.val[index].propVal.u.ival = FV_DoNo;
		}
		index = F_ApiGetPropIndex(&params, FS_DitaPostProcessingOnBook);
		params.val[index].propVal.u.ival = FV_DoYes;

		clientDir = F_ApiClientDir();
		F_Realloc( (PtrT)clientDir, F_StrLen(clientDir)+F_StrLen((ConStringT) OUTBOOK)+1, NO_DSE);
		F_StrCat( (StringT)clientDir, (ConStringT) OUTBOOK);
		
		bookId = F_ApiSave(docId,clientDir, &params,&returnParamsp);
		if (!bookId){
				F_ApiAlert( (ConStringT) "Book Can't be generated", FF_ALERT_CONTINUE_WARN);
		}

		
		F_ApiDeallocatePropVals(&params);
		if(returnParamsp)
		{
			F_ApiDeallocatePropVals(returnParamsp);
		}
		F_StrFree(clientDir);

}