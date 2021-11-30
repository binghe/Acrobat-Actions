//
//  Functions.hpp
//  Bookmarks
//
//  Created by Chun Tian on 21/11/19.
//
//

#ifndef Functions_hpp
#define Functions_hpp

void CollapseAllBookmarks(PDDoc doc, PDBookmark b);
int FixAllBookmarks (PDDoc doc, PDBookmark b, int acc);
int CapitalizeAllBookmarks (PDDoc doc, PDBookmark b, int acc);
int FixAllTextAnnotations (PDDoc doc);

#endif /* Functions_hpp */
