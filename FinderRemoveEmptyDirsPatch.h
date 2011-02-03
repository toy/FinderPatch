//
//  FinderRemoveEmptyDirsPatch.h
//  FinderPatch
//
//  Created by toy on 03.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

@interface FinderRemoveEmptyDirsPatch : FinderPatch

+ (void) cmdRemoveEmptyDirs:(id)sender;
+ (void) cmdRemoveEmptyDirsAsynchronyously:(id)sender;

@end
