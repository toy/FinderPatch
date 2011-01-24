//
//  FinderPatch.m
//  FinderPatch
//
//  Created by toy on 10.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

@implementation FinderPatch

+ (NSMenu *) fileMenu {
	return [[[NSApp mainMenu] itemWithTitle:@"File"] submenu];
}

+ (NSMenu *) finderPatchMenu {
	static NSMenu *finderPatchMenu = nil;

	if (!finderPatchMenu) {
		NSMenuItem *finderPatchItem = [[self fileMenu] addItemWithTitle:@"Finder Patch" action:nil keyEquivalent:@""];
		finderPatchMenu = [[NSMenu alloc] init];
		[finderPatchItem setSubmenu:finderPatchMenu];
	}

	return finderPatchMenu;
}

@end

