/*
 * TRReferenceGlue.h
 * /Applications/Utilities/Terminal.app
 * osaglue 0.5.4
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript/Appscript.h"
#import "TRCommandGlue.h"
#import "TRReferenceRendererGlue.h"
#define TRApp ((TRReference *)[TRReference referenceWithAppData: nil aemReference: AEMApp])
#define TRCon ((TRReference *)[TRReference referenceWithAppData: nil aemReference: AEMCon])
#define TRIts ((TRReference *)[TRReference referenceWithAppData: nil aemReference: AEMIts])

@interface TRReference : ASReference

/* +app, +con, +its methods can be used in place of TRApp, TRCon, TRIts macros */

+ (TRReference *)app;
+ (TRReference *)con;
+ (TRReference *)its;

/* ********************************* */

- (NSString *)description;

/* Commands */

- (TRActivateCommand *)activate;
- (TRActivateCommand *)activate:(id)directParameter;
- (TRCloseCommand *)close;
- (TRCloseCommand *)close:(id)directParameter;
- (TRCountCommand *)count;
- (TRCountCommand *)count:(id)directParameter;
- (TRDeleteCommand *)delete;
- (TRDeleteCommand *)delete:(id)directParameter;
- (TRDoScriptCommand *)doScript;
- (TRDoScriptCommand *)doScript:(id)directParameter;
- (TRDuplicateCommand *)duplicate;
- (TRDuplicateCommand *)duplicate:(id)directParameter;
- (TRExistsCommand *)exists;
- (TRExistsCommand *)exists:(id)directParameter;
- (TRGetCommand *)get;
- (TRGetCommand *)get:(id)directParameter;
- (TRGetURLCommand *)getURL;
- (TRGetURLCommand *)getURL:(id)directParameter;
- (TRLaunchCommand *)launch;
- (TRLaunchCommand *)launch:(id)directParameter;
- (TRMakeCommand *)make;
- (TRMakeCommand *)make:(id)directParameter;
- (TRMoveCommand *)move;
- (TRMoveCommand *)move:(id)directParameter;
- (TROpenCommand *)open;
- (TROpenCommand *)open:(id)directParameter;
- (TROpenLocationCommand *)openLocation;
- (TROpenLocationCommand *)openLocation:(id)directParameter;
- (TRPrintCommand *)print;
- (TRPrintCommand *)print:(id)directParameter;
- (TRQuitCommand *)quit;
- (TRQuitCommand *)quit:(id)directParameter;
- (TRReopenCommand *)reopen;
- (TRReopenCommand *)reopen:(id)directParameter;
- (TRRunCommand *)run;
- (TRRunCommand *)run:(id)directParameter;
- (TRSaveCommand *)save;
- (TRSaveCommand *)save:(id)directParameter;
- (TRSetCommand *)set;
- (TRSetCommand *)set:(id)directParameter;

/* Elements */

- (TRReference *)applications;
- (TRReference *)color;
- (TRReference *)items;
- (TRReference *)listOfFileOrSpecifier;
- (TRReference *)printSettings;
- (TRReference *)settingsSets;
- (TRReference *)tabOrWindowOrAny;
- (TRReference *)tabs;
- (TRReference *)textOrAny;
- (TRReference *)windows;

/* Properties */

- (TRReference *)backgroundColor;
- (TRReference *)boldTextColor;
- (TRReference *)bounds;
- (TRReference *)busy;
- (TRReference *)class_;
- (TRReference *)cleanCommands;
- (TRReference *)closeable;
- (TRReference *)collating;
- (TRReference *)contents;
- (TRReference *)copies;
- (TRReference *)currentSettings;
- (TRReference *)cursorColor;
- (TRReference *)customTitle;
- (TRReference *)defaultSettings;
- (TRReference *)endingPage;
- (TRReference *)errorHandling;
- (TRReference *)faxNumber;
- (TRReference *)fontAntialiasing;
- (TRReference *)fontName;
- (TRReference *)fontSize;
- (TRReference *)frame;
- (TRReference *)frontmost;
- (TRReference *)history;
- (TRReference *)id_;
- (TRReference *)index;
- (TRReference *)miniaturizable;
- (TRReference *)miniaturized;
- (TRReference *)name;
- (TRReference *)normalTextColor;
- (TRReference *)numberOfColumns;
- (TRReference *)numberOfRows;
- (TRReference *)origin;
- (TRReference *)pagesAcross;
- (TRReference *)pagesDown;
- (TRReference *)position;
- (TRReference *)processes;
- (TRReference *)properties;
- (TRReference *)resizable;
- (TRReference *)selected;
- (TRReference *)selectedTab;
- (TRReference *)size;
- (TRReference *)startingPage;
- (TRReference *)startupSettings;
- (TRReference *)targetPrinter;
- (TRReference *)titleDisplaysCustomTitle;
- (TRReference *)titleDisplaysDeviceName;
- (TRReference *)titleDisplaysFileName;
- (TRReference *)titleDisplaysSettingsName;
- (TRReference *)titleDisplaysShellPath;
- (TRReference *)titleDisplaysWindowSize;
- (TRReference *)tty;
- (TRReference *)version_;
- (TRReference *)visible;
- (TRReference *)zoomable;
- (TRReference *)zoomed;

/* ********************************* */


/* ordinal selectors */

- (TRReference *)first;
- (TRReference *)middle;
- (TRReference *)last;
- (TRReference *)any;

/* by-index, by-name, by-id selectors */

- (TRReference *)at:(int)index;
- (TRReference *)byIndex:(id)index;
- (TRReference *)byName:(id)name;
- (TRReference *)byID:(id)id_;

/* by-relative-position selectors */

- (TRReference *)previous:(ASConstant *)class_;
- (TRReference *)next:(ASConstant *)class_;

/* by-range selector */

- (TRReference *)at:(int)fromIndex to:(int)toIndex;
- (TRReference *)byRange:(id)fromObject to:(id)toObject;

/* by-test selector */

- (TRReference *)byTest:(TRReference *)testReference;

/* insertion location selectors */

- (TRReference *)beginning;
- (TRReference *)end;
- (TRReference *)before;
- (TRReference *)after;

/* Comparison and logic tests */

- (TRReference *)greaterThan:(id)object;
- (TRReference *)greaterOrEquals:(id)object;
- (TRReference *)equals:(id)object;
- (TRReference *)notEquals:(id)object;
- (TRReference *)lessThan:(id)object;
- (TRReference *)lessOrEquals:(id)object;
- (TRReference *)beginsWith:(id)object;
- (TRReference *)endsWith:(id)object;
- (TRReference *)contains:(id)object;
- (TRReference *)isIn:(id)object;
- (TRReference *)AND:(id)remainingOperands;
- (TRReference *)OR:(id)remainingOperands;
- (TRReference *)NOT;
@end

