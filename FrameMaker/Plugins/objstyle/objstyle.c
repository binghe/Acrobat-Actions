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
 *    objstyle    
 *
 * General Description:
 *		This example demonstrates the usage of Object Style creation 
 *      and its application over the objects.  
 * 
 *		This client adds a menu with 2 submenus:
 *          Create Object Style: Creates an Object style
 *			Apply Object Style: Applies the created style to aframes
 *
 * Setup:                                              
 * 1. Open the document that has a few anchored frames
 * 2. Execute the client via API menu
 * 
 * Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your maker.ini file:
 *
 *		myapi=Standard, Sample apiclient,
 *			fdk_install_dir\samples\objstyle\debug\objstyle.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *********************************************************************/      

#include "fapi.h"
#include "fstrings.h"
#include "fdetypes.h"
#include "futils.h"


#define ObjectStyleAdd 		 1
#define ObjectStyleApply	 2

/* Function prototypes */
VoidT CreateObjectStyle(F_ObjHandleT);
VoidT ApplyObjectStyle(F_ObjHandleT);

VoidT F_ApiInitialize(IntT initialization)
 /* Code for initialization type */
{
	F_ObjHandleT menuBarId, menuId;

	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	/* Get ID of the Frame product menu bar. */
	menuBarId = F_ApiGetNamedObject(FV_SessionId, FO_Menu, "!MakerMainMenu");
	/* Add menu named "API" to the Frame product menu bar. */
	menuId = F_ApiDefineAndAddMenu(menuBarId, "APIMenu", "API");
	
	/* Add items to API menu. */
	F_ApiDefineAndAddCommand(ObjectStyleAdd, menuId,"ObjectStyleAdd","Create Object Style","\\!CD");
	F_ApiDefineAndAddCommand(ObjectStyleApply, menuId,"ObjectStyleApply","Apply Object Style","\\!AD");
	
}
VoidT F_ApiCommand(IntT command)
{
	F_ObjHandleT docId;
	
	/* Get the ID of the active document. */
	docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
	if(!docId) return; /* Return if there is no active document. */
	
	switch (command)
	{
	case ObjectStyleAdd:    /* Add Object Style */
		CreateObjectStyle(docId);
		break;
	
	case ObjectStyleApply:    /* Apply Style to Object(s) */
		ApplyObjectStyle(docId);
		break;
	}
}
VoidT CreateObjectStyle(F_ObjHandleT docId)
{
	F_ObjHandleT styleId, colorId;

	/** Define an Object Style in document **/
	
	styleId = F_ApiNewNamedObject(docId, FO_GraphicsFmt, "AFrameStyle");
	
	/* Style Color */
	colorId = F_ApiGetNamedObject(docId, FO_Color, (ConStringT) "Red");
	F_ApiSetInt(docId, styleId, FP_UseColor, True);
	F_ApiSetId(docId, styleId, FP_Color, colorId);
				
	/* Style Tint Percent */ 
	F_ApiSetInt(docId, styleId, FP_UseTintPercent, True);
	F_ApiSetMetric(docId, styleId, FP_TintPercent, 50*65536);
		
	/* Style Use Fill Style */
	F_ApiSetInt(docId, styleId, FP_UseFill, True);
	F_ApiSetInt(docId, styleId, FP_Fill, 4); /* Fill style 4 is used */ 
}
VoidT ApplyObjectStyle(F_ObjHandleT docId)
{
	F_ObjHandleT objId, styleId;
	F_PropValsT  props;

	/*	Traverse to the first graphic in Document */
	objId = F_ApiGetId(FV_SessionId, docId, FP_FirstGraphicInDoc);

	while (objId) /* Loop till the end of graphic */
		{
			if (F_ApiGetObjectType(docId,objId) == FO_AFrame) /* if object is Anchored frame, apply style defined for anchored frame */ 
			{
				styleId = F_ApiGetNamedObject(docId, FO_GraphicsFmt, "AFrameStyle");
				props = F_ApiGetProps(docId, styleId);
				F_ApiSetProps(docId, objId, &props);				
			}
			objId = F_ApiGetId(docId, objId, FP_NextGraphicInDoc); /* go to next graphic in document */
		}
}