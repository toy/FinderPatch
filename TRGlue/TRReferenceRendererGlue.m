/*
 * TRReferenceRendererGlue.m
 * /Applications/Utilities/Terminal.app
 * osaglue 0.5.4
 *
 */

#import "TRReferenceRendererGlue.h"

@implementation TRReferenceRenderer
- (NSString *)propertyByCode:(OSType)code {
    switch (code) {
        case 'pbcl': return @"backgroundColor";
        case 'pbtc': return @"boldTextColor";
        case 'pbnd': return @"bounds";
        case 'busy': return @"busy";
        case 'pcls': return @"class_";
        case 'tcln': return @"cleanCommands";
        case 'hclb': return @"closeable";
        case 'lwcl': return @"collating";
        case 'pcnt': return @"contents";
        case 'lwcp': return @"copies";
        case 'tcst': return @"currentSettings";
        case 'pcuc': return @"cursorColor";
        case 'titl': return @"customTitle";
        case 'tdpr': return @"defaultSettings";
        case 'lwlp': return @"endingPage";
        case 'lweh': return @"errorHandling";
        case 'faxn': return @"faxNumber";
        case 'panx': return @"fontAntialiasing";
        case 'font': return @"fontName";
        case 'ptsz': return @"fontSize";
        case 'pfra': return @"frame";
        case 'pisf': return @"frontmost";
        case 'hist': return @"history";
        case 'ID  ': return @"id_";
        case 'pidx': return @"index";
        case 'ismn': return @"miniaturizable";
        case 'pmnd': return @"miniaturized";
        case 'pnam': return @"name";
        case 'ptxc': return @"normalTextColor";
        case 'ccol': return @"numberOfColumns";
        case 'crow': return @"numberOfRows";
        case 'pori': return @"origin";
        case 'lwla': return @"pagesAcross";
        case 'lwld': return @"pagesDown";
        case 'ppos': return @"position";
        case 'prcs': return @"processes";
        case 'pALL': return @"properties";
        case 'prsz': return @"resizable";
        case 'tbsl': return @"selected";
        case 'tcnt': return @"selectedTab";
        case 'psiz': return @"size";
        case 'lwfp': return @"startingPage";
        case 'tspr': return @"startupSettings";
        case 'trpr': return @"targetPrinter";
        case 'tdct': return @"titleDisplaysCustomTitle";
        case 'tddn': return @"titleDisplaysDeviceName";
        case 'tdfn': return @"titleDisplaysFileName";
        case 'tdsn': return @"titleDisplaysSettingsName";
        case 'tdsp': return @"titleDisplaysShellPath";
        case 'tdws': return @"titleDisplaysWindowSize";
        case 'ttty': return @"tty";
        case 'vers': return @"version_";
        case 'pvis': return @"visible";
        case 'iszm': return @"zoomable";
        case 'pzum': return @"zoomed";
        default: return nil;
    }
}

- (NSString *)elementByCode:(OSType)code {
    switch (code) {
        case 'capp': return @"applications";
        case 'cRGB': return @"color";
        case 'cobj': return @"items";
        case 'cct0': return @"listOfFileOrSpecifier";
        case 'pset': return @"printSettings";
        case 'tprf': return @"settingsSets";
        case 'cct2': return @"tabOrWindowOrAny";
        case 'ttab': return @"tabs";
        case 'cct1': return @"textOrAny";
        case 'cwin': return @"windows";
        default: return nil;
    }
}

- (NSString *)prefix {
    return @"TR";
}

@end

