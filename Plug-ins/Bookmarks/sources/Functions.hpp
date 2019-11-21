//
//  Functions.hpp
//  Bookmarks
//
//  Created by Chun Tian on 21/11/19.
//
//

#ifndef Functions_hpp
#define Functions_hpp

void VisitAllBookmarks(PDDoc doc, PDBookmark aBookmark);
int FixAllBookmarks(PDDoc doc, PDBookmark aBookmark, int acc);
int CapitalizeAllBookmarks(PDDoc doc, PDBookmark b, int acc);

#endif /* Functions_hpp */
