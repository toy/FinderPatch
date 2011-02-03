//
//  FinderPatch.h
//  FinderPatch
//
//  Created by toy on 10.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FNGlue.h"
#import "TRGlue.h"
#import "NSArray+Additions.h"
#import "NSMenu+itemWithKeyEquivalent.h"
#import "NSTask+Simple.h"

#define LOG_PATCH_LOADED NSLog(@"%@ loaded", [self class])

@interface FinderPatch : NSObject

+ (NSMenu *) fileMenu;
+ (NSMenu *) patchMenu;
+ (NSBundle *) thisBundle;
+ (void) insertSeparatorInPatchMenuIfNotEmpty;
+ (NSDictionary *) environment;
+ (void) shiftItemWithKeyEquivalent:(NSString *)keyEquivalent andModifierMask:(NSUInteger)modifierMask;
+ (NSArray *) refUrls:(FNReference *)ref;
+ (NSArray *) refPaths:(FNReference *)ref;

@end
