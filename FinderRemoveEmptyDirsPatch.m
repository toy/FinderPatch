//
//  FinderRemoveEmptyDirsPatch.m
//  FinderPatch
//
//  Created by toy on 03.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderRemoveEmptyDirsPatch.h"

@implementation FinderRemoveEmptyDirsPatch

+ (void) loadPatch {
	NSString *keyEquivalent = @"\b";
	NSUInteger modifierMask = NSCommandKeyMask | NSAlternateKeyMask;

	[self shiftItemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];

	NSMenuItem *removeEmptyDirsItem = [[self patchMenu] addItemWithTitle:@"Remove Empty Dirs" action:@selector(cmdRemoveEmptyDirs:) keyEquivalent:keyEquivalent];
	[removeEmptyDirsItem setKeyEquivalentModifierMask:modifierMask];
	[removeEmptyDirsItem setTarget:self];
}

+ (void) cmdRemoveEmptyDirs:(id)sender {
	[self performSelectorInBackground:@selector(cmdRemoveEmptyDirsAsynchronyously:) withObject:sender];
}

+ (void) cmdRemoveEmptyDirsAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];

	NSArray *selectedPaths = [self refPaths:[finder selection]];

	NSMutableArray *arguments = [NSMutableArray arrayWithObject:@"find"];
	[arguments addObjectsFromArray:selectedPaths];
	[arguments addObjectsFromArray:[@"-depth ( -name .DS_Store -or -type d -empty ) -delete" componentsSeparatedByString:@" "]];
	[[NSTask launchedTaskWithLaunchPath:@"/usr/bin/env" arguments:arguments] waitUntilExit];

	arguments = [NSMutableArray arrayWithObject:@"rmdir"];
	[arguments addObjectsFromArray:selectedPaths];
	[[NSTask launchedTaskWithLaunchPath:@"/usr/bin/env" arguments:arguments] waitUntilExit];

	[pool release];
}

@end
