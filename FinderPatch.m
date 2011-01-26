//
//  FinderPatch.m
//  FinderPatch
//
//  Created by toy on 10.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

@implementation FinderPatch

+ (void) load {
	if ([self class] == [FinderPatch class]) {
		NSString *finderPatchIconPath = [[self thisBundle] pathForImageResource:@"FinderPatch"];
		NSImage *finderPatchIcon = [[NSImage alloc] initByReferencingFile:finderPatchIconPath];
		[NSApp setApplicationIconImage:finderPatchIcon];
		[finderPatchIcon release];

		LOG_PATCH_LOADED;
	}
}

+ (NSMenu *) fileMenu {
	return [[[NSApp mainMenu] itemWithTitle:@"File"] submenu];
}

+ (NSMenu *) patchMenu {
	static NSMenu *finderPatchMenu = nil;

	if (!finderPatchMenu) {
		NSMenuItem *finderPatchItem = [[self fileMenu] addItemWithTitle:@"Finder Patch" action:nil keyEquivalent:@""];
		finderPatchMenu = [[NSMenu alloc] init];
		[finderPatchItem setSubmenu:finderPatchMenu];
	}

	return finderPatchMenu;
}

+ (NSBundle *) thisBundle {
	return [NSBundle bundleForClass:[self class]];
}

+ (void) insertSeparatorInPatchMenuIfNotEmpty {
	if ([[self patchMenu] numberOfItems] > 0) {
		[[self patchMenu] addItem:[NSMenuItem separatorItem]];
	}
}

@end

