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
///////////////////////////////////////////////////////////////////////
//<AcroButtons name="NewDocument" version="2.0" "modified="1/28/2005 13:12:41" id="1:28:2005:13:12:41">
// This script was created by AcroButtons from Windjack Solutions, www.windjack.com
// Do not modify the code inbetween the AcroButtons Tags
// Moving or changing tag positions can compromise AcroButtons' ability to handle
// this file
// Place Extra-AcroButton Code in the following "Code Above" Section
//

//<CodeAbove>

///////////////////////////////////////////////////////////////////////
//
//  New Document Automation Tool
// 
//  Creates a new blank pdf of the selected page size. 
//
//  Requires Acrobat Standard or Professional, version 6 or later.
//
//  The "newDoc()" function requires a privileged context.  This script 
//  demonstrates using a menu item to create a privileged context
//  in Acrobat Version 6 and earlier.  For Acrobat 7 and later it uses 
//  a trusted function to create a privileged context.
//
//  Version2 1/27/2015
//           - Remove pre-Acrobat 7 dependant code, no propagator function. 
//           - Add Portrait/Landscape Orientation options
//           - Save Dialog values in Global space
//

// The menu item will be disabled in Reader
if(app.viewerVersion < 7) {
   app.alert("The New Doc Automation Tool Requires Adobe Acrobat Professional/Standard version 6.0 or Later");
   throw "Invalid Acrobat Version";
}

var sizeListNewDoc =
[
{name:"LNCS",w:430,h:660}, // added by Chun Tian <binghe.lisp@gmail.com>
{name:"Letter",w:612,h:792},
{name:"Legal",w:612,h:1008},
{name:"Executive",w:522,h:756},
{name:"A0",w:2384,h:2835},
{name:"A1",w:1684,h:2384},
{name:"A2",w:1190,h:1684},
{name:"A3",w:842,h:1190},
{name:"A4",w:595,h:842},
{name:"A5",w:420,h:595},
{name:"A6",w:298,h:420},
{name:"A7",w:209,h:298},
{name:"B0",w:2384,h:4008},
{name:"B1",w:2004,h:2835},
{name:"B2",w:1417,h:2004},
{name:"B3",w:1001,h:1417},
{name:"B4",w:709,h:1001},
{name:"B5",w:499,h:709},
{name:"B6",w:354,h:499},
{name:"B7",w:249,h:354},
{name:"B8",w:176,h:249},
{name:"B9",w:125,h:176},
{name:"B10",w:88,h:125},
{name:"C2",w:1837,h:1298},
{name:"C3",w:578,h:919},
{name:"C4",w:919,h:649},
{name:"C5",w:649,h:459},
{name:"C6",w:459,h:323}
];


  var NewDocDlg =
  {
	lastUnits:"Rad1",
	lastSize:"Letter",
	lastOrintation:"Port",
	w: 0,
	h: 0,
	m_bLastMult: 1,
    GetFlatListSel:function(oLstRslts){
       for(var item in oLstRslts)
          if((typeof oLstRslts[item]=="number")&&(oLstRslts[item]>0)) return item;
       return "";
    },
    initialize: app.trustedFunction(function(dialog)
    {
      this.result = "Cancel";
      var sizeInit = 
          {
            "Custom": -1,
            "LNCS": -1, // added by Chun Tian
            "Letter": -1,
            "Legal": -2,
            "Executive": -3,
            "A0": -2,
            "A1": -3,
            "A2": -4,
            "A3": -5,
            "A4": -6,
            "A5": -7,
            "A6": -8,
            "A7": -9,
            "B0": -9,
            "B1": -9,
            "B2": -9,
            "B3": -9,
            "B4": -9,
            "B5": -9,
            "B6": -9,
            "B7": -9,
            "B8": -1,
            "B9": -1,
            "B10": -1,
            "C2": -1,
            "C3": -1,
            "C4": -1,
            "C5": -1,
            "C6": -1,
          };

		  app.beginPriv();
		if(typeof(global.PDFS_ND_Units) != "undefined")
			this.lastUnits = global.PDFS_ND_Units;
		if(typeof(global.PDFS_ND_Orient) != "undefined")
			this.lastOrintation = global.PDFS_ND_Orient;
		if(typeof(global.PDFS_ND_Size) != "undefined")
			this.lastSize = global.PDFS_ND_Size;
		if(typeof(global.PDFS_ND_Width) != "undefined")
			this.w = global.PDFS_ND_Width;
		if(typeof(global.PDFS_ND_Height) != "undefined")
			this.h = global.PDFS_ND_Height;
		  app.endPriv();
		sizeInit[this.lastSize] = 1;

      var loadParams = {"psiz": sizeInit};
      loadParams[this.lastUnits] = true;
	  loadParams[this.lastOrintation] = true;
      dialog.load(loadParams);
      dialog.enable({"wdth": false, "hght": false});

      if(this.lastSize == "Custom")
          dialog.load({"wdth":this.w ,"hght":this.h});
      
      this.m_bLastMult = 1;
      this["psiz"](dialog);
    }),
    commit: app.trustedFunction(function(dialog)
    {
		var rslt = dialog.store();
		if(rslt["Rad2"]){
			mult = 72;
			this.lastUnits = "Rad2";
		}else if(rslt["Rad3"]){
			mult = 2.835;
			this.lastUnits = "Rad3";
		}else{
			var mult = 1;
			this.lastUnits = "Rad1";
		}

		this.h = rslt["hght"] * mult;
		this.w = rslt["wdth"] * mult;

		this.lastOrintation = rslt["Land"]?"Land":"Port";
		this.lastSize = this.GetFlatListSel(rslt["psiz"]);
	   
		app.beginPriv();
		global.PDFS_ND_Units = this.lastUnits;
		global.setPersistent("PDFS_ND_Units",true);
		global.PDFS_ND_Orient = this.lastOrintation;
		global.setPersistent("PDFS_ND_Orient",true);
		global.PDFS_ND_Size = this.lastSize;
		global.setPersistent("PDFS_ND_Size",true);
		global.PDFS_ND_Width = this.w;
		global.setPersistent("PDFS_ND_Width",true);
		global.PDFS_ND_Height = this.h;
		global.setPersistent("PDFS_ND_Height",true);
		app.endPriv();
    }),
    "Rad3": function(dialog)
    {
       this["psiz"](dialog);
    },
    "Rad2": function(dialog)
    {
       this["psiz"](dialog);
    },
    "Rad1": function(dialog)
    {
       this["psiz"](dialog);
    },
    "psiz": function(dialog)
    {
			var rslts = dialog.store();
			var sel ="";
			for(var entry  in rslts["psiz"])
			{
					if(rslts["psiz"][entry]> 0)
					{
							sel = entry;
							break;
					}
			 }
			 var mult = 1;
			 if(rslts["Rad2"])
					 mult = 72;
			 else if(rslts["Rad3"])
					 mult = 2.835;
			 var bCustom = (sel =="Custom");
			 dialog.enable({"hght": bCustom,"wdth":bCustom});
			 var nH = 0, nW = 0;
			 if(bCustom)
			 {
							nH = (rslts["hght"] * this.m_bLastMult)/mult;
							nW = (rslts["wdth"] * this.m_bLastMult)/mult;
			 }
			 else
			 {
					var nLen = sizeListNewDoc.length;
					for(var i=0;i<nLen;i++)
					{
							 if(sizeListNewDoc[i].name == sel)
							{
									nH = sizeListNewDoc[i].h/mult;
									nW = sizeListNewDoc[i].w/mult;
									break;
							}
					}
			 }
			 dialog.load({"hght": nH,"wdth":nW});
			 this.m_bLastMult = mult;
    },
    description:
    {
      name: "New Document",
      elements:
      [
        {
          type: "view",
          elements:
          [
            {
              align_children: "align_top",
              type: "view",
              elements:
              [
                {
                  type: "view",
                  elements:
                  [
                    {
                      type: "popup",
                      item_id: "psiz",
                      height: 23,
                      width: 53,
                    },
                    {
                      align_children: "align_row",
                      type: "view",
                      elements:
                      [
                        {
                          item_id: "sta1",
                          name: "Width:",
                          type: "static_text",
                        },
                        {
                          alignment: "align_left",
 //                         char_width: 8,
                          height: 23,
                          item_id: "wdth",
                          type: "edit_text",
                          width: 88,
                        },
                      ]
                    },
                    {
                      align_children: "align_row",
                      height: 27,
                      type: "view",
                      width: 148,
                      elements:
                      [
                        {
                          height: 23,
                          item_id: "sta1",
                          name: "Height",
                          type: "static_text",
                        },
                        {
  //                        char_width: 8,
                          height: 23,
                          item_id: "hght",
                          type: "edit_text",
                          width: 88,
                        },
                      ]
                    },
                  ]
                },
                {
                  item_id: "cls1",
                  name: "Units",
                  type: "cluster",
                  elements:
                  [
                    {
                      group_id: "Unit",
                      item_id: "Rad1",
                      name: "points",
                      type: "radio",
                    },
                    {
                      group_id: "Unit",
                      item_id: "Rad2",
                      name: "inches",
                      type: "radio",
                    },
                    {
                      group_id: "Unit",
                      item_id: "Rad3",
                      name: "milimeters",
                      type: "radio",
                    },
                  ]
                },
              ]
            },
			{
			  item_id: "cls1",
			  type: "view",
              align_children: "align_row",
			  elements:
			  [
				{
				  group_id: "Orin",
				  item_id: "Port",
				  name: "Portrait",
				  type: "radio",
				},
				{
				  group_id: "Orin",
				  item_id: "Land",
				  name: "Landscape",
				  type: "radio",
				},
			  ]
			},
            {
              type: "ok_cancel",
            },
          ]
        },
      ]
    }
  };


//<JSCodeSnippet name="ImageData7">
var icNewDocSm = 
"00C0C0C000C0C0C0FF8C8892FF7878CEFFBBBB67FF999972FF9F9F78FF7878CEFF7878CEFF7678CE" + "FF7477CEFF595BC2FF7878CEFFDCDCE800C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FFB2B2A1FFFFF9BAFFFFFC47FFFFFF92FFFFFFFFFFFEFEFFFFFAFDFFFFF4FBFF" + "FFEDF8FFFF929ADBFF5FA4E1FF5569C8FFD2D2DB00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C0FFDFDFA0FFC0C06EFFFFF93BFFFFF93BFFFFFF7FFFFFFF7FFFFEFEBFFFF6FBFFFFEFF8FF" + "FFE7F6FFFF9099DBFF5FA4E1FF2E84D4FF4D63C600C5C5D600C0C0C000C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FFB8B87FFFFFFFA3FFFFFF7FFFFFF77FFFFFFFFFFFFAFEFFFFF5FAFFFFEEF8FF" + "FFE5F5FFFF8E99DBFF318AD7FF1774CFFF0F6DCDFF4040B7FFC7C7E100C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FFC5C573FFFFFFFFFFFFFF7FFFFFFBBFFFFEF67FFFF8FCFFFFF1F9FFFFE8F7FF" + "FFE0F3FFFFA1B1E6FF6972CEFF6771CEFF6370CEFF555DC5FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF8A8ACAFFFFFFFFFFFFFBBFFFFFFFFFFFFCFEFFFFF5FBFFFFECF7FFFFE4F4FF" + "FFDBF1FFFFCFECFFFFB7D5F8FFAFD1F8FFA5CEF8FF6879D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFFFFFFF00CACACAFFD4D5D5FF91949500C0C5CAFFA0AAB1FFE2F4FF" + "FF7E8B95FFA0B9CAFF728695FF7D99ACFFAEDFFFFF6779D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFFFFFFFFFE4E4E4FFE2E3E400C3C7CAFFE0E9EE00B5C2CAFFDDF2FF" + "00B0C5D4FFB1D0E4FF96B5CAFF8FB3CAFFABDEFFFF6779D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFFFFFFFFFE4E4E4FFCFD1D400C1C6CAFFD3DEE4FFC9DAE4FFBBD1DE" + "FFB9D3E4FFADCEE4FF93B5CAFF90B6CFFFA7DCFFFF6378D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFFFFFFF00C9C9CAFF9A9EA0FF8C919500B7C3CA00AFBFCAFF7B8B95" + "FFA1BACAFF97B5CAFF86A8BDFF658195FFA5DBFFFF6378D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFFFFFFFFFFBFEFFFFF4FAFFFFECF8FFFFE4F4FFFFD8F0FFFFCFECFF" + "FFC7E8FFFFBBE3FFFFB2E1FFFFAADDFFFFA2D9FFFF6378D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFFDFEFF00CACDCFFF9AA0A4FFE8F7FFFF8B979FFF80909AFFC9EAFF" + "FF98B6CAFF96BCD4FF6C8BA0FF698AA0FF9FD8FFFF6275D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFFCFEFFFFF5FAFFFFEBF7FFFFE3F4FFFFDCF1FFFFCFEBFFFFC6E8FF" + "FFBCE4FFFFB2E0FFFFA9DCFFFFA4DAFFFF9CD7FFFF6175D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9C9CC7FFF8FDFFFFF2FAFFFFE9F6FFFFE0F3FFFFD8EFFFFFCCEAFFFFC1E6FF" + "FFB9E3FFFFAEDFFFFFA7DCFFFFA0D9FFFF99D6FFFF6175D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9B9CC7FFF5FBFFFFEFF8FFFFE3F4FFFFDAF1FFFFD2EDFFFFC6E8FFFFBDE5FF" + "FFB4E1FFFFA9DDFFFFA3DAFFFF9CD7FFFF97D5FFFF6175D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9B9CC7FFF2F9FFFFEBF7FFFFDFF3FFFFD7EFFFFFCEEBFFFFC2E6FFFFB9E3FF" + "FFB0E0FFFFA7DBFFFF9FD9FFFF9BD7FFFF97D5FFFF6175D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9B9CC7FFEFF8FFFFE7F6FFFFDCF1FFFFD2EDFFFFC9E9FFFFBDE4FFFFB6E2FF" + "FFACDEFFFFA3DAFFFF9DD7FFFF99D6FFFF97D5FFFF6175D4FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF9798C5FFBCC6EDFFB6C3EDFFAEC0EDFFA7BEEDFFA1BAEDFF99B7EDFF93B5ED" + "FF8EB2EDFF86B0EDFF83AFEDFF80ADEDFF80ADEDFF5E6FD1FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FF8080BCFF4040B7FF4040B7FF4040B7FF4040B7FF4040B7FF4040B7FF4040B7" + "FF4040B7FF4040B7FF4040B7FF4040B7FF4040B7FF4040B7FF9F9FDB00C0C0C000C0C0C000C0C0C0" +
"00C0C0C000C0C0C0FFA0A0BEFF8080BCFF8080BCFF8080BCFF8080BCFF8080BCFF8080BCFF8080BC" + "FF8080BCFF8080BCFF8080BCFF8080BCFF8080BCFF8080BC00B0B0CD00C0C0C000C0C0C000C0C0C0";

var oIconNewDocument = {count: 0, width: 20, height: 20,
read: function(nBytes){return icNewDocSm.slice(this.count, this.count += nBytes);}};

var DoCmdNewDocument = app.trustedFunction(function()
{
	app.beginPriv();
    if("ok" == app.execDialog(NewDocDlg))
    {
        var myDoc = app.newDoc(NewDocDlg.w,NewDocDlg.h);
		if(NewDocDlg.lastOrintation == "Land")
			myDoc.setPageRotations(0,0,90);
    }
	app.endPriv();
});

var oButNewDocument = 
{
	cName: "NewDocument",
	cExec: "DoCmdNewDocument()",
	cEnable: "event.rc = (app.viewerType != \"Reader\")",
	cMarked: "event.rc = false",
	cTooltext: "Create New Blank PDF Document",
	cLabel: "New Document",
	oIcon: oIconNewDocument
};

// try{app.removeToolButton("NewDocument");}catch(e){}
try{app.addToolButton(oButNewDocument);}catch(e){}
