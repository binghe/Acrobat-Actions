---
author: Chun Tian
---

# Actions, Commands and Plug-ins for Adobe® Acrobat®

This repository offers some Actions, Custom Commands, Preflights, PDF Stamps, JavaScripts and Plug-ins (C/C++ and Common Lisp) for Adobe® Acrobat® - the de-facto standard viewer and editor for Adobe PDF (Portable Document Format) files.

## Compatibility with Acrobat® versions

Tested on Acrobat® Pro XI, DC (2015) and DC (2017), on Windows and Mac OS X.

Use files in "zh-cn" for Acrobat® Pro DC in Simplified Chinese; use files in "en" for Acrobat® Pro DC in English. For Acrobat® Pro in other UI languages, some keywords in the actions may have to be changed.  Most of them also work in Acrobat® Pro XI.

The (Custom) Commands are new features since DC 2015, as single-step Actions. They're not supported in XI and prior versions.

## Usage

The main entry is Action Wizards (动作向导) in Acrobat Pro, where you can import Actions and Custom Commands.

To import a toolset into Acrobat DC (2015 only), simply open that file (`*.aaui`). In Acrobat 2017 one can import custom tool sets normally.

NOTE: Some Actions and Commands require special Preflight profiles (in this repository), which must be also imported.

## Folder Level JavaScript

JavaScript code can be directly put into Acrobat's "JavaScripts" folder when initializing Acrobat. Usually they creates new menu entries or toolbar buttons, and they are superior than custom actions as JS code can provide user-defined icons, see `Highlights.js` for my first such work.

## Acrobat® Plug-ins in C/C++

Some PDF tasks are impossible to implement in JavaScript, because Adobe didn't expose the related APIs to JavaScript level. In this case, the work can be done by writing plugins in C/C++. One such plug-in is provided in the `Plug-ins` folder (for manipulating PDF bookmarks).

## Acrobat® Plug-ins in Common Lisp

It's possible to develop Acrobat® Plug-ins in more advanced dynamic languages like Lisp. A new plugin tools is under [pdf-plugin-tools](pdf-plugin-tools). This tool is inspired by Edi Weitz's [FM-PLUGIN-TOOLS](https://github.com/binghe/fm-plugin-tools).
