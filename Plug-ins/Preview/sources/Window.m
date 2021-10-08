//
//  Window.m
//  Bookmarks_debug
//
//  Created by Chun Tian on 2021/10/4.
//

#import <Cocoa/Cocoa.h>
#import "Window.h"

static NSWindow *PreviewWindow = NULL;

WindowRef CreateWindow ()
{
    NSWindow *ns_window = [[NSWindow alloc] init];
    WindowRef window_ref = (WindowRef) [ns_window windowRef];
    PreviewWindow = ns_window;
    /*
    AVWindow av_window =
        AVWindowNewFromPlatformThing (AVWLmodal, NULL, NULL, gExtensionID,
                                      reinterpret_cast<AVPlatformWindowRef>(window_ref));
     */
    return window_ref;
}

void DestroyWindow ()
{
    [PreviewWindow release];
}
