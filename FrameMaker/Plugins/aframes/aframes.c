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
 *	    aframes
 *
 * General Description:
 *		Generates a document that lists the page number,
 *		position, and size of all the anchored frames on
 *		body pages in the active document.
 *
 * Invocation:
 *		From the document you wish to generate the report, bring
 *		up File->Utilities->Document Reports. Select aframes in
 *		the scroll list and hit Report.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name aframes>
 *			<Type Report>
 *			<Description Reports position and size of frames>
 *			<Directory fdk_install_dir/samples/aframes>
 *			<CommandLine $FAPIDIR/fa.aframes>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.aframes>
 *		to:
 *			<SharedLibrary fa.aframes.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your  maker.ini file:
 *
 *		aframes=DocReport,Reports position and size of frames,
 *			fdk_install_dir\samples\aframes\debug\aframes.dll, all 
 *
 *		Replace fdk_install_dir with the path of the directory
 *		in which you installed your copy of the FDK files.
 *		Restart maker.
 *
 *	Exceptions:
 *		None.
 *
 ***********************************************************************/

#include "fdetypes.h"
#include "fapi.h"
#include "fstrings.h"
#include "fmemory.h"
#include "fmetrics.h"
#include "fprogs.h"
#include "futils.h"

#define INCH	((MetricT)0x480000)
#define POINT	((MetricT)0x010000)
#define Success	0


/*****************************  Prototypes  ******************************/
F_ObjHandleT getPageId FARGS((F_ObjHandleT docId, F_ObjHandleT graphicId));
IntT newReportDoc FARGS((VoidT));
VoidT setTabsOnBody FARGS((VoidT));
IntT reportAFrameProps FARGS((VoidT));
VoidT appendAnchorType FARGS((IntT type));
VoidT appendAlignment FARGS((IntT align));
VoidT appendBool FARGS((StringT s, IntT val));
VoidT appendInch FARGS((StringT s, MetricT val));
VoidT appendPoint FARGS((StringT s, MetricT val));
VoidT appendPageNumber FARGS((VoidT));


F_ObjHandleT docId, reportDocId, flowId, textFrameId, pageId, pageType, frameId, textColId;
F_TextLocT textLoc;
StrBuffT text;

VoidT F_ApiInitialize(IntT init)
{
	 IntT retcode = Success;
 
	/* Making it unicode enabled. */
	F_FdeInit();
	F_ApiEnableUnicode(True);
  	F_FdeInitFontEncs("UTF-8");

	 if (init != FA_Init_DocReport)
		{
		 F_ApiBailOut();
		 return;
		}

	 /* Get active document id before creating report document */
	 docId = F_ApiGetId(0, FV_SessionId, FP_ActiveDoc);
	 reportDocId = 0; /* Dynamic clients don't bail out */

	 /* Turn off formatting and display */
	 F_ApiSetInt(0, FV_SessionId, FP_Reformatting, False);
	 F_ApiSetInt(0, FV_SessionId, FP_Displaying, False);

	 /* For each flow in the document... */
	 flowId = F_ApiGetId(FV_SessionId,docId,FP_FirstFlowInDoc);
     while (flowId)
	 {
        /* Get the first text frame in the flow... */
        textFrameId = F_ApiGetId(docId,flowId,FP_FirstTextFrameInFlow);

		/*For each text sub column in the flow*/
        textColId = F_ApiGetId(docId,textFrameId,FP_FirstSubCol);
		while (textColId)
		{
			 pageId = getPageId(docId, textColId);

			 /* Look only at body pages */
			 pageType = F_ApiGetObjectType(docId, pageId);
			 if (pageType != FO_BodyPage)
				 break;
			 /* For each anchored frame in the text sub column... */
			 frameId=F_ApiGetId(docId,textColId,FP_FirstAFrame);				 
			 while (frameId)
			 {
				 /* Report the frame's properties */
				 retcode = reportAFrameProps();
				 if (retcode != Success)
					 goto done;
				 frameId=F_ApiGetId(docId,frameId,FP_NextAFrame);
			 }
			 textColId = F_ApiGetId(docId,textColId,FP_NextSubCol);
				 
		}
 
        flowId = F_ApiGetId(docId,flowId,FP_NextFlowInDoc);
	 }
done:
	 if (!reportDocId && retcode == Success)
		 F_ApiAlert("There are no anchored frames to report!",FF_ALERT_CONTINUE_NOTE);

	 /* Turn formatting, reformat, and turn display on again */
	 F_ApiSetInt(0, FV_SessionId, FP_Reformatting, True);
	 F_ApiSetInt(0, FV_SessionId, FP_Displaying, True);
	 if (reportDocId)
		{
		 F_ApiReformat(reportDocId);
		 F_ApiSetInt(FV_SessionId, reportDocId, FP_IsOnScreen, True);
		 F_ApiRedisplay(reportDocId);
		}
	 F_ApiRedisplay(docId);

	 F_ApiBailOut();
}

/* Return the id of a graphic's page */
F_ObjHandleT getPageId(F_ObjHandleT docId, F_ObjHandleT graphicId)
{
	 F_ObjHandleT parentId, oldParentId, parentType;

	 /* Ascend until the page frame is reached */
	 parentId = graphicId;
	 parentType = F_ApiGetObjectType(docId, graphicId);
	 while (parentType != FO_BodyPage && 
			parentType != FO_MasterPage &&
			parentType != FO_RefPage)
		{
		 oldParentId = parentId;
		 if (parentType == FO_Cell || parentType == FO_Fn)
			 /* For table cell text columns, get the parent text column */
			 parentId = F_ApiGetId(docId,parentId,FP_InTextObj);
		 else
			{
			 parentId = F_ApiGetId(docId,parentId,FP_FrameParent);
			 /* If no parent, this must be a page frame or an unanchored frame */
			 if (!parentId)
				 parentId = F_ApiGetId(docId, oldParentId, FP_PageFramePage);
			}
		 /* Safety check */
		 if (!parentId)
			 break;
		 parentType = F_ApiGetObjectType(docId,parentId);
		}
	 return(parentId);
}

/* Create the report document */
IntT newReportDoc()
{
	 MetricT width, height;
	 F_ObjHandleT id;

	 /* Start the report document */
	 width = (MetricT) 8.5 * INCH;
	 height = 11 * INCH;

	 reportDocId = F_ApiCustomDoc(width,height,1,0,INCH,INCH,INCH,INCH,FF_Custom_FirstPageRight, False);
	 if (!reportDocId)
		{
		 F_ApiAlert("Couldn't make a new report document.",FF_ALERT_CONTINUE_WARN);
		 return(!Success);
		}

	 /* Get the text location of the first paragraph of the main flow */
	 id = F_ApiGetId(FV_SessionId, reportDocId, FP_MainFlowInDoc);
	 id = F_ApiGetId(reportDocId, id, FP_FirstTextFrameInFlow);
	 textLoc.objId = F_ApiGetId(reportDocId, id, FP_FirstPgf);
	 textLoc.offset = 0;
	 setTabsOnBody();

	 /* Turn off text symbols and borders */
	 F_ApiSetInt(FV_SessionId, reportDocId, FP_ViewTextSymbols, False);
	 F_ApiSetInt(FV_SessionId, reportDocId, FP_ViewBorders, False);
	 return(Success);
}

/* Add the tabs to the Body paragraph. */
VoidT setTabsOnBody()
{
	 F_ObjHandleT pgfFmtId;
	 F_TabsT tabs;
	 F_TabT tab[2];
	 F_PropValsT pgfFmtProps;

	 pgfFmtId = F_ApiGetNamedObject(reportDocId, FO_PgfFmt, "Body");
	 tabs.val = &tab[0];
	 tabs.len = 2;
	 tabs.val[0].type = tabs.val[1].type = FV_TAB_LEFT;
	 tabs.val[0].x = INCH; tabs.val[1].x = 3 * INCH;
	 tabs.val[0].decimal = tabs.val[1].decimal = '.';
	 tabs.val[0].leader = tabs.val[1].leader = (StringT)" ";

	 F_ApiSetTabs(reportDocId, pgfFmtId, FP_Tabs, &tabs);

	 pgfFmtProps = F_ApiGetProps(reportDocId, pgfFmtId);
	 F_ApiSetProps(reportDocId, textLoc.objId, &pgfFmtProps);
	 F_ApiDeallocatePropVals(&pgfFmtProps);
}

IntT reportAFrameProps()
{
	 IntT position, retcode = Success;

	 /* Initialize the report document */
	 if (!reportDocId)
		{
		 retcode = newReportDoc();
		 if (retcode != Success)
			 return(retcode);
		}

	 /* Put the page number in front of the first property */
	 appendPageNumber();

	 position = F_ApiGetInt(docId, frameId, FP_AnchorType);
	 appendAnchorType(position);
	 switch (position)
		{
		 case FV_ANCHOR_BELOW:
		 case FV_ANCHOR_TOP:
		 case FV_ANCHOR_BOTTOM:
			 appendAlignment(F_ApiGetInt(docId, frameId, FP_Alignment));
			 appendBool("Cropped", F_ApiGetInt(docId, frameId, FP_AFrameIsCropped));
			 appendBool("Floating", F_ApiGetInt(docId, frameId, FP_AFrameIsFloating));
			 break;
		 case FV_ANCHOR_INLINE:
			 appendPoint("Baseline Offset",
						F_ApiGetMetric(docId, frameId, FP_BaselineOffset));
			 break;
		 case FV_ANCHOR_SUBCOL_LEFT:
		 case FV_ANCHOR_SUBCOL_RIGHT:
		 case FV_ANCHOR_SUBCOL_NEAREST:
		 case FV_ANCHOR_SUBCOL_FARTHEST:
			 appendInch("Baseline Offset",
						F_ApiGetMetric(docId, frameId, FP_BaselineOffset));
			 appendInch("Near-Side Offset",
						F_ApiGetMetric(docId, frameId, FP_SideOffset));
			 break;
		}
	 appendInch("Width", F_ApiGetMetric(docId, frameId, FP_Width));
	 appendInch("Height", F_ApiGetMetric(docId, frameId, FP_Height));

	 /* Start a new paragraph for the next aframe */
	 textLoc.objId = F_ApiNewSeriesObject(reportDocId, FO_Pgf, textLoc.objId);
	 textLoc.offset = 0;
	 return(retcode);
}

/* List the position of the anchored frame */
VoidT appendAnchorType(IntT type)
{
	 switch (type)
		{
		 case FV_ANCHOR_INLINE:
			 F_Sprintf(text, "Position\010At Insertion Point");
			 break;
		 case FV_ANCHOR_TOP:
			 F_Sprintf(text, "Position\010At Top of Column");
			 break;
		 case FV_ANCHOR_BELOW:
			 F_Sprintf(text, "Position\010Below Current Line");
			 break;
		 case FV_ANCHOR_BOTTOM:
			 F_Sprintf(text, "Position\010At Bottom of Column");
			 break;
		 case FV_ANCHOR_SUBCOL_LEFT:
			 F_Sprintf(text, "Position\010Left Side of Column");
			 break;
		 case FV_ANCHOR_SUBCOL_RIGHT:
			 F_Sprintf(text, "Position\010Right Side of Column");
			 break;
		 case FV_ANCHOR_SUBCOL_NEAREST:
			 F_Sprintf(text, "Position\010Side Closest to Page Edge");
			 break;
		 case FV_ANCHOR_SUBCOL_FARTHEST:
			 F_Sprintf(text, "Position\010Side Farthest from Page Edge");
			 break;
		}
	 F_ApiAddText(reportDocId, &textLoc, text);
	 textLoc.offset += F_StrLen(text);
}

/* List the alignment of the anchored frame */
VoidT appendAlignment(IntT align)
{
	 /* Put in a hard return to end previous line and a tab */
	 F_ApiAddText(reportDocId, &textLoc, "\011\010");
	 textLoc.offset += 2;

	 switch (align)
		{
		 case FV_ALIGN_LEFT:
			 F_Sprintf(text, "Alignment\010Left");
			 break;
		 case FV_ALIGN_CENTER:
			 F_Sprintf(text, "Alignment\010Center");
			 break;
		 case FV_ALIGN_RIGHT:
			 F_Sprintf(text, "Alignment\010Right");
			 break;
		}
	 F_ApiAddText(reportDocId, &textLoc, text);
	 textLoc.offset += F_StrLen(text);
}

#define yes "Yes"
#define no  "No"

VoidT appendBool(StringT s, IntT val)
{
	 /* Put in a hard return to end previous line and a tab */
	 F_ApiAddText(reportDocId, &textLoc, "\011\010");
	 textLoc.offset += 2;

	 if (!val)
		 F_Sprintf(text, "%s\010%s", s, no);
	 else
		 F_Sprintf(text, "%s\010%s", s, yes);
	 F_ApiAddText(reportDocId, &textLoc, text);
	 textLoc.offset += F_StrLen(text);
}

VoidT appendInch(StringT s, MetricT val)
{
	 MetricT inches;
	 RealT finches;

	 /* Put in a hard return to end previous line and a tab */
	 F_ApiAddText(reportDocId, &textLoc, "\011\010");
	 textLoc.offset += 2;

	 /* Convert to inches */
	 inches = F_MetricDiv(val, INCH);
	 finches = (RealT) F_MetricToFloat(inches);

	 F_Sprintf(text, "%s\010%.2f\"", s, finches);
	 F_ApiAddText(reportDocId, &textLoc, text);
	 textLoc.offset += F_StrLen(text);
}

VoidT appendPoint(StringT s, MetricT val)
{
	 MetricT points;
	 RealT fpoints;

	 /* Put in a hard return to end previous line and a tab */
	 F_ApiAddText(reportDocId, &textLoc, "\011\010");
	 textLoc.offset += 2;

	 /* Convert to points */
	 points = F_MetricDiv(val, POINT);
	 fpoints = (RealT) F_MetricToFloat(points);

	 F_Sprintf(text, "%s\010%.2f pt", s, fpoints);
	 F_ApiAddText(reportDocId, &textLoc, text);
	 textLoc.offset += F_StrLen(text);
}

/* List the page number of the anchor in the report */
VoidT appendPageNumber()
{
	 StringT pagenum;

	 pagenum = F_ApiGetString(docId, pageId, FP_PageNumString); 
	 F_Sprintf(text, "%s\010", pagenum);
	 F_ApiAddText(reportDocId, &textLoc, text);
	 textLoc.offset += F_StrLen(text);
}
