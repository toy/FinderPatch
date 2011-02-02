//
//  FinderOpenWithAppPatch.h
//  FinderPatch
//
//  Created by toy on 02.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

@interface FinderOpenWithAppPatch : FinderPatch

+ (void) openWithAppBundleWithIdentifier:(NSString *)bundleIdentifier forKeyEquivalent:(NSString *)keyEquivalent;
+ (void) openWithAppBundleWithIdentifier:(NSString *)bundleIdentifier forKeyEquivalent:(NSString *)keyEquivalent andModifierMask:(NSUInteger)modifierMask;
+ (NSString *) appNameByPath:(NSString *)path;
+ (void) cmdOpenWithApp:(id)sender;
+ (void) cmdOpenWithAppAsynchronyously:(id)sender;

@end
