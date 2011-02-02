/*
 * TRApplicationGlue.h
 * /Applications/Utilities/Terminal.app
 * osaglue 0.5.4
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript/Appscript.h"
#import "TRConstantGlue.h"
#import "TRReferenceGlue.h"

@interface TRApplication : TRReference

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (id)initWithTargetType:(ASTargetType)targetType_ data:(id)targetData_;

/* initialisers */

+ (id)application;
+ (id)applicationWithName:(NSString *)name;
+ (id)applicationWithBundleID:(NSString *)bundleID;
+ (id)applicationWithURL:(NSURL *)url;
+ (id)applicationWithPID:(pid_t)pid;
+ (id)applicationWithDescriptor:(NSAppleEventDescriptor *)desc;
- (id)init;
- (id)initWithName:(NSString *)name;
- (id)initWithBundleID:(NSString *)bundleID;
- (id)initWithURL:(NSURL *)url;
- (id)initWithPID:(pid_t)pid;
- (id)initWithDescriptor:(NSAppleEventDescriptor *)desc;

/* misc */

- (TRReference *)AS_referenceWithObject:(id)object;
@end

