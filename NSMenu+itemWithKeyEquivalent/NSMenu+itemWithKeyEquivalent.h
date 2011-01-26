//
//  NSMenu+itemWithKeyEquivalent.h
//  FinderPatch
//
//  Created by toy on 25.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMenu (itemWithKeyEquivalent)

- (NSMenuItem *) itemWithKeyEquivalent:(NSString *)keyEquivalent andModifierMask:(NSUInteger)modifierMask;

@end
