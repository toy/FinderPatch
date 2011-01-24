/*
 * FNApplicationGlue.m
 * /System/Library/CoreServices/Finder.app
 * osaglue 0.5.4
 *
 */

#import "FNApplicationGlue.h"

@implementation FNApplication

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (id)initWithTargetType:(ASTargetType)targetType_ data:(id)targetData_ {
    ASAppData *appData;

    appData = [[ASAppData alloc] initWithApplicationClass: [AEMApplication class]
                                            constantClass: [FNConstant class]
                                           referenceClass: [FNReference class]
                                               targetType: targetType_
                                               targetData: targetData_];
    self = [super initWithAppData: appData aemReference: AEMApp];
    [appData release];

    if (!self) return self;
    return self;
}


/* initialisers */

+ (id)application {
    return [[[self alloc] init] autorelease];
}

+ (id)applicationWithName:(NSString *)name {
    return [[[self alloc] initWithName: name] autorelease];
}

+ (id)applicationWithBundleID:(NSString *)bundleID {
    return [[[self alloc] initWithBundleID: bundleID] autorelease];
}

+ (id)applicationWithURL:(NSURL *)url {
    return [[[self alloc] initWithURL: url] autorelease];
}

+ (id)applicationWithPID:(pid_t)pid {
    return [[[self alloc] initWithPID: pid] autorelease];
}

+ (id)applicationWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [[[self alloc] initWithDescriptor: desc] autorelease];
}

- (id)init {
    return [self initWithTargetType: kASTargetCurrent data: nil];
}

- (id)initWithName:(NSString *)name {
    return [self initWithTargetType: kASTargetName data: name];
}

- (id)initWithBundleID:(NSString *)bundleID {
    return [self initWithTargetType: kASTargetBundleID data: bundleID];
}

- (id)initWithURL:(NSURL *)url {
    return [self initWithTargetType: kASTargetURL data: url];
}

- (id)initWithPID:(pid_t)pid {
    return [self initWithTargetType: kASTargetPID data: [NSNumber numberWithInteger: pid]];
}

- (id)initWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [self initWithTargetType: kASTargetDescriptor data: desc];
}


/* misc */

- (FNReference *)AS_referenceWithObject:(id)object {
    if ([object isKindOfClass: [FNReference class]])
        return [[[FNReference alloc] initWithAppData: AS_appData
                aemReference: [object AS_aemReference]] autorelease];
    else if ([object isKindOfClass: [AEMQuery class]])
        return [[[FNReference alloc] initWithAppData: AS_appData
                aemReference: object] autorelease];
    else if (!object)
        return [[[FNReference alloc] initWithAppData: AS_appData
                aemReference: AEMApp] autorelease];
    else
        return [[[FNReference alloc] initWithAppData: AS_appData
                aemReference: AEMRoot(object)] autorelease];
}

@end

