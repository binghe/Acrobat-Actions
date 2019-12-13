//// Collapse all bookmarks

//// Author: Chun Tian (binghe) <binghe.lisp@gmail.com>
//// Version: 1.0

function CollapseBookmark(bkm, nLevel) {
    if (bkm.children != null) {
        for (var i = 0; i < bkm.children.length; i++) {
            bkm.children[i].open = false;
            CollapseBookmark(bkm.children[i], nLevel + 1);
        }
    }
}

// console.clear(); console.show();
// console.println("Collapsed all bookmarks in the document.");
CollapseBookmark(this.bookmarkRoot, 0);
