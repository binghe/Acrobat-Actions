///////////////////////////////////////////////////////////////////////
//  Copyright 2008 by WindJack Solutions, Inc.
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

//<CodeAbove>

//////////////////////////////////////////////////
//
//   Flatten Pages
//
//   Requires Acrobat Standard or Professional, version 6 or later.
//
//   When Activated this Automation tool dispays a dialog that gives 
//   the user a choice of pages to Flatten.  All Pages, Current Page, 
//   or a Page Range.
//
//   Flattening Pages is the process of pushing the appearance of all 
//   Content Stream.interactive elements (Form Fields, Annotations, etc.)   
//   into the Page.  Flattening removes all interactive elements from 
//   the selected pages, but leaves the visual appearance of the annotation
//   behind. 
//  
//   Mainly this is done to preserve the information on the interactive
//   elements before a document is archived.  Flattening simplifies the 
//   internal structure of the PDF, making it smaller and brining it in
//   line of document archive standards.  Flattening can also be done as
//   part of a document process for making content changes and it is also 
//   useful for building test documents.
//
//   The meat of the script is a single line of code that executes the 
//   "doc.flattenPages()" fucntion.
//   




//Acrobat JavaScript Dialog
//Created by DialogDesigner from WindJack Solutions
var SelPgDlg =
{
  DoDialog: function(){return app.execDialog(this);},
  strGRP1:"rAll",
  strStrtPg:"",
  strEndPg:"",
  GetRadioSel:function(oRslts,aCtrls){
      for(var strRtn=aCtrls[0];aCtrls.length>0;strRtn=aCtrls.pop()){
        if(oRslts[strRtn] == true)
            return strRtn;
      }
      return "";
    },
  initialize: function(dialog)
  {
    this.result = "Cancel";
    var dlgInit = 
      {
        "tFPg": util.printf("%d",this.strStrtPg),
        "tTPg": util.printf("%d",this.strEndPg),
      };
    dlgInit[this.strGRP1] = true;
    dialog.load(dlgInit);
    dialog.enable(
      {
        "tTPg": false,
        "tFPg": false,
      }
    );
  },
  commit: function(dialog)
  {
     var oRslt = dialog.store();
     this.strGRP1 = this.GetRadioSel(oRslt,["rAll","rCur","rFro"]);
     this.strStrtPg = oRslt["tFPg"];
     this.strEndPg = oRslt["tTPg"];
  },
  "rFro": function(dialog)
  {
     dialog.enable({tFPg:true, tTPg:true});
     
  },
  "rCur": function(dialog)
  {
     dialog.enable({tFPg:false, tTPg:false});
     
  },
  "rAll": function(dialog)
  {
     dialog.enable({tFPg:false, tTPg:false});
     
  },
  description:
  {
    name: "Select Pages to Flatten",
    elements:
    [
      {
        type: "view",
        elements:
        [
					{
						item_id: "sta1",
						name: "Select Pages to Flatten",
						type: "static_text",
					},
					{
						type: "view",
						elements:
						[
							{
								height: 96,
								item_id: "cls3",
								name: "Page range",
								type: "cluster",
								userName: "Page range",
								width: 332,
								elements:
								[
									{
										group_id: "GRP1",
										height: 20,
										item_id: "rAll",
										name: "All",
										type: "radio",
									},
									{
										group_id: "GRP1",
										height: 20,
										item_id: "rCur",
										name: "Current",
										type: "radio",
										variable_Name: "strRange",
									},
									{
										align_children: "align_row",
										height: 20,
										type: "view",
										width: 256,
										elements:
										[
											{
												group_id: "GRP1",
												height: 24,
												item_id: "rFro",
												name: "From:",
												type: "radio",
												width: 12,
											},
											{
												char_width: 6,
												height: 24,
												item_id: "tFPg",
												type: "edit_text",
												variable_Name: "strStrtPg",
											},
											{
												height: 24,
												item_id: "sta1",
												name: "To:",
												type: "static_text",
											},
											{
												char_width: 6,
												height: 24,
												item_id: "tTPg",
												type: "edit_text",
												variable_Name: "strEndPg",
											},
											{
												height: 24,
												item_id: "sOfN",
												name: "of (N)",
												type: "static_text",
											},
										]
									},
								]
							},
							{
								align_children: "align_fill",
								type: "ok_cancel",
							},
						]
					},
				]
			},
		]
  }
};


var PDFScript_DoFlatten = app.trustedFunction(function()
{// Privileged context is necessary to prevent JavaScript warning messages on dialog
   app.beginPriv();
    SelPgDlg.strGRP1 = "rAll";
    SelPgDlg.strStrtPg = this.pageNum + 1;
    SelPgDlg.strEndPg = this.numPages;
    SelPgDlg.description.elements[0].elements[1].elements[0].elements[2].elements[4].name = "of (" + this.numPages + ")";
    if("ok" == app.execDialog(SelPgDlg))
    {
       switch(SelPgDlg.strGRP1)
       {
          case "rAll":
             this.flattenPages(0,this.numPages-1);
             break;
          case "rCur":
             this.flattenPages(this.pageNum);
           break;
         case "rFro":
            this.flattenPages(SelPgDlg.strStrtPg - 1,SelPgDlg.strEndPg - 1);
            break;
      }
    }
   app.endPriv();
});



//</CodeAbove>

//<JSCodeSnippet name="ImageData6">
var strData6FlattenPages = 
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000FF000000FF000000FF000000FF000000" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C0FF000000FF000000FF000000FF000000FF00000000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF000000FF000000FF000000FF00000000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FF000000FF000000FF000000FF00000000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FF000000FF000000FF000000FF00000000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000" +
"FF000000FF000000FF000000FF000000FF000000FFFFFFFFFF000000FF00000000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000" +
"FF000000FF00000000C0C0C000C0C0C0FF000000FF000000FFFFFFFFFF000000FF00000000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"FF000000FF00000000C0C0C000C0C0C000C0C0C0FF000000FF000000FFFFFFFFFF000000FF000000" +
"00C0C0C0FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000FF000000FFFFFFFFFF000000" +
"00C0C0C0FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000FF000000FFFFFFFF" +
"00C0C0C0FF000000FFFFFFFFFF000000FF000000FF000000FFFFFFFFFFFFFFFFFF00000000C0C0C0" +
"FF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000FF000000" +
"00C0C0C0FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000" +
"FF000000FF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF000000" +
"00C0C0C0FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" +
"FFFFFFFFFF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FFFFFFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000" +
"FFFFFFFFFF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" +
"FFFFFFFFFF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FFFFFFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000" +
"FFFFFFFFFF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" +
"FFFFFFFFFF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FF000000FFFFFFFFFF000000FF000000FF000000FFFFFFFFFFFFFFFFFF000000FF000000" +
"FFFFFFFFFF00000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0";
//</JSCodeSnippet>


// Icon Generic Stream Object
//<JSCodeSnippet name="ButtonIconDef">
var oIconFlattenPages = null;
//if(app.viewerVersion < 7){
oIconFlattenPages = {count: 0, width: 20, height: 20,
read: function(nBytes){return strData6FlattenPages.slice(this.count, this.count += nBytes);}};
//}else{
//}
//</JSCodeSnippet>

//<JSCodeSnippet name="EventCode">
//</JSCodeSnippet>

//<JSCodeSnippet name="ButtonObjDef">
var oButObjFlattenPages = 
{cName: "FlattenPages",
cExec: "PDFScript_DoFlatten()",
cEnable: "event.rc = (app.doc != null) && (app.viewerType != \"Reader\")",
cMarked: "event.rc = false",
cTooltext: "Flatten Form Fields and Annots on PDF Pages",
oIcon: oIconFlattenPages,
cLabel: "Flatten Pages"};
//</JSCodeSnippet>

// try{app.removeToolButton("FlattenPages");}catch(e){}
try{app.addToolButton(oButObjFlattenPages);}catch(e){}

//</JSCodeSnippet>
