//
//  FinderLinkPatch.m
//  FinderPatch
//
//  Created by toy on 03.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderLinkPatch.h"

@implementation FinderLinkPatch

+ (void) loadPatch {
	NSString *keyEquivalent = @"l";
	NSUInteger modifierMask = NSCommandKeyMask | NSAlternateKeyMask;

	[self shiftItemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];

	NSMenuItem *symLinkItem = [[self patchMenu] addItemWithTitle:@"Create Symbolic Link" action:@selector(cmdSymLink:) keyEquivalent:keyEquivalent];
	[symLinkItem setKeyEquivalentModifierMask:modifierMask];
	[symLinkItem setTarget:self];

	modifierMask |= NSShiftKeyMask;

	[self shiftItemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];

	NSMenuItem *hardLinkItem = [[self patchMenu] addItemWithTitle:@"Create Hard Link" action:@selector(cmdHardLink:) keyEquivalent:keyEquivalent];
	[hardLinkItem setKeyEquivalentModifierMask:modifierMask];
	[hardLinkItem setTarget:self];
	[hardLinkItem setAlternate:YES];
}

+ (void) cmdSymLink:(id)sender {
	[self performSelectorInBackground:@selector(cmdSymLinkAsynchronyously:) withObject:sender];
}

+ (void) cmdHardLink:(id)sender {
	[self performSelectorInBackground:@selector(cmdHardLinkAsynchronyously:) withObject:sender];
}

+ (void) cmdSymLinkAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];
	NSFileManager *fileManager = [NSFileManager defaultManager];

	NSArray *selectedPaths = [self refPaths:[finder selection]];

	[selectedPaths enumerateObjectsUsingBlock:(id)^(NSString *path, NSUInteger idx, BOOL *stop) {
		if ([fileManager fileExistsAtPath:path]) {
			[self propeseLinkForPath:path withBlock:(NSProposeLinkPath)^(NSString *linkPath){
				return [fileManager createSymbolicLinkAtPath:linkPath withDestinationPath:path error:nil];
			}];
		}
	}];

	[pool release];
}

+ (void) cmdHardLinkAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];
	NSFileManager *fileManager = [NSFileManager defaultManager];

	NSArray *selectedPaths = [self refPaths:[finder selection]];

	[selectedPaths enumerateObjectsUsingBlock:(id)^(NSString *path, NSUInteger idx, BOOL *stop) {
		BOOL isDir;
		if ([fileManager fileExistsAtPath:path isDirectory:&isDir]) {
			if (isDir) {
				NSBeep();
			} else {
				[self propeseLinkForPath:path withBlock:(NSProposeLinkPath)^(NSString *linkPath){
					return [fileManager linkItemAtPath:path toPath:linkPath error:nil];
				}];
			}
		}
	}];

	[pool release];
}

+ (void) propeseLinkForPath:(NSString *)path withBlock:(NSProposeLinkPath)block {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *ext, *pathWOExt, *linkPath;

	pathWOExt = [path stringByDeletingPathExtension];
	ext = [path pathExtension];
	if ([ext length] == 0) {
		ext = nil;
	}

	NSInteger tries = 3;
	NSUInteger i, _i = 100000; // big enough :)
	for (i = 1; i < _i; i++) {
		linkPath = [NSString stringWithFormat:@"%@ %d", pathWOExt, i];
		if (ext) {
			linkPath = [linkPath stringByAppendingPathExtension:ext];
		}
		if (![fileManager fileExistsAtPath:linkPath]) {
			if (block(linkPath)) {
				return;
			} else if (--tries <= 0) {
				NSBeep();
				return;
			}
		}
	}
}

@end
