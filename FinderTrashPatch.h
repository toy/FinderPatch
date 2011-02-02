//
//  FinderTrashPatch.h
//  FinderPatch
//
//  Created by toy on 17.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

@interface FinderTrashPatch : FinderPatch

+ (void) cmdMoveToTrash:(id)sender;
+ (void) cmdMoveToTrashAsynchronyously:(id)sender;
+ (NSViewController *) frontmostBrowserViewController;
+ (NSArray *) getUrls:(FNReference *)ref;
+ (void) selectNextAfterBlock:(void (^)())block viewController:(NSViewController *)viewController;

@end
