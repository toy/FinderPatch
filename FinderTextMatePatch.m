//
//  FinderTextMatePatch.m
//  FinderPatch
//
//  Created by toy on 26.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderTextMatePatch.h"

@implementation FinderTextMatePatch

+ (void) load {
	NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
	NSString *textMatePath = [workspace absolutePathForAppBundleWithIdentifier:@"com.macromates.textmate"];

	if (textMatePath) {
		NSString *keyEquivalent = @"m";
		NSUInteger modifierMask = NSCommandKeyMask | NSControlKeyMask;

		NSMenuItem *keyEquivalentOwner = [[NSApp mainMenu] itemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];
		if (keyEquivalentOwner) {
			[keyEquivalentOwner setKeyEquivalentModifierMask:NSShiftKeyMask | NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask];
		}

		[self insertSeparatorInPatchMenuIfNotEmpty];
		NSMenuItem *openInTextMateItem = [[self patchMenu] addItemWithTitle:@"Open in TextMate" action:@selector(cmdOpenInTextMate:) keyEquivalent:keyEquivalent];
		[openInTextMateItem setKeyEquivalentModifierMask:modifierMask];
		[openInTextMateItem setTarget:self];

		NSImage *textMateIcon = [workspace iconForFile:textMatePath];
		[textMateIcon setSize:NSMakeSize(16, 16)];
		[openInTextMateItem setImage:textMateIcon];

		LOG_PATCH_LOADED;
	}
}

+ (void) cmdOpenInTextMate:(id)sender {
	[self performSelectorInBackground:@selector(cmdOpenInTextMateAsynchronyously:) withObject:sender];
}

+ (void) cmdOpenInTextMateAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];

	NSArray *paths = [[[finder selection] getListOfType:typeFSRef] mapUsingSelector:@selector(path)];

	if ([paths count] > 0) {
		NSMutableArray *arguments = [NSMutableArray arrayWithObjects:@"ruby", @"-e", @"load 'mate/../../bin/tm'", nil];

		NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
		NSString *vendorPath = [[thisBundle resourcePath] stringByAppendingPathComponent:@"vendor"];
		NSArray *gemNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:vendorPath error:nil];
		if (gemNames) {
			for (NSString *gemName in gemNames) {
				NSString *gemLibPath = [[vendorPath stringByAppendingPathComponent:gemName] stringByAppendingPathComponent:@"lib"];
				[arguments addObjectsFromArray:[NSArray arrayWithObjects:@"-I", gemLibPath, nil]];
			}
		}

		NSTask *task = [NSTask launchedTaskWithLaunchPath:@"/usr/bin/env" arguments:arguments];
		[task waitUntilExit];
	}

	[pool release];
}

@end
