///////////////////////////////////////////////////////////////////////
//  Copyright 2008 by WindJack Solutions, Inc.
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
//      PDFScripting.com.
//
//
//  This Acrobat Automation Script will only work when
//  placed in one of the Acrobat JavaScript Folders. Execute
//  the following code from the Acrobat JavaScript Console to find
//  the location of the JavaScript folders.
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
//  This script will place a toolbar button on the "AddIns" toolbar
//  in Acrobat or Adobe Reader. JavaScript toolbar buttons were added to
//  Acrobat in version 6. However, most automation scripts are intended
//  to be used with Acrobat 7 or later.  This particular script may
//  contain functionality that prevents it from being used in ADobe Reader.
//  See comments below for details.
//
///////////////////////////////////////////////////////////////////////
//<AcroButtons name="InsertMetaData" version="2.0" "modified="1/20/2007 11:17:8" id="1:20:2007:10:48:54">
// This script was created by AcroButtons from Windjack Solutions, www.windjack.com
// Do not modify the code inbetween the AcroButtons Tags
// Moving or changing tag positions can compromise AcroButtons' ability to handle
// this file
// Place Extra-AcroButton Code in the following "Code Above" Section
//

//<CodeAbove>

///////////////////////////////////////////////////////////////////////
//
//  MenuItem Report Tool
//
//  Requires Acrobat Standard or Professional, version 7 or later.
//
//  When Activated, this Automation tool displays a popup menu with 4
//  options for finding the language independant names of the menu items
//  and toolbar buttons.  The item names can be displayed in the menu itself
//  or written out to a separate report file.  If the user selects one of
//  the items displayed in the popup menu, then that item name is displayed
//  in the console window.
//
//  The script uses recursive functions to walk the menu and toolbar button
//  item trees to collect names and format them for display in the menu,
//  or write them to a report file.
//

// Recursive function for following all the menu tree branches
function PrintArray(lstMenu,rptMenu, oProg)
{
    var nMenuCnt = 0;
    rptMenu.indent();
    for(var i=0;i<lstMenu.length;i++)
    {
         if(oProg != null)
         {
                oProg.value++;
                oProg.text = "Menu" +  lstMenu[i].cName;
                if(oProg.cancelled) return nMenuCnt;
         }

         if((lstMenu[i].oChildren != null) && (lstMenu[i].oChildren.length > 0))
         {
                rptMenu.writeText( lstMenu[i].cName);
                nMenuCnt += PrintArray(lstMenu[i].oChildren,rptMenu);
         }
         else
         {
                rptMenu.writeText("** " +  lstMenu[i].cName);
                nMenuCnt++;
         }
     PrintArray.nLineCnt++;
     if(PrintArray.nLineCnt >= 60)
     {
      rptMenu.breakPage();
      PrintArray.nLineCnt = 0;
     }
  }
    rptMenu.outdent();
    return nMenuCnt;
}

function BuildList(rsltList, srcList)
{
   for (var i=0;i<srcList.length;i++)
   {
      if ((srcList[i].oChildren != null) && (srcList[i].oChildren.length > 0)) {
         rsltList.push(BuildList([srcList[i].cName], srcList[i].oChildren));
      } else {
         rsltList.push(srcList[i].cName);
      }
   }
   return rsltList;
}

function GetListItems(cType)
{
  var itemList = [];
  var theList = [];
  if(cType == "Menu")
  {
    itemList = ["Menu Item Names"];
    theList = app.listMenuItems();
  }
  else if(cType == "Toolbar")
  {
    itemList = ["Toolbar Button Names"];
    theList = app.listToolbarButtons();
  }

  BuildList(itemList, theList);

  return itemList;
}

var DoMenuItemReport = app.trustedFunction(function()
{
   app.beginPriv();

   var bUseMenu = true;
  // Use this to find the menu item names you need to run
   var cRtn = app.popUpMenu("Create Menu Item Report", GetListItems("Menu"), "Create Toobar Button Report", GetListItems("Toolbar"));

   if(cRtn)
   {
// console.println("Select = " + cRtn);
     if(cRtn == "Create Menu Item Report")
         lstMenu = app.listMenuItems();
     else if(cRtn == "Create Toobar Button Report")
     {
        lstMenu = app.listToolbarButtons();
        bUseMenu = false;
     }
     else
     {
        console.show();
        console.clear();
        console.println("Selected Item: " + cRtn);
        return;
     }
   }
   else
     return;

   var rptMenu = new Report();

   rptMenu.size = 2;
   var strSubject = "Adobe\xAE Acrobat\xAE "+ app.viewerVersion + " " + app.viewerType;
   strSubject += bUseMenu?" Menu Items":"Toolbar Buttons";

   rptMenu.writeText(strSubject);
   rptMenu.writeText("Variation: " + app.viewerVariation);
   rptMenu.divide();
   rptMenu.size = 1;
   rptMenu.writeText(bUseMenu?"** - Menu Item":"** - Toolbar Button");
   rptMenu.writeText(" ");
   rptMenu.writeText(" ");

   var oProgMon = app.thermometer; // acquire a thermometer object
   oProgMon.duration = lstMenu.length;
   oProgMon.begin();
   PrintArray.nLineCnt = 8;
   var nMCnt = PrintArray(lstMenu,rptMenu,oProgMon);
   oProgMon.end();
   rptMenu.writeText(" ");
   rptMenu.writeText(" ");
   rptMenu.writeText("\n\n #of " + (bUseMenu?"Menu Items":"Toolbar Buttons") + " = " + nMCnt);

   var docMenu = rptMenu.open(bUseMenu?"AcrobatMenu": "AcrobatButtons");
   docMenu.info.title = bUseMenu?"Acrobat Menu Items":"Acrobat Toolbar Buttons";
   docMenu.info.subject = strSubject;
   docMenu.info.author = "Windjack Solutions";

});
//</CodeAbove>

//<JSCodeSnippet name="ImageData7">
var strData7AddArchiveFields =
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF404040FF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFFA8A8A8FF404040FF5C5C5CFF000000FF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFFFFA8A8A8FF404040FF000000FF5C5C5CFFDBDBDBFF000000FFCACACAFF000000" +
"FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000FFFFFF00FFFFFF" +
"FFA8A8A8FF000000FF000000FF787878FFDBDBDBFFDBDBDBFFDBDBDBFF5C5C5C00FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"FF404040FFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFF404040FFA8A8A800FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"FF404040FFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFF5C5C5C00FFFFFF00FFFFFFFF000000" +
"FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000FFFFFF00FFFFFF" +
"FF000000FF000000FFDBDBDBFFDBDBDBFFDBDBDBFF404040FFA8A8A800FFFFFF00FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"FFCACACAFF000000FFCACACAFFDBDBDBFFA8A8A8FF5C5C5C00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFFFF000000FFA8A8A8FF34343400FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFFFF00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFFFF000000" +
"FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF" +
"00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF";
//</JSCodeSnippet>

// Icon Generic Stream Object
//<JSCodeSnippet name="ButtonIconDef">
var oIconAddArchiveFields = null;
//if(app.viewerVersion < 7){
//}else{
oIconAddArchiveFields = {count: 0, width: 20, height: 20,
read: function(nBytes){return strData7AddArchiveFields.slice(this.count, this.count += nBytes);}};
//}
//</JSCodeSnippet>

//<JSCodeSnippet name="EventCode">
//</JSCodeSnippet>

//<JSCodeSnippet name="ButtonObjDef">
var oButObjAddArchiveFields =
{cName: "AddArchiveFields",
cExec: "DoMenuItemReport()",
cEnable: "event.rc = (app.doc != null) && (app.viewerType != \"Reader\")",
cMarked: "event.rc = false",
cTooltext: "Creates a report of all menu item or toolbar button names",
oIcon: oIconAddArchiveFields,
cLabel: "Menu List"};
//</JSCodeSnippet>

// try{app.removeToolButton("AddArchiveFields");}catch(e){}
try{app.addToolButton(oButObjAddArchiveFields);}catch(e){}

//</AcroButtons>
