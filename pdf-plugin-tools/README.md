# PDF-PLUGIN-TOOLS - A toolkit for Acrobat® plug-in development in Common Lisp

## Preparing `fli.lisp`, etc.

### Download the SDK Headers

The needed Acrobat® SDK headers can be downloaded from
[Acrobat Developer Home](https://opensource.adobe.com/dc-acrobat-sdk-docs/acrobatsdk/).

Extract it somewhere on your disk. Then call `(prepare:prepare)` after loading `:prepare-pdf-plugin-tools` (Of course, you must register the folder `pdf-plugin-tools` into your local
[Quicklisp](https://www.quicklisp.org/beta/) environment first.)

## Compatibility with Acrobat® versions

The following Acrobat® versions are confirmed working:

- Acrobat® Pro XI (Windows, x86)
- Acrobat® Pro 2017 classic track (Windows, x86)
- Acrobat® Pro 2017 classic track (macOS, x86_64)

The following Acrobat® versions are confirmed NOT working:

- Acrobat® Pro XI (macOS, 32-bit)

NOTE: The new macOS arm64 plug-ins are completely untested. The author doesn't have any M1 Mac, nor have any Acrobat® Pro DC Continuous Track versions.

## Compatibility with Acrobat® SDKs

The following Acrobat® SDK versions are confirmed working:

- Acrobat® SDK 2021v3

## Compatibility with LispWorks® SDKs

The following LispWorks® versions are confirmed working: (7.0 or later is recommended)

- LispWorks 6.0
- LispWorks 6.1
- LispWorks 7.0
- LispWorks 8.0

(NOTE: The bitness of LispWorks® must match the bitness of Acrobat® plug-ins, which in turn
must match the bitness of Acrobat® versions. LispWorks® professional editions are enough, no enterprise features are needed.)
