///////////////////////////////////////////////////////////////////////
//  Copyright 2019 by WindJack Solutions, Inc.
//
//  **TERMS of USE:
//
//  By downloading and installing this automation tool
//  from pdfscriping.com you are agreeing to the following
//  terms of use.
//
//  The code in this file is provided as a download tool
//  for paying members of pdfscripting.com. It is intended
//  to be used as both a working tool and as a learning
//  example.
//
//  By using this tool you agree to the following terms.
//  1.  You will not modify or remove this usage agreement
//  2.  You will not resell or distribute this tool for
//      profit.
//  3.  You will not distribute this tool to any person
//      or organization that is not a current member of
//      pdfscripting.com.
//
//  You may:
//  1. Use this tool on your own computers for any purpose you
//     desire, as long as you are the person doing it.
//  2. Examine and modify this script for your own purposes.
//  3. Use it as an example for building your own Automation
//     tools.  Which because they are your own, may be distributed
//     for commercial use.
//
//////////////////////////////////////////////
//
//  ** GENERAL INSTALLATION INSTRUCTIONS:
//
//  ONLINE INSTRUCTIONS: https://www.pdfscripting.com/public/Installing_Automation_Tools.cfm
//
//  This Acrobat Automation Script will only work when
//  placed in one of the Acrobat JavaScript Folders. Execute
//  the following code from the Acrobat JavaScript Console to find
//  the location of the JavaScript folders.
//
//  To display the Acrobat JavaScript Console use Ctrl+J on
//  Windows and Command+J on the Mac
//
//      app.getPath("user","javascript");
//
//      app.getPath("app","javascript");
//
//  On Windows, the application JavaScript folder is usually located at:
//
//  C:\Program Files\Adobe\Acrobat 8.0\Acrobat\JavaScripts
//
//  On Mac, the application JavaScript folder is in a configuration file
//  inside the Acrobat Application Package.
//
//  The script file can be placed in either the "User" or "App" JavaScript
//  folder.
//
//  This script will place a toolbar button on the "Add-ons" toolbar
//  in Acrobat or Adobe Reader. If this toolbar is not visible then
//  Right click on an empty part of the Acrobat toolbar area and select
//  "Add-ons".
//
//  JavaScript toolbar buttons were added to Acrobat in version 6. However,
//  most automation scripts are intended to be used with Acrobat 7 or later.
//  This particular script may contain functionality that prevents it from
//  being used in ADobe Reader.  See comments in the JavaScript File for details.
//
//<AcroButtons name="JSDebugger" version="2.0" "modified="4/4/2005 11:21:23" id="3:11:2005:13:49:31">
// This script was created by AcroButtons from Windjack Solutions, www.windjack.com
// Do not modify the code inbetween the AcroButtons Tags
// Moving or changing tag positions can compromise AcroButtons' ability to handle
// this file
// Place Extra-AcroButton Code in the following "Code Above" Section
//

///////////////////////////////////////////////////////////////////////
//
//  Display Acrobat Debugger/Console Tool botton
//
//  Requires Acrobat Reader or Standard, version 7 or later.
//
//  This button uses the console.show() fucntion to display the console
//  Window in Adobe Reader.  In order to work the standard "debugger.js"
//  file must be installed in the Reader JavaScript folder.
//
//  The Console window was added to Adobe Reader and Acrobat Standard
//  in Version 7.0 and later.  The button will not work in earlier versions
//  of Reader.
//

var strData7JSDebugger =
"00C0C0C000C0C0C000C0C0C0FF919191FF7F4435FF5F3E3800C0C0C000C0C0C000C0C0C000C0C0C0" +
"FF919191FF91919100C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF919191FF7F2516FF573730FF60606000C0C0C000C0C0C000C0C0C0" +
"FF7F2E1AFF741600FF60606000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF00000000C0C0C000C0C0C0" +
"FF606060FF60606000C0C0C0FF60606000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF60606000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF60606000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF60606000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C0FF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF919191FF606060" +
"00C0C0C000C0C0C000C0C0C000C0C0C0FF606060FF91919100C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF606060FF606060FF000000" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF60606000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF606060FFFFFFFFFFD3D3D3FF000000" +
"FF606060FF000000FF000000FF60606000C0C0C0FF60606000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF91919100BFBFBFFF000000FF7F7F7FFFA7A7A7" +
"FF3F3F3FFFF3F6F3FFE8EDE8FF888A88FF606060FF60606000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF606060FFD3D3D3FFFFFFFFFFFFFFFFFF000000" +
"FFFFFFFFFF000000FFFFFFFFFFE8EDE8FFA7A7A7FF00000000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF606060FF69443CFF7F3524FF7F1F0BFF000000" +
"FFE8EDE8FF7F7F7FFFFFFFFFFFDDE4DDFFA7A7A7FF00000000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF919191FF7F2516FFBF482FFFFF4C28FFFF3300FFDC2900FF520F00" +
"FF888A88FFE8EDE8FFD2DCD2FFB1B4B1FF535353FF00000000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF606060FFFF6B49FFFF4A2CFFFF3300FFD12600FFD12600FFA51F00" +
"FF681300FFA7A7A7FFA7A7A7FF535353FFD12600FF7F251600C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF7F2516FFFF6B49FFFF3300FFE82C00FFD12600FFD12600FFD12600" +
"FFBB2200FF741600FF7F1900FFBF3F28FFFF4F24FFDC2F0BFF60606000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF7F2516FFFF4A2CFFFF3300FFE82C00FFD12600FFFF3300FFFF3300" +
"FFFF3300FFFF3300FFFF3300FF520F00FFFF3300FFD12600FF68130000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF741C0BFFE83816FFE8320BFFE82C00FFE82C00FFE82C00FFE82C00" +
"FF9C1C00FF7F1900FF520F00FFB02000FFBB2200FFBB2200FF68130000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF919191FF606060FF606060FF303030FF520F00FF520F00FF520F00" +
"FF7B1700FFBB2200FFBB2200FFD12600FF000000FFD12600FF60606000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000FFD12600FFD12600" +
"FFFF3300FFFF3300FFD12600FF681300FFA51F00FF68130000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF606060FF681300" +
"FF681300FF681300FF681300FF861900FFD12600FF60606000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF000000FFBB2200FFFF3300FF60606000C0C0C000C0C0C000C0C0C000C0C0C0";

// Icon Generic Stream Object
var oIconJSDebugger = null;
oIconJSDebugger = {count: 0, width: 20, height: 20,
read: function(nBytes){return strData7JSDebugger.slice(this.count, this.count += nBytes);}};
var DoCmdJSDebugger = "console.show();";
var oButObjJSDebugger =
{cName: "JSDebugger",
cExec: DoCmdJSDebugger,
cEnable: "event.rc = true",
cMarked: "event.rc = false",
cTooltext: "Display JS Debugger",
nPos: -1,
cLabel: "Debugger"};
if (oIconJSDebugger != null) {
    oButObjJSDebugger.oIcon = oIconJSDebugger;
}

// try{app.removeToolButton("JSDebugger");}catch(e){}
try{app.addToolButton(oButObjJSDebugger);}catch(e){}
