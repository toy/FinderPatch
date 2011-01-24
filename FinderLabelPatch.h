//
//  FinderLabelPatch.h
//  FinderPatch
//
//  Created by toy on 16.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

@interface FinderLabelPatch : FinderPatch

+ (void) updateLabels:(NSNotification *)notification;
+ (BOOL) validateMenuItem:(NSMenuItem *)item;
+ (void) cmdSetLabel:(id)sender;

@end
