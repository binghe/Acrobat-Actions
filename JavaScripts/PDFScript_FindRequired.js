///////////////////////////////////////////////////////////////////////
//  Copyright 2010 by WindJack Solutions, Inc.
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
//  C:\Program Files\Adobe\Acrobat 9.0\Acrobat\JavaScripts
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
//
//<AcroButtons name="PDFS_FindRequired" version="2.0" "modified="3/26/2010 14:30:9" id="3:26:2010:9:48:48">
// This script was created by AcroButtons from Windjack Solutions, www.windjack.com
// Do not modify the code inbetween the AcroButtons Tags
// Moving or changing tag positions can compromise AcroButtons' ability to handle
// this file
// Place Extra-AcroButton Code in the following "Code Above" Section
//

//<CodeAbove>
///////////////////////////////////////////////////////////////////////
//
//  Find Required Fields Tool
// 
//  Requires Acrobat Standard or Professional, version 7 or later.
//
//  When Activated, this Automation tool displays a popup menu listing the
//  fields on the form that are marked as Required.  When an item is selected
//  the keyboard focus is placed on that field.
//
//  Works for both AcroForm and LiveCyle Forms
//
function DoFindRequiredFields(oDoc)
{
   var reqFlds = [];
   if(oDoc.xfa != null)
   {
      for(var npg = 0;npg < oDoc.xfa.host.numPages;npg++)
      {
         var oFlds = oDoc.xfa.layout.pageContent(npg,"field");
         for(var i=0;i<oFlds.length;i++)
         {
            if(oFlds.item(i).mandatory == "error")
               reqFlds.push(oFlds.item(i).somExpression);
         }
      }
   }
   else
   {
      for(var i=0;i<oDoc.numFields;i++)
      {
         var oFld = oDoc.getField(oDoc.getNthFieldName(i));
         if((oFld.type != "button") && oFld.required)
            reqFlds.push(oFld.name);
     }
   }
   if(reqFlds.length)
   {
      var cRtn = app.popUpMenu.apply(app,reqFlds);
      if(cRtn)
      {
         if(oDoc.xfa != null)
           oDoc.xfa.host.setFocus(cRtn);
         else
          oDoc.getField(cRtn).setFocus();
      }
   }
   else
      app.alert("No Required Fields");
}
//</CodeAbove>

//<JSCodeSnippet name="ImageData7">
var strData7PDFS_FindRequired = 
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"FFC4C4C400C0C0C0FFCFCFCF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"FF478248FF478248FFB2C0B200C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FFAAB9AAFF246025FF246024" +
"FF478248FF86A487FF84A784FFAEBEAFFFAEBEAFFFAEBEAFFFAEBEAFFFAEBEAEFFAEBEAEFFADBDAE" + "FFADBDAEFFADBDADFFADBDADFFADBCADFFACBCACFFABBBABFFAAB9AAFF739574FF668466FF205C21" +
"00C0C0C000C0C0C0FF9DBD9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF" + "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F1F1FFA7827F00C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9DBD9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF282828FFFFFFFF" + "FF282828FF939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF72403DFF6F0600FF88575500C0C0C0" +
"00C0C0C000C0C0C0FF9BBB9CFF323232FF979797FF646464FF1D1D1DFFFDFDFDFFFDFDFDFF272727" + "FFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFF83524EFF860E03FFA80800FF966A6800C0C0C0" +
"00C0C0C000C0C0C0FF98B898FFF8F8F8FFF8F8F8FF949494FFF8F8F8FFF8F8F8FFF8F8F8FF272727" + "FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFB39796FF630A02FFCA0900FF7B252200C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF95B495FFF4F4F4FFF4F4F4FF8F8F8FFFF4F4F4FFF4F4F4FFF4F4F4FF262626" + "FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFA58582FFC20E00FFA00500FFA98E8C00C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF8DAD8EFFEAEAEAFFEBEBEBFF818181FFEAEAEAFF947B7AFF680F08FF211925" + "FFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFF841109FF8C0400FF7D4C4BFF7A917800C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF82A083FFDFDFDFFF0A0A0AFF040404FFDFDFDFFF360604FFCC1000FF950D02" + "FF5D3940FFDFDFDFFFDFDFDFFF4E110EFF9C0500FF673635FFE1E1E1FF79927900C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF79967AFFD5D5D5FFD7D7D7FFD7D7D7FFD7D7D7FFD8D8D8FF9A0A00FFC30700" + "FF80120DFFB59B99FF713738FF880B01FF6D0200FFD7D7D7FFD7D7D7FF738A7300C0C0C000C0C0C0" +
"FFA7B5A7FFA7B4A7FF436A44FF6E856EFF6D846DFF6D846DFF6D846DFF6D836DFF534947FF8E0700" + "FFA60400FF77211FFF7D1108FF840100FF4D4F39FF6C816CFF6B806CFF3C5E3DFFA3AFA3FFA3AFA4" +
"FF184F19FFA9A9A9FFA6B3A600C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0FF483D51" + "FF540703FF9A0200FF860000FF410E0F00C0C0C000C0C0C000C0C0C0FFA3AEA3FFA3A3A3FF0D3A0D" +
"FF184F19FF174D18FFA6B3A600C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "FF908899FF680403FF46040300C0C0C000C0C0C000C0C0C000C0C0C0FFA3AEA3FF0C380DFF0D3A0D" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "00C0C0C0FFC3C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" + "00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0";
//</JSCodeSnippet>

// Icon Generic Stream Object
//<JSCodeSnippet name="ButtonIconDef">
var oIconPDFS_FindRequired = null;
//if(app.viewerVersion < 7){
//}else{
oIconPDFS_FindRequired = {count: 0, width: 20, height: 19,
read: function(nBytes){return strData7PDFS_FindRequired.slice(this.count, this.count += nBytes);}};
//}
//</JSCodeSnippet>

//<JSCodeSnippet name="EventCode">
var DoCmdPDFS_FindRequired = 
"DoFindRequiredFields(event.target);"
//</JSCodeSnippet>

//<JSCodeSnippet name="ButtonObjDef">
var oButObjPDFS_FindRequired = 
{cName: "PDFS_FindRequired",
cExec: DoCmdPDFS_FindRequired,
cEnable: "event.rc = (app.doc != null)",
cMarked: "event.rc = false",
cTooltext: "Find Required Fields",
nPos: -1};
//</JSCodeSnippet>
if(oIconPDFS_FindRequired != null)
    oButObjPDFS_FindRequired.oIcon = oIconPDFS_FindRequired;

// try{app.removeToolButton("PDFS_FindRequired");}catch(e){}
try{app.addToolButton(oButObjPDFS_FindRequired);}catch(e){}
 
//</AcroButtons>
