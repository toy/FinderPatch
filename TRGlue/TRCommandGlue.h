/*
 * TRCommandGlue.h
 * /Applications/Utilities/Terminal.app
 * osaglue 0.5.4
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript.h"
#import "TRReferenceRendererGlue.h"

@interface TRCommand : ASCommand
- (NSString *)AS_formatObject:(id)obj appData:(id)appData;
@end


@interface TRActivateCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRCloseCommand : TRCommand
- (TRCloseCommand *)saving:(id)value;
- (TRCloseCommand *)savingIn:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRCountCommand : TRCommand
- (TRCountCommand *)each:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRDeleteCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRDoScriptCommand : TRCommand
- (TRDoScriptCommand *)in:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRDuplicateCommand : TRCommand
- (TRDuplicateCommand *)to:(id)value;
- (TRDuplicateCommand *)withProperties:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRExistsCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRGetCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRGetURLCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRLaunchCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRMakeCommand : TRCommand
- (TRMakeCommand *)at:(id)value;
- (TRMakeCommand *)new_:(id)value;
- (TRMakeCommand *)withData:(id)value;
- (TRMakeCommand *)withProperties:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRMoveCommand : TRCommand
- (TRMoveCommand *)to:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TROpenCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TROpenLocationCommand : TRCommand
- (TROpenLocationCommand *)window:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRPrintCommand : TRCommand
- (TRPrintCommand *)printDialog:(id)value;
- (TRPrintCommand *)withProperties:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRQuitCommand : TRCommand
- (TRQuitCommand *)saving:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRReopenCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRRunCommand : TRCommand
- (NSString *)AS_commandName;
@end


@interface TRSaveCommand : TRCommand
- (TRSaveCommand *)in:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end


@interface TRSetCommand : TRCommand
- (TRSetCommand *)to:(id)value;
- (NSString *)AS_commandName;
- (NSString *)AS_parameterNameForCode:(DescType)code;
@end

