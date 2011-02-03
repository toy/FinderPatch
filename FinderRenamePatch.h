//
//  FinderRenamePatch.h
//  FinderPatch
//
//  Created by toy on 03.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

@interface FinderRenamePatch : FinderPatch

+ (void) cmdRenameSelected:(id)sender;
+ (void) cmdRenameSelectedRecursive:(id)sender;
+ (void) cmdRenameSelectedAsynchronyously:(id)sender;
+ (void) cmdRenameSelectedRecursiveAsynchronyously:(id)sender;
+ (void) renamePaths:(NSArray *)paths;
+ (NSString *) pipeThroughMate:(NSString *)data;

@end
