//
//  FinderTerminalPatch.m
//  FinderPatch
//
//  Created by toy on 25.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderTerminalPatch.h"

@implementation FinderTerminalPatch

+ (void) load {
	NSString *keyEquivalent = @"t";
	NSUInteger modifierMask = NSCommandKeyMask | NSControlKeyMask;

	NSMenuItem *keyEquivalentOwner = [[NSApp mainMenu] itemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];
	if (keyEquivalentOwner) {
		[keyEquivalentOwner setKeyEquivalentModifierMask:NSShiftKeyMask | NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask];
	}

	[self insertSeparatorInPatchMenuIfNotEmpty];
	NSMenuItem *terminalHereItem = [[self patchMenu] addItemWithTitle:@"Terminal Here" action:@selector(cmdTerminalHere:) keyEquivalent:keyEquivalent];
	[terminalHereItem setKeyEquivalentModifierMask:modifierMask];
	[terminalHereItem setTarget:self];

	NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
	NSImage *terminalIcon = [workspace iconForFile:[workspace absolutePathForAppBundleWithIdentifier:@"com.apple.Terminal"]];
	[terminalIcon setSize:NSMakeSize(16, 16)];
	[terminalHereItem setImage:terminalIcon];

	LOG_PATCH_LOADED;
}

+ (void) cmdTerminalHere:(id)sender {
	[self performSelectorInBackground:@selector(cmdTerminalHereAsynchronyously:) withObject:sender];
}

+ (void) cmdTerminalHereAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	// parts of adapted and fixed code from «cd to» project: http://code.google.com/p/cdto

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];
	TRApplication *terminal = [TRApplication applicationWithName: @"Terminal"];

	NSString *path = [[[[[finder FinderWindows] first] target] getItemOfType:typeFSRef] path];
	if (!path) {
		path = [@"~/Desktop" stringByExpandingTildeInPath];
	}

	NSString *command = [NSString stringWithFormat:@" printf %%b \\\\ec && cd $'%@'", [path stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"]];

	[[terminal activate] send];
	TRReference *firstWindow = [[terminal windows] first];

	BOOL isAutoOpenedWindow = NO;
	if ([[[[terminal windows] count] send] intValue] == 1) {
		NSString *windowContents = [[firstWindow history] getItem];
		if ([windowContents hasPrefix:@"Last login:"]) {
			if ([windowContents length] - [[windowContents stringByReplacingOccurrencesOfString:@"$" withString:@""] length] <= 1) {
				isAutoOpenedWindow = YES;
			}
		}
	}

	if (isAutoOpenedWindow) {
		[[[terminal doScript:command] in:firstWindow] send];
	} else {
		[[terminal doScript:command] send];
	}

	[pool release];
}

@end
