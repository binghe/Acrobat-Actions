// default style
var strokeColor = color.red;
var opacity = 0.7;

this.syncAnnotScan();
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
