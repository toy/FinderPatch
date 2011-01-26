//
//  NSMenu+itemWithKeyEquivalent.m
//  FinderPatch
//
//  Created by toy on 25.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSMenu+itemWithKeyEquivalent.h"

NSString *combineKeyEquivalent(NSString *keyEquivalent, NSUInteger modifierMask) {
	if (![[keyEquivalent lowercaseString] isEqualToString:keyEquivalent]) {
		modifierMask = modifierMask | NSShiftKeyMask;
	}
	return [NSString stringWithFormat:@"%@%@", [keyEquivalent uppercaseString], [NSNumber numberWithUnsignedInteger:modifierMask]];
//	return [NSString stringWithFormat:@"%@%@%@%@%@",
//					(modifierMask & NSShiftKeyMask) ? @"⇧" : @"",
//					(modifierMask & NSControlKeyMask) ? @"⌃" : @"",
//					(modifierMask & NSAlternateKeyMask) ? @"⌥" : @"",
//					(modifierMask & NSCommandKeyMask) ? @"⌘" : @"",
//					[keyEquivalent uppercaseString]
//					];
}

@implementation NSMenu (itemWithKeyEquivalent)

- (NSMenuItem *) itemWithKeyEquivalent:(NSString *)keyEquivalent andModifierMask:(NSUInteger)modifierMask {
	__block NSMenuItem *found = nil;
	NSString *combinedKeyEquivalent = combineKeyEquivalent(keyEquivalent, modifierMask);

	[[self itemArray] enumerateObjectsUsingBlock:(id)^(NSMenuItem *item, NSUInteger idx, BOOL *stop) {
		if ([item hasSubmenu]) {
			found = [[item submenu] itemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];
		} else if ([combinedKeyEquivalent isEqualToString:combineKeyEquivalent([item keyEquivalent], [item keyEquivalentModifierMask])]) {
			found = item;
		}
		if (found) {
			*stop = YES;
		}
	}];

	return found;
}

@end
