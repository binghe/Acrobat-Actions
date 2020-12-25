/* Convert to Highlights,
   Author: Chun Tian <binghe.lisp@gmail.com> */

this.syncAnnotScan();
var annots = this.selectedAnnots;

if (annots != null) {
    for (var j = annots.length - 1; j >= 0; j--) {
        var annot = annots[j];

        /* get the property of the annotation */
        var page = annot.page;
        var rect = annot.rect;
        var author = annot.author;
        var x0 = rect[0];
        var y0 = rect[1];
        
        /* delete the old annotation */
        annot.destroy();

        var inch = 72;
        var scaledInch = .5*inch;
        var nNodes = 60;
        var theta = 2*Math.PI/nNodes;
        var points = new Array();
        for (var i = 0; i <= nNodes; i++) {
            Theta = i*theta;
            points[i] = [x0 + 2*Math.cos(3*Theta)*Math.cos(Theta)*scaledInch,
                         y0 + 2*Math.cos(3*Theta)*Math.sin(Theta)*scaledInch];
        }

        var newAnnot = this.addAnnot({
            type: "Ink",
            page: page,
            name: "myRose",
            author: author,
            contents: "Three leaf rose",
            gestures: [points],
            strokeColor: color.red,
            width: 1
        });
    }
}
