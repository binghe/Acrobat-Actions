# Actions, Custom Commands and Preflights for Acrobat® Pro
Chun Tian (binghe)

Actions and Custom Commands for Adobe® Acrobat® Pro DC

## Compatibility with Adobe® Acrobat®

Use files in "zh-cn" for Acrobat® Pro DC 2015 in Simplified Chinese; use files in "en" for Acrobat® Pro DC 2015 in English. For Acrobat® Pro in other UI languages, some keywords in the actions may have to be changed.

The (Custom) Commands are new features since DC 2015, as single-step Actions. They're not supported in XI and prior versions.

## Usage

The main entry is Action Wizards (动作向导) in Acrobat Pro, where you can import Actions and Custom Commands.

To import a toolset into Acrobat DC, simply open that file (`*.aaui`).

NOTE: Some Actions and Commands require special Preflight profile (in this repository), which must be also imported.

## Acrobat® Plugin

Certain useful tasks are impossible to write with JavaScript, simply because Adobe didn't expose the related API to JS level. In this case, the work can be done by writing plugins in C. One such plugin is at `Plug-ins` folder.
