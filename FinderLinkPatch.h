//
//  FinderLinkPatch.h
//  FinderPatch
//
//  Created by toy on 03.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderPatch.h"

typedef BOOL (^NSProposeLinkPath)(NSString *linkPath);

@interface FinderLinkPatch : FinderPatch

+ (void) cmdSymLink:(id)sender;
+ (void) cmdHardLink:(id)sender;
+ (void) cmdSymLinkAsynchronyously:(id)sender;
+ (void) cmdHardLinkAsynchronyously:(id)sender;
+ (void) propeseLinkForPath:(NSString *)path withBlock:(NSProposeLinkPath)block;

@end
