//
//  FinderPatchLoader.m
//  FinderPatch
//
//  Created by toy on 03.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatchLoader.h"

#import "FinderPatch.h"
#import "FinderLabelPatch.h"
#import "FinderTrashPatch.h"
#import "FinderRenamePatch.h"
#import "FinderRemoveEmptyDirsPatch.h"
#import "FinderTerminalPatch.h"
#import "FinderTextMatePatch.h"
#import "FinderOpenWithAppPatch.h"

@implementation FinderPatchLoader

+ (void) load {
	[FinderPatch loadPatch];
	[FinderTrashPatch loadPatch];

	[FinderLabelPatch loadPatch];
	[FinderPatch insertSeparatorInPatchMenu];

	[FinderRenamePatch loadPatch];
	[FinderRemoveEmptyDirsPatch loadPatch];
	[FinderPatch insertSeparatorInPatchMenu];

	[FinderTerminalPatch loadPatch];
	[FinderTextMatePatch loadPatch];
	[FinderPatch insertSeparatorInPatchMenu];

	[FinderOpenWithAppPatch loadPatch];
}

@end
