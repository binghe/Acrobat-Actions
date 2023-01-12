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
 *	    badlinks
 *
 * General Description:
 *		Generates a document that lists unresolved hypertext links.
 *		The page number and marker text of any hypertext markers	
 *		that link to documents, pages, xrefs, or objects that can't
 *		be found are listed. 
 *
 *		The user may wish to modify initOpenParams to be more strict
 *		about opening documents (i.e. don't open documents created
 *		in older versions of maker, or don't open documents whose
 *		fontmetrics changed or referenced files are missing.)
 *
 *		Look in the console for messages on why a doc failed to open.
 *		It would be nice if these messages showed up in the doc report.
 *
 * Invocation:
 *		From the document you wish to generate the report, bring
 *		up File->Utilities->Document Reports. Select badlinks in
 *		the scroll list and hit Report.
 *
 *	Install Info (UNIX):
 *		If you compile this as an RPC client (the default),
 *		add these lines to the apiclients file:
 *
 *		<APIclient
 *			<Name badlinks>
 *			<Type Report>
 *			<Description Find the unresolved hypertext links in the document>
 *			<Directory fdk_install_dir/samples/badlinks>
 *			<CommandLine $FAPIDIR/fa.badlinks>
 *			<Products Maker>
 *		>
 *
 *		Replace fdk_install_dir with the path of the directory in
 *		which you installed your copy of the FDK files.
 *
 *		If you compile this as a dynamic client, change the line
 *			<CommandLine $FAPIDIR/fa.badlinks>
 *		to:
 *			<SharedLibrary fa.badlinks.dl>
 *
 *		Restart maker.
 *
 *	Install Info (Windows):
 *		Add the following entry (all on one line) to the [APIClients]
 *		section of your  maker.ini file:
 *
 *		badlinks=DocReport,Find the unresolved hypertext links in the document,
 *			fdk_install_dir\samples\badlinks\debug\badlinks.dll, all
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
#include "fprogs.h"
#include "futils.h"
#include "cutils.h"
#include "fencode.h"

#define INCH 	((MetricT)0x480000)
#define Success	0

/* Global vars */
F_ObjHandleT activeDocId, reportDocId, markerId;
F_ObjHandleT hypertextMarkerTypeId, xrefMarkerTypeId;
F_TextLocT textLoc;	/* in report doc */
UCharT commandName[20];
StrBuffT docFileName, linkSpec;
StringT markerText;
F_PropValsT *openParamsp, openParams;
BoolT openStatus;
/* This variable holds the location of where to jump to */
typedef struct {
	 IntT linkType;
#define LINK_TO_NEWLINK		0
#define LINK_TO_PAGENUM		1
#define LINK_TO_MARKERTEXT	2
#define LINK_TO_OBJECTID	3
#define LINK_TO_FIRSTPAGE	4
#define LINK_TO_LASTPAGE	5
	 F_ObjHandleT docId;
	 F_ObjHandleT objType, objId;
	 IntT pageNum, pointPageNum;
	 StrBuffT text;
} SomewhereT;
SomewhereT somewhere;


/*****************************  Prototypes  ******************************/
IntT verifyNextOrPrevPage FARGS((IntT nextOrPrev));
F_ObjHandleT getMarkerPageId FARGS((F_ObjHandleT markerId));
F_ObjHandleT getPageId FARGS((F_ObjHandleT docId, F_ObjHandleT graphicId));
VoidT parseMarkerText FARGS((VoidT));
VoidT parseLinkSpec FARGS((VoidT));
F_ObjHandleT markerTypeNumToId(IntT markerTypeNum);
VoidT scanPageNum FARGS((VoidT));
VoidT initOpenParams FARGS((VoidT));
BoolT openDestDoc FARGS((VoidT));
IntT verifySomewhere FARGS((VoidT));
IntT markerExists FARGS((IntT docId, F_ObjHandleT wantedMarkerTypeId, StringT markerText));
IntT pageExists FARGS((IntT docId, IntT pagenum));
IntT markerIdExists FARGS((IntT docId, IntT markerId));
IntT graphicExists FARGS((IntT docId, IntT graphicId));
IntT textinsetExists FARGS((IntT docId, IntT textinsetId));
IntT pgfExists FARGS((IntT docId, IntT pgfId));
IntT xrefExists FARGS((IntT docId, IntT xrefId));
IntT verifyObjectId FARGS((VoidT));
IntT newReportDoc FARGS((VoidT));
VoidT setTabsOnBody FARGS((VoidT));
IntT reportUnresolvedLink FARGS((VoidT));
F_ObjHandleT markerTypeNumToId FARGS((IntT markerTypeNum));


VoidT F_ApiInitialize(init)
IntT init;
{
	 F_ObjHandleT markerTypeId;
	 IntT retcode=Success;

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
	 activeDocId = F_ApiGetId(0,FV_SessionId,FP_ActiveDoc);
	 
	 /* some Ids for some special marker types */
	 /* Note: "Hypertext" is localized in this case. We should use FP_InvariantName */
	 hypertextMarkerTypeId = F_ApiGetNamedObject(activeDocId,FO_MarkerType,"Hypertext");
	 xrefMarkerTypeId = F_ApiGetNamedObject(activeDocId,FO_MarkerType,"Cross-Ref");

	 /* Turn off formatting and display */
	 F_ApiSetInt(0, FV_SessionId, FP_Reformatting, False);
	 F_ApiSetInt(0, FV_SessionId, FP_Displaying, False);

	 /* Only generate the report doc if there's something to report */
	 reportDocId = 0;

	 /* Set up open doc params */
	 initOpenParams();

	 /* For each marker in the document... */
	 markerId = F_ApiGetId(FV_SessionId,activeDocId,FP_FirstMarkerInDoc);
	 while (markerId && hypertextMarkerTypeId)
		{
		 /* Look only at hypertext markers */
		 markerTypeId = F_ApiGetId(activeDocId, markerId, FP_MarkerTypeId);
		 if (markerTypeId == hypertextMarkerTypeId)	/* Hypertext marker type */
			{
			 markerText = F_ApiGetString(activeDocId, markerId, FP_MarkerText);

			 /* Grab the first part of the marker text */
			 F_Sscanf(markerText, "%s", commandName);

			 /* nextpage and previous page don't require further parsing */
			 if (F_StrEqual(commandName, "nextpage"))
				{
				 retcode = verifyNextOrPrevPage(FP_PageNext);
				 if (retcode != Success)
					 goto done;
				}
			 else if (F_StrEqual(commandName, "previouspage"))
				{
				 retcode = verifyNextOrPrevPage(FP_PagePrev);
				 if (retcode != Success)
					 goto done;
				}

			 /* The other commands do */
			 else
				{
				 if (F_StrEqual(commandName, "gotolink") ||
						F_StrEqual(commandName, "openlink"))
					 somewhere.linkType = LINK_TO_NEWLINK;

				 else if (F_StrEqual(commandName, "gotoObjectId") ||
							F_StrEqual(commandName, "openObjectId"))
					 somewhere.linkType = LINK_TO_OBJECTID;

				 else if (F_StrEqual(commandName, "gotoXRef") ||
							F_StrEqual(commandName, "openXRef"))
					 somewhere.linkType = LINK_TO_MARKERTEXT;

				 else if (F_StrEqual(commandName, "gotopage") ||
							F_StrEqual(commandName, "openpage"))
					 somewhere.linkType = LINK_TO_PAGENUM;

				 else if (F_StrEqual(commandName, "alert") ||
					 F_StrEqual(commandName, "matrix") ||
					 F_StrEqual(commandName, "message") ||
					 F_StrEqual(commandName, "newlink") ||
					 F_StrEqual(commandName, "popup") ||
					 F_StrEqual(commandName, "previouslink") ||
					 F_StrEqual(commandName, "quit") ||
					 F_StrEqual(commandName, "quitall"))
					{
					 markerId = F_ApiGetId(activeDocId,markerId,FP_NextMarkerInDoc);
					 continue;
					}
				 else
					{/* Report unknown commands */
					 retcode = reportUnresolvedLink();
					 if (retcode != Success)
						 goto done;
					 markerId = F_ApiGetId(activeDocId,markerId,FP_NextMarkerInDoc);
					 continue;
					}

				 parseMarkerText();
				 parseLinkSpec();

				 /* Find the destination doc */
				 if (F_StrLenEnc(docFileName,fdeUTF8EncodingId) > 0)
					 openStatus = openDestDoc();	/* Sets somewhere.docId */
				 else
					 somewhere.docId = activeDocId;

				 /* Verify that the location exists */
				 retcode = verifySomewhere();
				 if (retcode != Success)
					 goto done;

				 if (somewhere.docId && somewhere.docId != activeDocId)
					{
					 if (!openStatus)
						F_ApiClose(somewhere.docId, FF_CLOSE_MODIFIED);
					 somewhere.docId = 0;
					}
				}

			 F_Free(markerText);
			}
		 markerId = F_ApiGetId(activeDocId,markerId,FP_NextMarkerInDoc);
		}

done:
	 /* If there were no unresolved links reported, put up an alert */
	 if (!reportDocId && retcode == Success)
		{
		 F_ApiAlert("There are no unresolved hypertext links to report!",FF_ALERT_CONTINUE_NOTE);
		}

	 /* Turn formatting, reformat, and turn display on again */
	 F_ApiSetInt(0, FV_SessionId, FP_Reformatting, True);
	 if (reportDocId)
		{
		 F_ApiReformat(reportDocId);
		 F_ApiSetInt(FV_SessionId, reportDocId, FP_IsOnScreen, True);
		}

	 if (openParamsp)
		 F_ApiDeallocatePropVals(openParamsp);

	 F_ApiSetInt(0, FV_SessionId, FP_Displaying, True);
	 F_ApiRedisplay(reportDocId);
	 F_ApiRedisplay(activeDocId);

	 F_ApiBailOut();
}

/* Verify that the next or previous page exists.
 * This is done only if the marker is on a body page.
 */
IntT verifyNextOrPrevPage(nextOrPrev)
IntT nextOrPrev;
{
	 F_ObjHandleT markerPageId, pageType, nextOrPrevPageId;
	 IntT retcode=Success;

	 markerPageId = getMarkerPageId(markerId);
	 pageType = F_ApiGetObjectType(activeDocId, markerPageId);

	 /* Only need to check next and previous when marker is on a body page */
	 if (pageType != FO_BodyPage)
		 return(Success);

	 if (nextOrPrevPageId = F_ApiGetId(activeDocId, markerPageId, nextOrPrev))
		 return(Success);

	 retcode = reportUnresolvedLink();
	 return(retcode);
}

/* Return the id of a marker's page */
F_ObjHandleT getMarkerPageId(markerId)
F_ObjHandleT markerId;
{
	 F_PropValsT markerProps;
	 F_ObjHandleT id, pageId;
	 UIntT i;

	 markerProps = F_ApiGetProps(activeDocId, markerId);
	 for (i = 0; i < markerProps.len; i++)
		{
		 if (markerProps.val[i].propIdent.num == FP_TextLoc)
			 break;
		}
	 if (i >= markerProps.len)
		 return(0);
	 id = markerProps.val[i].propVal.u.tlval.objId;
	 F_ApiDeallocatePropVals(&markerProps);
	 id = F_ApiGetId(activeDocId, id, FP_InTextObj);
	 pageId = getPageId(activeDocId, id);
	 return(pageId);
}

/* Return the id of a graphic's page */
F_ObjHandleT getPageId(docId, graphicId)
F_ObjHandleT docId, graphicId;
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
			 /* For table cell text columns and footnotes, get the parent text column */
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

/* Search for
	commandName docFileName : linkSpec
	commandName docFileName:linkSpec
	commandName docFileName: linkSpec
	commandName linkSpec

   in the marker text, where docFileName is a unix path name.
*/
VoidT parseMarkerText()
{
	 StringT mp, dp, lp;

	 docFileName[0] = linkSpec[0] = 0;

	 /* Skip over the command */
	 mp = markerText;
	 while (*mp && F_CharUTF8ToUTF32(mp) != (IntT)' ')
		 F_UTF8NextChar(&mp);

	 if (!*mp)
		 return;

	 /* Skip any spaces */
	 while (*mp && F_CharUTF8ToUTF32(mp) == (IntT)' ')
		 F_UTF8NextChar(&mp);

	 if (!*mp)
		 return;

	 /* Check for no colon */
	 lp = mp;
	 for (; *mp; F_UTF8NextChar(&mp))
		{
		 if (F_CharUTF8ToUTF32(mp) == (IntT)':')
			 break;
		}

	 /* No colon */
	 if (F_CharUTF8ToUTF32(mp) != (IntT)':')
		{
		 F_StrCpyN(linkSpec, lp, STRBUFFSIZE);
		 return;
		}

	 /* Copy characters up until the next space or colon */
	 mp = lp;
	 dp = docFileName;
	 while (*mp && F_CharUTF8ToUTF32(mp) != (IntT)' ' && F_CharUTF8ToUTF32(mp) != (IntT)':')
		{
		 F_StrCpyN(dp, mp, F_UTF8CharSize(*mp));
		 F_UTF8NextChar(&dp);
		 F_UTF8NextChar(&mp);
		}
	 *dp = 0;
	 F_UTF8NextChar(&mp);

	 /* Copy the rest into the link spec */
	 F_StrCpyN(linkSpec, mp, STRBUFFSIZE);
}

/* Use the link spec portion of the original marker text appropriately. */
VoidT parseLinkSpec()
{
	 IntT	markerTypeNum;
	 
	 if (F_StrEqual(linkSpec, "firstpage"))
		{
		 somewhere.linkType = LINK_TO_FIRSTPAGE;
		 return;
		}
	 else if (F_StrEqual(linkSpec, "lastpage"))
		{
		 somewhere.linkType = LINK_TO_LASTPAGE;
		 return;
		}

	 switch (somewhere.linkType)
		{
		 case LINK_TO_NEWLINK:
			 F_StrCpyN(somewhere.text, "newlink ", STRBUFFSIZE);
			 F_StrCatN(somewhere.text, linkSpec, STRBUFFSIZE);
			 somewhere.objType = hypertextMarkerTypeId;
			 break;
		 case LINK_TO_PAGENUM:
			 scanPageNum();
			 break;
		 case LINK_TO_MARKERTEXT:
			 F_StrCpyN(somewhere.text, linkSpec, STRBUFFSIZE);
			 somewhere.objType = xrefMarkerTypeId;
			 break;
		 case LINK_TO_OBJECTID:
             F_Sscanf(linkSpec, "%d %d", &markerTypeNum, &somewhere.objId);
			 somewhere.objType = markerTypeNum;
			 /* can return 0 */
			 break;
		}
}

F_ObjHandleT markerTypeNumToId(IntT markerTypeNum)
{
	F_ObjHandleT mtId;
	
	mtId = F_ApiGetId(FV_SessionId,activeDocId,FP_FirstMarkerTypeInDoc);
	while(mtId)
	{
		if(F_ApiGetInt(activeDocId, mtId, FP_OldTypeNum) == markerTypeNum)
			return(mtId);
		mtId = F_ApiGetId(activeDocId,mtId,FP_NextMarkerTypeInDoc);
	}
	return(0);
}

/* Expecting a page number in either of these forms: n or n.p */
VoidT scanPageNum()
{
	/* This works only for ASCII page numbers. */
	 StringT lp;
	 IntT dots=0;

	 lp = linkSpec;
	 while (*lp)
		{
		 if (F_CharUTF8ToUTF32(lp) == (IntT)'.')
			 dots++;
		 F_UTF8NextChar(&lp);
		}
	 switch (dots)
		{
		 case 0:
			 F_Sscanf(linkSpec, "%d", &somewhere.pageNum);
			 somewhere.pointPageNum = 0;
			 break;
		 case 1:
			 F_Sscanf(linkSpec, "%d.%d", &somewhere.pageNum,
											&somewhere.pointPageNum);
			 break;
		 default:
			 somewhere.pageNum = somewhere.pointPageNum = 0;
		}
}

/*    Set up open doc params.                                        */
/*    The user may wish to modify initOpenParams to be more strict   */
/*    about opening documents (i.e. don't open documents created     */
/*    in older versions of maker, or don't open documents whose      */
/*    fontmetrics changed or referenced files are missing.)          */
/*    Look in the console for messages on why a doc failed to open.  */
/*    It would be nice if these messages showed up in the doc report.*/
VoidT initOpenParams()
{
	 IntT i;

	 openParams = F_ApiGetOpenDefaultParams();
	 openParamsp = &openParams;

	 /* Don't make the doc visible */
	 i = F_ApiGetPropIndex(openParamsp, FS_MakeVisible);
	 openParamsp->val[i].propVal.u.ival = False;

	 /* Open as a view only doc */
	 i = F_ApiGetPropIndex(openParamsp, FS_OpenDocViewOnly);
	 openParamsp->val[i].propVal.u.ival = True;

	 /* Allow for docs from older versions of maker */
	 i = F_ApiGetPropIndex(openParamsp, FS_FileIsOldVersion);
	 openParamsp->val[i].propVal.u.ival = FV_DoOK;

	 /* Allow for docs with changed font metrics */
	 i = F_ApiGetPropIndex(openParamsp, FS_FontChangedMetric);
	 openParamsp->val[i].propVal.u.ival = FV_DoOK;

	 /* Allow for docs with unavailable fonts */
	 i = F_ApiGetPropIndex(openParamsp, FS_FontNotFoundInCatalog);
	 openParamsp->val[i].propVal.u.ival = FV_DoOK;

	 /* Allow for docs with unavailable fonts in the catalog */
	 i = F_ApiGetPropIndex(openParamsp, FS_FontNotFoundInCatalog);
	 openParamsp->val[i].propVal.u.ival = FV_DoOK;

	 /* Allow for docs with unavailable fonts */
	 i = F_ApiGetPropIndex(openParamsp, FS_FontNotFoundInDoc);
	 openParamsp->val[i].propVal.u.ival = FV_DoOK;

	 /* Allow for docs with unavailable languages */
	 i = F_ApiGetPropIndex(openParamsp, FS_LanguageNotAvailable);
	 openParamsp->val[i].propVal.u.ival = FV_DoOK;

	 /* Allow for docs whose referenced files cannot be found */
	 i = F_ApiGetPropIndex(openParamsp, FS_RefFileNotFound);
	 openParamsp->val[i].propVal.u.ival = FV_AllowAllRefFilesUnFindable;

	 /* Use the last officially saved version, and don't cancel the open operation */
	 i = F_ApiGetPropIndex(openParamsp, FS_UseAutoSaveFile);
	 openParamsp->val[i].propVal.u.ival = FV_DoNo;
}

/*
 * Find and attempt to open the destination doc.
 * If open fails, the link is considered unresolved.
 */
BoolT openDestDoc()
{
	 StrBuffT fullPathName;
	 F_PropValsT *openReturnParamsp = NULL;
	 StringT docname;
	 FilePathT *filePath, *parentPath;
	 IntT status;

	 openStatus = False;
	 if (docFileName[0] == '/' || docFileName[0] == '~' ||
											 docFileName[0] == '$')
		{
		 /* Absolute path name */
		 somewhere.docId = F_ApiOpen(docFileName, openParamsp, &openReturnParamsp);
		 if (!somewhere.docId)
			{
			 F_Printf(NULL, "\n%s\n", docFileName);
			 F_ApiPrintOpenStatus(openReturnParamsp);
			}
		 if (F_ApiCheckStatus(openReturnParamsp, FV_FileAlreadyOpen))
			 openStatus = True;
		 else
			 openStatus = False;
		 F_ApiDeallocatePropVals(openReturnParamsp);
		 return openStatus;
		}

	 /* Look in the directory that the active doc is in. */
	 docname = F_ApiGetString(activeDocId, activeDocId, FP_Name);

	 filePath = F_PathNameToFilePath(docname, NULL, FDefaultPath);
	 F_Free(docname);

	 parentPath = F_FilePathParent(filePath, &status);
	 F_FilePathFree(filePath);

	 filePath = F_PathNameToFilePath(docFileName, parentPath, FDefaultPath);
	 F_FilePathFree(parentPath);

	 docname = F_FilePathToPathName(filePath, FDefaultPath);
	 F_FilePathFree(filePath);

	 F_StrCpyN(fullPathName, docname, STRBUFFSIZE);
	 F_Free(docname);

	 somewhere.docId = F_ApiOpen(fullPathName, openParamsp, &openReturnParamsp);
	 if (!somewhere.docId)
		{
		 F_Printf(NULL, "\n%s\n", fullPathName);
		 F_ApiPrintOpenStatus(openReturnParamsp);
		}
	 if (F_ApiCheckStatus(openReturnParamsp, FV_FileAlreadyOpen))
		openStatus = True;
	 else
		 openStatus = False;
	 F_ApiDeallocatePropVals(openReturnParamsp);
	 return openStatus;
}

/* Verify that the location exists in the document */
IntT verifySomewhere()
{
	 IntT retcode = Success;

	 if (!somewhere.docId)
		{
		 retcode = reportUnresolvedLink();
		 return(retcode);
		}
	 switch (somewhere.linkType)
		{
		 case LINK_TO_NEWLINK:
			 if (!markerExists(somewhere.docId, somewhere.objType,
														somewhere.text))
				 retcode = reportUnresolvedLink();
			 break;
		 case LINK_TO_PAGENUM:
			 if (!pageExists(somewhere.docId, somewhere.pageNum))
				 retcode = reportUnresolvedLink();
			 break;
		 case LINK_TO_MARKERTEXT:
			 if (!markerExists(somewhere.docId, somewhere.objType,
														somewhere.text))
				 retcode = reportUnresolvedLink();
			 break;
		 case LINK_TO_OBJECTID:
			 retcode = verifyObjectId();
			 break;
		 case LINK_TO_FIRSTPAGE:
		 case LINK_TO_LASTPAGE:
			 /* These ones always exist */
			 break;
		}
	 return(retcode);
}

/* Look for a marker of a particular type and text in the destination doc. */
IntT markerExists(docId, wantedMarkerTypeId, markerText)
IntT docId;
F_ObjHandleT wantedMarkerTypeId;
StringT markerText;
{
	 F_ObjHandleT mId, mTypeId;
	 StringT mText;

	 mId = F_ApiGetId(FV_SessionId, docId, FP_FirstMarkerInDoc);
	 while (mId)
		{
		 mTypeId = F_ApiGetId(docId, mId, FP_MarkerTypeId);
		 if(mTypeId == wantedMarkerTypeId)
		 	{
			 mText = F_ApiGetString(docId, mId, FP_MarkerText);
			 if (F_StrEqual(markerText, mText))
				 return(True);
			}
		 mId = F_ApiGetId(docId, mId, FP_NextMarkerInDoc);
		}
	 return(False);
}

/* See if the page number is within the range of pages of this document */
IntT pageExists(docId, pagenum)
IntT docId, pagenum;
{
	 IntT pageNum, lastPageId, id;

	 /* Compare against the starting page number */
	 pageNum = F_ApiGetInt(FV_SessionId, docId, FP_FirstPageNum);
	 if (pagenum < pageNum)
		 return(False);

	 /* Find the last page */
	 id = F_ApiGetId(FV_SessionId, docId, FP_MainFlowInDoc);
	 id = F_ApiGetId(docId, id, FP_FirstTextFrameInFlow);
	 id = getPageId(docId, id);
	 lastPageId = 0;
	 while (id)
		{
		 lastPageId = id;
		 id = F_ApiGetId(docId, id, FP_PageNext);
		}

	 /* Compare against the last page number */
	 pageNum = F_ApiGetInt(docId, lastPageId, FP_PageNum);
	 if (pagenum > pageNum)
		 return(False);

	 return(True);
}

/* Look for the marker with a given id */
IntT markerIdExists(docId, markerId)
IntT docId, markerId;
{
	IntT mId, uniqueId;

	mId = F_ApiGetId(FV_SessionId, docId, FP_FirstMarkerInDoc);
	while (mId)
		{
		 uniqueId = F_ApiGetInt(docId, mId, FP_Unique);
		 if (uniqueId == markerId)
			 return(True);
		 mId = F_ApiGetId(docId, mId, FP_NextMarkerInDoc);
		}
	 return(False);
}

/* Look for the graphic object with a given id */
IntT graphicExists(docId, graphicId)
IntT docId, graphicId;
{
	 IntT gId, uniqueId;

	 gId = F_ApiGetId(FV_SessionId, docId, FP_FirstGraphicInDoc);
	 while (gId)
		{
		 uniqueId = F_ApiGetInt(docId, gId, FP_Unique);
		 if (uniqueId == graphicId)
			 return(True);
		 gId = F_ApiGetId(docId, gId, FP_NextGraphicInDoc);
		}
	 return(False);
}

/* Look for the textinset object with a given id */
IntT textinsetExists(docId, textinsetId)
IntT docId, textinsetId;
{
	 IntT tiId, uniqueId;

	 tiId = F_ApiGetId(FV_SessionId, docId, FP_FirstTiInDoc);
	 while (tiId)
		{
		 uniqueId = F_ApiGetInt(docId, tiId, FP_Unique);
		 if (uniqueId == textinsetId)
			 return(True);
		 tiId = F_ApiGetId(docId, tiId, FP_NextTiInDoc);
		}
	 return(False);
}


/* Look for the paragraph with a given id */
IntT pgfExists(docId, pgfId)
IntT docId, pgfId;
{
	 IntT pId, uniqueId;

	 pId = F_ApiGetId(FV_SessionId, docId, FP_FirstPgfInDoc);
	 while (pId)
		{
		 uniqueId = F_ApiGetInt(docId, pId, FP_Unique);
		 if (uniqueId == pgfId)
			 return(True);
		 pId = F_ApiGetId(docId, pId, FP_NextPgfInDoc);
		}
	 return(False);
}

/* Look for the cross-reference with a given id */
IntT xrefExists(docId, xrefId)
IntT docId, xrefId;
{
	 IntT xId, uniqueId;

	 xId = F_ApiGetId(FV_SessionId, docId, FP_FirstXRefInDoc);
	 while (xId)
		{
		 uniqueId = F_ApiGetInt(docId, xId, FP_Unique);
		 if (uniqueId == xrefId)
			 return(True);
		 xId = F_ApiGetId(docId, xId, FP_NextXRefInDoc);
		}
	 return(False);
}

/* Verify that the object exists in the doc */
IntT verifyObjectId()
{
	 IntT retcode=Success;

	 switch (somewhere.objType)
		{
		 case FV_ObjectMarker:
			 if (!markerIdExists(somewhere.docId, somewhere.objId))
				 retcode = reportUnresolvedLink();
			 break;
		 case FV_ObjectPgf:
			 if (!pgfExists(somewhere.docId, somewhere.objId))
				 retcode = reportUnresolvedLink();
			 break;
		 case FV_ObjectXref:
			 if (!xrefExists(somewhere.docId, somewhere.objId))
				 retcode = reportUnresolvedLink();
			 break;
		 case FV_ObjectGraphic:
			 if (!graphicExists(somewhere.docId, somewhere.objId))
				 retcode = reportUnresolvedLink();
			 break;
		case FV_ObjectTextInset:
			 if (!textinsetExists(somewhere.docId, somewhere.objId))
				 retcode = reportUnresolvedLink();
			 break;
		 default:
			 retcode = reportUnresolvedLink();
		}
	 return(retcode);
}

/* Create the report document */
IntT newReportDoc()
{
	 MetricT width, height;
	 IntT id;

	 /* Start the report document */
	 width = (MetricT) 8.5 * INCH;
	 height = 11 * INCH;

	 reportDocId = F_ApiCustomDoc(width,height,1,0,INCH,INCH,INCH,INCH,FF_Custom_FirstPageRight,False);
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

/* Add the tabs to the Body paragraph format. */
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

/* List the page number of the anchor in the report */
IntT reportUnresolvedLink()
{
	 IntT markerPageId, pageType, retcode;
	 StringT pagenum;
	 UCharT unresolvedText[300];

	 /* Initialize the report document */
	 if (!reportDocId)
		{
		 retcode = newReportDoc();
		 if (retcode != Success)
			 return(retcode);
		}

	 markerPageId = getMarkerPageId(markerId);
	 pageType = F_ApiGetObjectType(activeDocId, markerPageId);
	 if (pageType == FO_BodyPage)
		 pagenum = F_ApiGetString(activeDocId, markerPageId, FP_PageNumString);
	 else
		 pagenum = F_ApiGetString(activeDocId, markerPageId, FP_Name);
	 F_Sprintf(unresolvedText, "%s\010%s", pagenum, markerText);
	 F_ApiAddText(reportDocId, &textLoc, unresolvedText);

	 /* Start a new paragraph */
	 textLoc.objId = F_ApiNewSeriesObject(reportDocId, FO_Pgf, textLoc.objId);
	 textLoc.offset = 0;
	 return(Success);
}
