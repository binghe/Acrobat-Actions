///////////////////////////////////////////////////////////////////////
//  Copyright 2020 by Chun Tian (binghe) <binghe.lisp@gmail.com>
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
//  The script file can be placed in either the "user" or "app" JavaScript
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

var DoCmdhightlightRedL = app.trustedFunction(function(oDoc)
{
    var strokeColor = color.magenta;
    var opacity = 0.8;

    oDoc.syncAnnotScan();
    var annots = this.getAnnots(this.pageNum, ANSB_ModDate,
                                true, // bReverse
                                ANFB_ShouldAppearInPanel);

    if (annots != null) {
      for (var i = annots.length - 1; i >= 0; i--) {
        if (annots[i].type == "Highlight") {
          // go to next one if the current one is already in the right color
          if (!color.equal(annots[i].strokeColor, strokeColor)) {
              annots[i].opacity = opacity;
              annots[i].strokeColor = strokeColor;
              break;
          }
        }
      }
    }
});

var strData7hightlightRedL = // 20x20
"FFC2C2C2FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6F" + "FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFFC2C2C2" +
"FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6F" + "FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF" + "FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF6F6F6FFF6F6F6F" +
"FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6F" + "FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6F" +
"FFC2C2C2FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6F" + "FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFFC2C2C2";

// Icon Generic Stream Object
var oIconhightlightRedL = null;
oIconhightlightRedL = {count: 0, width: 20, height: 20,
read: function(nBytes){return strData7hightlightRedL.slice(this.count, this.count += nBytes);}};

var oButObjhightlightRedL =
{cName: "hightlightRedL",
cExec: "DoCmdhightlightRedL(event.target);",
cEnable: "event.rc = (app.doc != null)",
cMarked: "event.rc = false",
cTooltext: "Red Highlight Left",
cLabel: "Red L"};

if (oIconhightlightRedL != null) {
    oButObjhightlightRedL.oIcon = oIconhightlightRedL;
}

try{app.removeToolButton("hightlightRedL");}catch(e){}
try{app.addToolButton(oButObjhightlightRedL);}catch(e){}
