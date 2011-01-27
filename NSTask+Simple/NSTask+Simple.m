//
//  NSTask+Simple.m
//  FinderPatch
//
//  Created by toy on 27.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSTask+Simple.h"

@implementation NSTask (Simple)

+ (NSString *) stdoutForCommand:(NSArray *)command {
	NSTask *task = [[[NSTask alloc] init] autorelease];
	NSPipe *pipe = [NSPipe pipe];
	NSFileHandle *handle = [pipe fileHandleForReading];

	[task setLaunchPath:@"/usr/bin/env"];
	[task setArguments:command];
	[task setStandardOutput:pipe];
	[task launch];

	return [[[NSString alloc] initWithData:[handle readDataToEndOfFile] encoding:NSUTF8StringEncoding] autorelease];
}

@end
