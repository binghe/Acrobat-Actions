//
//  Window.m
//  Bookmarks_debug
//
//  Created by Chun Tian on 2021/10/4.
//

#import <Cocoa/Cocoa.h>
#import "Window.h"

static NSWindow *PreviewWindow = NULL;

WindowRef CreateMacWindow ()
{
    NSWindow *window = [[NSWindow alloc] init];
    WindowRef window_ref = (WindowRef) [window windowRef];
    return window_ref;
}

void DestroyWindow ()
{
    [PreviewWindow release];
}
