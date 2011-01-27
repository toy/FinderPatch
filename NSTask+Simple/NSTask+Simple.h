//
//  NSTask+Simple.h
//  FinderPatch
//
//  Created by toy on 27.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTask (Simple)

+ (NSString *) stdoutForCommand:(NSArray *)command;

@end
