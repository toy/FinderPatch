//
//  FinderRenamePatch.m
//  FinderPatch
//
//  Created by toy on 03.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderRenamePatch.h"

@implementation FinderRenamePatch

+ (void) loadPatch {
	NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
	NSString *textMatePath = [workspace absolutePathForAppBundleWithIdentifier:@"com.macromates.textmate"];

	if (textMatePath) {
		NSString *keyEquivalent = @"\r";
		NSUInteger modifierMask = NSCommandKeyMask | NSControlKeyMask;

		[self shiftItemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];

		NSMenuItem *renameSelectedItem = [[self patchMenu] addItemWithTitle:@"Rename Selected…" action:@selector(cmdRenameSelected:) keyEquivalent:keyEquivalent];
		[renameSelectedItem setKeyEquivalentModifierMask:modifierMask];
		[renameSelectedItem setTarget:self];

		modifierMask |= NSShiftKeyMask;

		[self shiftItemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];

		NSMenuItem *renameSelectedRecursiveItem = [[self patchMenu] addItemWithTitle:@"Rename Selected Recursive…" action:@selector(cmdRenameSelectedRecursive:) keyEquivalent:keyEquivalent];
		[renameSelectedRecursiveItem setKeyEquivalentModifierMask:modifierMask];
		[renameSelectedRecursiveItem setTarget:self];
		[renameSelectedRecursiveItem setAlternate:YES];
	}
}

+ (void) cmdRenameSelected:(id)sender {
	[self performSelectorInBackground:@selector(cmdRenameSelectedAsynchronyously:) withObject:sender];
}

+ (void) cmdRenameSelectedRecursive:(id)sender {
	[self performSelectorInBackground:@selector(cmdRenameSelectedRecursiveAsynchronyously:) withObject:sender];
}

+ (void) cmdRenameSelectedAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];

	NSArray *selectedPaths = [self refPaths:[finder selection]];

	[self renamePaths:[selectedPaths mapUsingBlock:(NSIndexer)^(NSString *path, NSUInteger idx) {
		return [NSArray arrayWithObjects:[path stringByDeletingLastPathComponent], [path lastPathComponent], nil];
	}]];

	[pool release];
}

+ (void) cmdRenameSelectedRecursiveAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];
	NSFileManager *fileManager = [NSFileManager defaultManager];

	NSArray *selectedPaths = [self refPaths:[finder selection]];

	NSMutableArray *pathPairs = [NSMutableArray array];

	for (NSString *selectedPath in selectedPaths) {
		NSString *dirName = [selectedPath stringByDeletingLastPathComponent];
		NSString *baseName = [selectedPath lastPathComponent];

		[pathPairs addObject:[NSArray arrayWithObjects:dirName, baseName, nil]];

		NSArray *children = [fileManager subpathsOfDirectoryAtPath:selectedPath error:NULL];
		for (NSString *child in children) {
			[pathPairs addObject:[NSArray arrayWithObjects:dirName, [baseName stringByAppendingPathComponent:child], nil]];
		}
	}

	[self renamePaths:pathPairs];

	[pool release];
}

+ (void) renamePaths:(NSArray *)pathPairs {
	if ([pathPairs count] > 0) {
		NSArray *pathPair;
		NSString *prefixPath, *editPath, *changedPath, *srcPath, *dstPath;
		const char *srcPathS, *dstPathS;

		NSMutableString *dataIn = [NSMutableString string];
		for (pathPair in pathPairs) {
			editPath = [pathPair objectAtIndex:1];
			[dataIn appendFormat:@"%@\n", [editPath stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"]];
		}

		NSString *dataOut = [self pipeThroughMate:dataIn];
		NSArray *changedPaths = [[dataOut stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsSeparatedByString:@"\n"];
		NSFileManager *fileManager = [NSFileManager defaultManager];

		if ([pathPairs count] != [changedPaths count]) {
			NSRunAlertPanel(@"Can't rename", @"Don't add/delete lines", @"OK", nil, nil);
		} else {
			NSUInteger i, ii, _i = [pathPairs count];
			for (ii = 0; ii < _i; ii++) { i = _i - ii - 1;
				pathPair = [pathPairs objectAtIndex:i];
				prefixPath = [pathPair objectAtIndex:0];
				editPath = [pathPair objectAtIndex:1];
				changedPath = [changedPaths objectAtIndex:i];
				changedPath = [changedPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
				changedPath = [changedPath stringByReplacingOccurrencesOfString:@"\\r" withString:@"\r"];

				if ([changedPath length] > 0 && ![editPath isEqualToString:changedPath]) {
					dstPath = [prefixPath stringByAppendingPathComponent:changedPath];
					dstPathS = [dstPath fileSystemRepresentation];
					if ([editPath caseInsensitiveCompare:changedPath] == NSOrderedSame || access(dstPathS, F_OK) == -1) {
						srcPath = [prefixPath stringByAppendingPathComponent:editPath];
						srcPathS = [srcPath fileSystemRepresentation];
						[fileManager createDirectoryAtPath:[dstPath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:NULL];
						rename(srcPathS, dstPathS); // using rename as it renames when need to only change case
					}
				}
			}
		}
	} else {
		NSBeep();
	}
}

+ (NSString *) pipeThroughMate:(NSString *)data {
	NSTask *task = [[[NSTask alloc] init] autorelease];
	NSPipe *stdInPipe = [NSPipe pipe];
	NSPipe *stdOutPipe = [NSPipe pipe];
	NSFileHandle *stdInWriteHandle = [stdInPipe fileHandleForWriting];
	NSFileHandle *stdOutReadHandle = [stdOutPipe fileHandleForReading];

	[task setLaunchPath:@"/usr/bin/env"];
	[task setArguments:[NSArray arrayWithObjects:@"mate", @"-w", nil]];
	[task setStandardInput:stdInPipe];
	[task setStandardOutput:stdOutPipe];
	[task launch];

	[stdInWriteHandle writeData:[data dataUsingEncoding:NSUTF8StringEncoding]];
	[stdInWriteHandle closeFile];

	return [[[NSString alloc] initWithData:[stdOutReadHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding] autorelease];
}

@end
