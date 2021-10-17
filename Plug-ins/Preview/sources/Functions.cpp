//
//  Functions.cpp
//  Bookmarks
//
//  Created by Chun Tian on 21/11/19.
//
//

// Acrobat Headers.
#ifndef MAC_PLATFORM
#include "PIHeaders.h"
#endif

#include <string.h>
#include <stdio.h>
#include "Functions.hpp"
#include "Window.h"

/* New feature: link preview (like those in TeXShop) */
static AVAnnotHandlerCursorEnterProc OldCursorEnter = NULL;
static AVAnnotHandlerCursorExitProc OldCursorExit = NULL;

void ShowPreview (PDViewDestination dest)
{
    // AVAlertNote("Found a valid PDViewDestination.");
#if 0
    AVWindow window = AVWindowNew(AVWLpopup /* layer */,
                                  NULL /* flags */,
                                  NULL /* handler */,
                                  gExtensionID /* owner */);
    AVWindowShow(window);

    WindowRef window_ref = CreateMacWindow();
    // (New in Acrobat 5.0) A popup window without a caption, a one-pixel border and drop shadow.
    AVWindow window =
        AVWindowNewFromPlatformThing(AVWLpopup /* layer */,
                                     NULL /* flags */,
                                     NULL /* handler */,
                                     gExtensionID /* owner */,
                                     reinterpret_cast<AVPlatformWindowRef>(window_ref));
    AVWindowShow(window);
#endif
}

ACCB1 void ACCB2
DoCursorEnter (AVAnnotHandler annotHandler, PDAnnot anAnnot, AVPageView pageView)
{
    AVDoc avDoc = AVPageViewGetAVDoc(pageView);
    PDDoc doc = AVDocGetPDDoc(avDoc);
    PDLinkAnnot linkAnnot = CastToPDLinkAnnot(anAnnot);
    PDAction action = PDLinkAnnotGetAction(linkAnnot);
    if (PDActionIsValid(action)) {
        ASAtom subtype = PDActionGetSubtype(action);
        if (subtype == ASAtomFromString("GoTo")) {
            PDViewDestination dest = PDActionGetDest(action);
            // for possibly named destinations, it must be resolved using a PDDoc
            if (!PDViewDestIsValid(dest)) {
                dest = PDViewDestResolve(dest, doc);
            }
            if (PDViewDestIsValid(dest)) {
                ShowPreview(dest);
            }
        } else {
            if (OldCursorEnter) {
                OldCursorEnter(annotHandler, anAnnot, pageView);
            }
        }
    }
}

ACCB1 void ACCB2
DoCursorExit (AVAnnotHandler annotHandler, PDAnnot anAnnot, AVPageView pageView)
{
    // AVAlertNote("DoCursorExit is called!");
}

void RegisterLinkHandlers ()
{
    /* Get the existing handler for link annotations */
    AVAnnotHandler gAVAnnotHandler = AVAppGetAnnotHandlerByName(ASAtomFromString("Link"));

    /* Adding CursorEnter and CursorExit callbacks */
    OldCursorEnter = gAVAnnotHandler->CursorEnter;
    OldCursorExit = gAVAnnotHandler->CursorExit;
    gAVAnnotHandler->CursorEnter =
        ASCallbackCreateProto(AVAnnotHandlerCursorEnterProc, &DoCursorEnter);
    gAVAnnotHandler->CursorExit =
        ASCallbackCreateProto(AVAnnotHandlerCursorExitProc, &DoCursorExit);

    AVAppRegisterAnnotHandler(gAVAnnotHandler);
    
    // CreateWindow();
}
