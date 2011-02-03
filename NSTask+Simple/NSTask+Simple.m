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
	NSPipe *stdOutPipe = [NSPipe pipe];
	NSFileHandle *stdOutReadHandle = [stdOutPipe fileHandleForReading];

	[task setLaunchPath:@"/usr/bin/env"];
	[task setArguments:command];
	[task setStandardOutput:stdOutPipe];
	[task launch];

	return [[[NSString alloc] initWithData:[stdOutReadHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding] autorelease];
}

@end
