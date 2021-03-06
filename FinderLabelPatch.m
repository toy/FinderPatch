//
//  FinderLabelPatch.m
//  FinderPatch
//
//  Created by toy on 16.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderLabelPatch.h"

@implementation FinderLabelPatch

+ (void) loadPatch {
	NSArray *keyEquivalents = [@"n e g p b y r o" componentsSeparatedByString:@" "];
	NSUInteger modifierMask = NSControlKeyMask | NSAlternateKeyMask;

	NSUInteger i, _i = [keyEquivalents count];
	for (i = 0; i < _i; i++) {
		NSString *keyEquivalent = [keyEquivalents objectAtIndex:i];

		[self shiftItemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];

		NSMenuItem *setLabelItem = [[self patchMenu] addItemWithTitle:@"" action:@selector(cmdSetLabel:) keyEquivalent:keyEquivalent];
		[setLabelItem setKeyEquivalentModifierMask:modifierMask];
		[setLabelItem setTarget:self];
		[setLabelItem setTag:i];
	}
	[[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
																												 selector:@selector(updateLabels:)
																														 name:NSWorkspaceDidChangeFileLabelsNotification
																													 object:nil];
	[self updateLabels:nil];
}

+ (void) updateLabels:(NSNotification *)notification {
	NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
	NSArray *names = [workspace fileLabels];
	NSArray *colors = [workspace fileLabelColors];
	[[[self patchMenu] itemArray] enumerateObjectsUsingBlock:^(id menuItem, NSUInteger idx, BOOL *stop) {
		if ([menuItem target] == self) {
			NSUInteger labelId = [menuItem tag];
			NSString *name = [names objectAtIndex:labelId];
			[menuItem setTitle:[NSString stringWithFormat:@"Label %@", name]];

			NSImage *image = [[NSImage alloc] initWithSize:NSMakeSize(16, 16)];
			NSRect rect = NSMakeRect(4, 4, 8, 8);
			[image lockFocus];
			if (labelId == 0) {
				NSImage *xImage = [NSImage imageNamed:NSImageNameStopProgressTemplate];
				[xImage drawInRect:rect fromRect:NSZeroRect operation:NSCompositeCopy fraction:0.68f];
			} else {
				NSColor *color = [colors objectAtIndex:labelId];
				NSShadow* theShadow = [[NSShadow alloc] init];
				[theShadow setShadowOffset:NSMakeSize(0, -1)];
				[theShadow setShadowBlurRadius:2.0];
				[theShadow setShadowColor:[[NSColor blackColor] colorWithAlphaComponent:0.8]];
				[theShadow set];
				[color drawSwatchInRect:rect];
				[theShadow release];
			}
			[image unlockFocus];
			[menuItem setImage:image];
			[image release];
		}
	}];
}

+ (BOOL) validateMenuItem:(NSMenuItem *)item {
	return YES;
}

+ (void) cmdSetLabel:(id)sender {
	if (sender) {
		SEL selector = NSSelectorFromString([NSString stringWithFormat:@"cmdSetLabel%d:", [sender tag]]);
		[NSApp sendAction:selector to:nil from:nil];
	}
}

@end
