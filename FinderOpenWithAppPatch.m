//
//  FinderOpenWithAppPatch.m
//  FinderPatch
//
//  Created by toy on 02.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderOpenWithAppPatch.h"

@implementation FinderOpenWithAppPatch

+ (void) load {
	[self openWithAppBundleWithIdentifier:@"com.appzapper.AppZapper" forKeyEquivalent:@"\b"];
	[self openWithAppBundleWithIdentifier:@"com.derlien.DiskInventoryX" forKeyEquivalent:@"d"];
	LOG_PATCH_LOADED;
}

+ (void) openWithAppBundleWithIdentifier:(NSString *)bundleIdentifier forKeyEquivalent:(NSString *)keyEquivalent {
	[self openWithAppBundleWithIdentifier:bundleIdentifier forKeyEquivalent:keyEquivalent andModifierMask:NSCommandKeyMask | NSControlKeyMask];
}

+ (void) openWithAppBundleWithIdentifier:(NSString *)bundleIdentifier forKeyEquivalent:(NSString *)keyEquivalent andModifierMask:(NSUInteger)modifierMask {
	NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
	NSString *appPath = [workspace absolutePathForAppBundleWithIdentifier:bundleIdentifier];

	if (appPath) {
		[self insertSeparatorInPatchMenuIfNotEmpty];

		[self shiftItemWithKeyEquivalent:keyEquivalent andModifierMask:modifierMask];

		NSString *openWithAppItemTitle = [NSString stringWithFormat:@"Open with %@", [self appNameByPath:appPath]];
		NSMenuItem *openWithAppItem = [[self patchMenu] addItemWithTitle:openWithAppItemTitle action:@selector(cmdOpenWithApp:) keyEquivalent:keyEquivalent];
		[openWithAppItem setKeyEquivalentModifierMask:modifierMask];
		[openWithAppItem setTarget:self];
		[openWithAppItem setRepresentedObject:bundleIdentifier];

		NSImage *appIcon = [workspace iconForFile:appPath];
		if (appIcon) {
			[appIcon setSize:NSMakeSize(16, 16)];
			[openWithAppItem setImage:appIcon];
		}
	}
}

+ (NSString *) appNameByPath:(NSString *)appPath {
	NSDictionary *appInfo = [[NSBundle bundleWithPath:appPath] localizedInfoDictionary];
	NSDictionary *appInfoLocalized = [[NSBundle bundleWithPath:appPath] infoDictionary];
	NSString *appName = nil;

	if (!appName) { appName = [appInfoLocalized objectForKey:@"CFBundleDisplayName"]; }
	if (!appName) { appName = [appInfoLocalized objectForKey:(NSString *)kCFBundleNameKey]; }
	if (!appName) { appName = [appInfo objectForKey:@"CFBundleDisplayName"]; }
	if (!appName) { appName = [appInfo objectForKey:(NSString *)kCFBundleNameKey]; }
	if (!appName) { appName = [[appPath stringByDeletingPathExtension] lastPathComponent]; }

	return appName;
}

+ (void) cmdOpenWithApp:(id)sender {
	[self performSelectorInBackground:@selector(cmdOpenWithAppAsynchronyously:) withObject:sender];
}

+ (void) cmdOpenWithAppAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];

	NSArray *urls = [self refUrls:[finder selection]];

	[[NSWorkspace sharedWorkspace] openURLs:urls withAppBundleIdentifier:[sender representedObject] options:NSWorkspaceLaunchDefault additionalEventParamDescriptor:nil launchIdentifiers:NULL];

	[pool release];
}

@end
