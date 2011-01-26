/*
 * TRReferenceGlue.m
 * /Applications/Utilities/Terminal.app
 * osaglue 0.5.4
 *
 */

#import "TRReferenceGlue.h"

@implementation TRReference

/* +app, +con, +its methods can be used in place of TRApp, TRCon, TRIts macros */

+ (TRReference *)app {
    return [self referenceWithAppData: nil aemReference: AEMApp];
}

+ (TRReference *)con {
    return [self referenceWithAppData: nil aemReference: AEMCon];
}

+ (TRReference *)its {
    return [self referenceWithAppData: nil aemReference: AEMIts];
}


/* ********************************* */

- (NSString *)description {
    return [TRReferenceRenderer formatObject: AS_aemReference appData: AS_appData];
}


/* Commands */

- (TRActivateCommand *)activate {
    return [TRActivateCommand commandWithAppData: AS_appData
                         eventClass: 'misc'
                            eventID: 'actv'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRActivateCommand *)activate:(id)directParameter {
    return [TRActivateCommand commandWithAppData: AS_appData
                         eventClass: 'misc'
                            eventID: 'actv'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRCloseCommand *)close {
    return [TRCloseCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clos'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRCloseCommand *)close:(id)directParameter {
    return [TRCloseCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clos'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRCountCommand *)count {
    return [TRCountCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'cnte'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRCountCommand *)count:(id)directParameter {
    return [TRCountCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'cnte'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRDeleteCommand *)delete {
    return [TRDeleteCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'delo'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRDeleteCommand *)delete:(id)directParameter {
    return [TRDeleteCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'delo'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRDoScriptCommand *)doScript {
    return [TRDoScriptCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'dosc'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRDoScriptCommand *)doScript:(id)directParameter {
    return [TRDoScriptCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'dosc'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRDuplicateCommand *)duplicate {
    return [TRDuplicateCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clon'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRDuplicateCommand *)duplicate:(id)directParameter {
    return [TRDuplicateCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'clon'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRExistsCommand *)exists {
    return [TRExistsCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'doex'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRExistsCommand *)exists:(id)directParameter {
    return [TRExistsCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'doex'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRGetCommand *)get {
    return [TRGetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'getd'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRGetCommand *)get:(id)directParameter {
    return [TRGetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'getd'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRGetURLCommand *)getURL {
    return [TRGetURLCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRGetURLCommand *)getURL:(id)directParameter {
    return [TRGetURLCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRLaunchCommand *)launch {
    return [TRLaunchCommand commandWithAppData: AS_appData
                         eventClass: 'ascr'
                            eventID: 'noop'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRLaunchCommand *)launch:(id)directParameter {
    return [TRLaunchCommand commandWithAppData: AS_appData
                         eventClass: 'ascr'
                            eventID: 'noop'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRMakeCommand *)make {
    return [TRMakeCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'crel'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRMakeCommand *)make:(id)directParameter {
    return [TRMakeCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'crel'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRMoveCommand *)move {
    return [TRMoveCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'move'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRMoveCommand *)move:(id)directParameter {
    return [TRMoveCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'move'
                    directParameter: directParameter
                    parentReference: self];
}

- (TROpenCommand *)open {
    return [TROpenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'odoc'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TROpenCommand *)open:(id)directParameter {
    return [TROpenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'odoc'
                    directParameter: directParameter
                    parentReference: self];
}

- (TROpenLocationCommand *)openLocation {
    return [TROpenLocationCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TROpenLocationCommand *)openLocation:(id)directParameter {
    return [TROpenLocationCommand commandWithAppData: AS_appData
                         eventClass: 'GURL'
                            eventID: 'GURL'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRPrintCommand *)print {
    return [TRPrintCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'pdoc'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRPrintCommand *)print:(id)directParameter {
    return [TRPrintCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'pdoc'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRQuitCommand *)quit {
    return [TRQuitCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'quit'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRQuitCommand *)quit:(id)directParameter {
    return [TRQuitCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'quit'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRReopenCommand *)reopen {
    return [TRReopenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'rapp'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRReopenCommand *)reopen:(id)directParameter {
    return [TRReopenCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'rapp'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRRunCommand *)run {
    return [TRRunCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'oapp'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRRunCommand *)run:(id)directParameter {
    return [TRRunCommand commandWithAppData: AS_appData
                         eventClass: 'aevt'
                            eventID: 'oapp'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRSaveCommand *)save {
    return [TRSaveCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'save'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRSaveCommand *)save:(id)directParameter {
    return [TRSaveCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'save'
                    directParameter: directParameter
                    parentReference: self];
}

- (TRSetCommand *)set {
    return [TRSetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'setd'
                    directParameter: kASNoDirectParameter
                    parentReference: self];
}

- (TRSetCommand *)set:(id)directParameter {
    return [TRSetCommand commandWithAppData: AS_appData
                         eventClass: 'core'
                            eventID: 'setd'
                    directParameter: directParameter
                    parentReference: self];
}


/* Elements */

- (TRReference *)applications {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'capp']];
}

- (TRReference *)color {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cRGB']];
}

- (TRReference *)items {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cobj']];
}

- (TRReference *)listOfFileOrSpecifier {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct0']];
}

- (TRReference *)printSettings {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'pset']];
}

- (TRReference *)settingsSets {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'tprf']];
}

- (TRReference *)tabOrWindowOrAny {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct2']];
}

- (TRReference *)tabs {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'ttab']];
}

- (TRReference *)textOrAny {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cct1']];
}

- (TRReference *)windows {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference elements: 'cwin']];
}


/* Properties */

- (TRReference *)backgroundColor {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pbcl']];
}

- (TRReference *)boldTextColor {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pbtc']];
}

- (TRReference *)bounds {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pbnd']];
}

- (TRReference *)busy {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'busy']];
}

- (TRReference *)class_ {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pcls']];
}

- (TRReference *)cleanCommands {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tcln']];
}

- (TRReference *)closeable {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'hclb']];
}

- (TRReference *)collating {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwcl']];
}

- (TRReference *)contents {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pcnt']];
}

- (TRReference *)copies {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwcp']];
}

- (TRReference *)currentSettings {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tcst']];
}

- (TRReference *)cursorColor {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pcuc']];
}

- (TRReference *)customTitle {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'titl']];
}

- (TRReference *)defaultSettings {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tdpr']];
}

- (TRReference *)endingPage {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwlp']];
}

- (TRReference *)errorHandling {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lweh']];
}

- (TRReference *)faxNumber {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'faxn']];
}

- (TRReference *)fontAntialiasing {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'panx']];
}

- (TRReference *)fontName {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'font']];
}

- (TRReference *)fontSize {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ptsz']];
}

- (TRReference *)frame {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pfra']];
}

- (TRReference *)frontmost {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pisf']];
}

- (TRReference *)history {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'hist']];
}

- (TRReference *)id_ {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ID  ']];
}

- (TRReference *)index {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pidx']];
}

- (TRReference *)miniaturizable {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ismn']];
}

- (TRReference *)miniaturized {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pmnd']];
}

- (TRReference *)name {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pnam']];
}

- (TRReference *)normalTextColor {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ptxc']];
}

- (TRReference *)numberOfColumns {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ccol']];
}

- (TRReference *)numberOfRows {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'crow']];
}

- (TRReference *)origin {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pori']];
}

- (TRReference *)pagesAcross {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwla']];
}

- (TRReference *)pagesDown {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwld']];
}

- (TRReference *)position {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ppos']];
}

- (TRReference *)processes {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'prcs']];
}

- (TRReference *)properties {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pALL']];
}

- (TRReference *)resizable {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'prsz']];
}

- (TRReference *)selected {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tbsl']];
}

- (TRReference *)selectedTab {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tcnt']];
}

- (TRReference *)size {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'psiz']];
}

- (TRReference *)startingPage {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'lwfp']];
}

- (TRReference *)startupSettings {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tspr']];
}

- (TRReference *)targetPrinter {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'trpr']];
}

- (TRReference *)titleDisplaysCustomTitle {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tdct']];
}

- (TRReference *)titleDisplaysDeviceName {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tddn']];
}

- (TRReference *)titleDisplaysFileName {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tdfn']];
}

- (TRReference *)titleDisplaysSettingsName {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tdsn']];
}

- (TRReference *)titleDisplaysShellPath {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tdsp']];
}

- (TRReference *)titleDisplaysWindowSize {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'tdws']];
}

- (TRReference *)tty {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'ttty']];
}

- (TRReference *)version_ {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'vers']];
}

- (TRReference *)visible {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pvis']];
}

- (TRReference *)zoomable {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'iszm']];
}

- (TRReference *)zoomed {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference property: 'pzum']];
}


/* ********************************* */


/* ordinal selectors */

- (TRReference *)first {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference first]];
}

- (TRReference *)middle {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference middle]];
}

- (TRReference *)last {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference last]];
}

- (TRReference *)any {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference any]];
}


/* by-index, by-name, by-id selectors */

- (TRReference *)at:(int)index {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference at: index]];
}

- (TRReference *)byIndex:(id)index {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byIndex: index]];
}

- (TRReference *)byName:(id)name {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byName: name]];
}

- (TRReference *)byID:(id)id_ {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byID: id_]];
}


/* by-relative-position selectors */

- (TRReference *)previous:(ASConstant *)class_ {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference previous: [class_ AS_code]]];
}

- (TRReference *)next:(ASConstant *)class_ {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference next: [class_ AS_code]]];
}


/* by-range selector */

- (TRReference *)at:(int)fromIndex to:(int)toIndex {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference at: fromIndex to: toIndex]];
}

- (TRReference *)byRange:(id)fromObject to:(id)toObject {
    // takes two con-based references, with other values being expanded as necessary
    if ([fromObject isKindOfClass: [TRReference class]])
        fromObject = [fromObject AS_aemReference];
    if ([toObject isKindOfClass: [TRReference class]])
        toObject = [toObject AS_aemReference];
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference byRange: fromObject to: toObject]];
}


/* by-test selector */

- (TRReference *)byTest:(TRReference *)testReference {
    return [TRReference referenceWithAppData: AS_appData
                    aemReference: [AS_aemReference byTest: [testReference AS_aemReference]]];
}


/* insertion location selectors */

- (TRReference *)beginning {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference beginning]];
}

- (TRReference *)end {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference end]];
}

- (TRReference *)before {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference before]];
}

- (TRReference *)after {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference after]];
}


/* Comparison and logic tests */

- (TRReference *)greaterThan:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference greaterThan: object]];
}

- (TRReference *)greaterOrEquals:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference greaterOrEquals: object]];
}

- (TRReference *)equals:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference equals: object]];
}

- (TRReference *)notEquals:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference notEquals: object]];
}

- (TRReference *)lessThan:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference lessThan: object]];
}

- (TRReference *)lessOrEquals:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference lessOrEquals: object]];
}

- (TRReference *)beginsWith:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference beginsWith: object]];
}

- (TRReference *)endsWith:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference endsWith: object]];
}

- (TRReference *)contains:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference contains: object]];
}

- (TRReference *)isIn:(id)object {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference isIn: object]];
}

- (TRReference *)AND:(id)remainingOperands {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference AND: remainingOperands]];
}

- (TRReference *)OR:(id)remainingOperands {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference OR: remainingOperands]];
}

- (TRReference *)NOT {
    return [TRReference referenceWithAppData: AS_appData
                                 aemReference: [AS_aemReference NOT]];
}

@end

