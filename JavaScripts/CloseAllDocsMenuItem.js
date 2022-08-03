//////////////////////////////////////////////////////
//
// Close All PDFs Menu Item for Acrobat/Reader
//
// Written by Thom Parker for www.acrobatusers.com
//
// Copyright 2011 by WindJack Solutions, Inc.
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
//  Windows and Command+J on the Mac, does not work properly on newer Mac Books
//
//      app.getPath("user","javascript");
//
//      app.getPath("app","javascript");
//
//  You may place this script file in either one of the folders.
//  However, the "user" folder is shared by both Acrobat and Reader
//  Placing the file in the user folder will make the menu item
//  availible to both Acrobat and Reader
//

///////
// Business logic for closing documents
//
var DoCloseAllDocs = app.trustedFunction(function()
{
   app.beginPriv();
     var len = app.activeDocs.length;
     for(var i=len-1;i>=0;i--)
        app.activeDocs[i].closeDoc(false);
   app.endPriv();
});

///////
//  User Interface, places menu item on File menu
//
app.addMenuItem({cName:"Close All PD&Fs",
                 cParent:"File",
                 nPos:"Close",
                 cExec:"DoCloseAllDocs()",
                 cEnable:"event.rc = (app.doc != null)"
});

/////////////////////////
//
//  Variations on the main script.  To use, replace the cExec
//  script in the "addMenuItem" fucntion to use the
//  given trusted fucntion.

var DoCloseAllDocs_NoSave = app.trustedFunction(function()
{
   app.beginPriv();
     var len = app.activeDocs.length;
     for(var i=len-1;i>=0;i--)
        app.activeDocs[i].closeDoc(true);
   app.endPriv();
});

//  This variation will not work for documents in Reader
//  that do not have save rights, but it fails in a well
//  behaved manor
var DoCloseAndSaveAllDocs = app.trustedFunction(function()
{
   app.beginPriv();
     var len = app.activeDocs.length;
     for(var i=len-1;i>=0;i--)
     {
        oDoc = app.activeDocs[i];
        try{
          oDoc.saveAs(oDoc.path);
        }catch(e){}
        oDoc.closeDoc(false);
     }
   app.endPriv();
});
