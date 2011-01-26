/*
 * TRConstantGlue.m
 * /Applications/Utilities/Terminal.app
 * osaglue 0.5.4
 *
 */

#import "TRConstantGlue.h"

@implementation TRConstant
+ (id)constantWithCode:(OSType)code_ {
    switch (code_) {
        case 'apr ': return [self April];
        case 'aug ': return [self August];
        case 'dec ': return [self December];
        case 'EPS ': return [self EPSPicture];
        case 'feb ': return [self February];
        case 'fri ': return [self Friday];
        case 'GIFf': return [self GIFPicture];
        case 'JPEG': return [self JPEGPicture];
        case 'jan ': return [self January];
        case 'jul ': return [self July];
        case 'jun ': return [self June];
        case 'mar ': return [self March];
        case 'may ': return [self May];
        case 'mon ': return [self Monday];
        case 'nov ': return [self November];
        case 'oct ': return [self October];
        case 'PICT': return [self PICTPicture];
        case 'tr16': return [self RGB16Color];
        case 'tr96': return [self RGB96Color];
        case 'sat ': return [self Saturday];
        case 'sep ': return [self September];
        case 'sun ': return [self Sunday];
        case 'TIFF': return [self TIFFPicture];
        case 'thu ': return [self Thursday];
        case 'tue ': return [self Tuesday];
        case 'wed ': return [self Wednesday];
        case 'alis': return [self alias];
        case '****': return [self anything];
        case 'capp': return [self application];
        case 'bund': return [self applicationBundleID];
        case 'rmte': return [self applicationResponses];
        case 'sign': return [self applicationSignature];
        case 'aprl': return [self applicationURL];
        case 'ask ': return [self ask];
        case 'pbcl': return [self backgroundColor];
        case 'best': return [self best];
        case 'pbtc': return [self boldTextColor];
        case 'bool': return [self boolean];
        case 'qdrt': return [self boundingRectangle];
        case 'pbnd': return [self bounds];
        case 'busy': return [self busy];
        case 'case': return [self case_];
        case 'cmtr': return [self centimeters];
        case 'gcli': return [self classInfo];
        case 'pcls': return [self class_];
        case 'tcln': return [self cleanCommands];
        case 'hclb': return [self closeable];
        case 'lwcl': return [self collating];
        case 'cRGB': return [self color];
        case 'clrt': return [self colorTable];
        case 'pcnt': return [self contents];
        case 'lwcp': return [self copies];
        case 'ccmt': return [self cubicCentimeters];
        case 'cfet': return [self cubicFeet];
        case 'cuin': return [self cubicInches];
        case 'cmet': return [self cubicMeters];
        case 'cyrd': return [self cubicYards];
        case 'tcst': return [self currentSettings];
        case 'pcuc': return [self cursorColor];
        case 'titl': return [self customTitle];
        case 'tdas': return [self dashStyle];
        case 'rdat': return [self data];
        case 'ldt ': return [self date];
        case 'decm': return [self decimalStruct];
        case 'tdpr': return [self defaultSettings];
        case 'degc': return [self degreesCelsius];
        case 'degf': return [self degreesFahrenheit];
        case 'degk': return [self degreesKelvin];
        case 'lwdt': return [self detailed];
        case 'diac': return [self diacriticals];
        case 'comp': return [self doubleInteger];
        case 'elin': return [self elementInfo];
        case 'encs': return [self encodedString];
        case 'lwlp': return [self endingPage];
        case 'enum': return [self enumerator];
        case 'lweh': return [self errorHandling];
        case 'evin': return [self eventInfo];
        case 'expa': return [self expansion];
        case 'exte': return [self extendedFloat];
        case 'faxn': return [self faxNumber];
        case 'feet': return [self feet];
        case 'fsrf': return [self fileRef];
        case 'fss ': return [self fileSpecification];
        case 'furl': return [self fileURL];
        case 'fixd': return [self fixed];
        case 'fpnt': return [self fixedPoint];
        case 'frct': return [self fixedRectangle];
        case 'ldbl': return [self float128bit];
        case 'doub': return [self float_];
        case 'panx': return [self fontAntialiasing];
        case 'font': return [self fontName];
        case 'ptsz': return [self fontSize];
        case 'pfra': return [self frame];
        case 'pisf': return [self frontmost];
        case 'galn': return [self gallons];
        case 'gram': return [self grams];
        case 'cgtx': return [self graphicText];
        case 'hist': return [self history];
        case 'hyph': return [self hyphens];
        case 'ID  ': return [self id_];
        case 'inch': return [self inches];
        case 'pidx': return [self index];
        case 'long': return [self integer];
        case 'itxt': return [self internationalText];
        case 'intl': return [self internationalWritingCode];
        case 'cobj': return [self item];
        case 'kpid': return [self kernelProcessID];
        case 'kgrm': return [self kilograms];
        case 'kmtr': return [self kilometers];
        case 'list': return [self list];
        case 'cct0': return [self listOfFileOrSpecifier];
        case 'litr': return [self liters];
        case 'insl': return [self locationReference];
        case 'lfxd': return [self longFixed];
        case 'lfpt': return [self longFixedPoint];
        case 'lfrc': return [self longFixedRectangle];
        case 'lpnt': return [self longPoint];
        case 'lrct': return [self longRectangle];
        case 'port': return [self machPort];
        case 'mach': return [self machine];
        case 'mLoc': return [self machineLocation];
        case 'metr': return [self meters];
        case 'mile': return [self miles];
        case 'ismn': return [self miniaturizable];
        case 'pmnd': return [self miniaturized];
        case 'msng': return [self missingValue];
        case 'pnam': return [self name];
        case 'no  ': return [self no];
        case 'ptxc': return [self normalTextColor];
        case 'null': return [self null];
        case 'ccol': return [self numberOfColumns];
        case 'crow': return [self numberOfRows];
        case 'nume': return [self numericStrings];
        case 'pori': return [self origin];
        case 'ozs ': return [self ounces];
        case 'lwla': return [self pagesAcross];
        case 'lwld': return [self pagesDown];
        case 'pmin': return [self parameterInfo];
        case 'tpmm': return [self pixelMapRecord];
        case 'QDpt': return [self point];
        case 'ppos': return [self position];
        case 'lbs ': return [self pounds];
        case 'pset': return [self printSettings];
        case 'psn ': return [self processSerialNumber];
        case 'prcs': return [self processes];
        case 'pALL': return [self properties];
        case 'prop': return [self property];
        case 'pinf': return [self propertyInfo];
        case 'punc': return [self punctuation];
        case 'qrts': return [self quarts];
        case 'reco': return [self record];
        case 'obj ': return [self reference];
        case 'prsz': return [self resizable];
        case 'trot': return [self rotation];
        case 'scpt': return [self script];
        case 'tbsl': return [self selected];
        case 'tcnt': return [self selectedTab];
        case 'tprf': return [self settingsSet];
        case 'sing': return [self shortFloat];
        case 'shor': return [self shortInteger];
        case 'psiz': return [self size];
        case 'sqft': return [self squareFeet];
        case 'sqkm': return [self squareKilometers];
        case 'sqrm': return [self squareMeters];
        case 'sqmi': return [self squareMiles];
        case 'sqyd': return [self squareYards];
        case 'lwst': return [self standard];
        case 'lwfp': return [self startingPage];
        case 'tspr': return [self startupSettings];
        case 'TEXT': return [self string];
        case 'styl': return [self styledClipboardText];
        case 'STXT': return [self styledText];
        case 'suin': return [self suiteInfo];
        case 'ttab': return [self tab];
        case 'cct2': return [self tabOrWindowOrAny];
        case 'trpr': return [self targetPrinter];
        case 'cct1': return [self textOrAny];
        case 'tsty': return [self textStyleInfo];
        case 'tdct': return [self titleDisplaysCustomTitle];
        case 'tddn': return [self titleDisplaysDeviceName];
        case 'tdfn': return [self titleDisplaysFileName];
        case 'tdsn': return [self titleDisplaysSettingsName];
        case 'tdsp': return [self titleDisplaysShellPath];
        case 'tdws': return [self titleDisplaysWindowSize];
        case 'ttty': return [self tty];
        case 'type': return [self typeClass];
        case 'utxt': return [self unicodeText];
        case 'magn': return [self unsignedInteger];
        case 'ut16': return [self utf16Text];
        case 'utf8': return [self utf8Text];
        case 'vers': return [self version_];
        case 'pvis': return [self visible];
        case 'whit': return [self whitespace];
        case 'cwin': return [self window];
        case 'psct': return [self writingCode];
        case 'yard': return [self yards];
        case 'yes ': return [self yes];
        case 'iszm': return [self zoomable];
        case 'pzum': return [self zoomed];
        default: return [[self superclass] constantWithCode: code_];
    }
}


/* Enumerators */

+ (TRConstant *)applicationResponses {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"applicationResponses" type: typeEnumerated code: 'rmte'];
    return constantObj;
}

+ (TRConstant *)ask {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"ask" type: typeEnumerated code: 'ask '];
    return constantObj;
}

+ (TRConstant *)case_ {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"case_" type: typeEnumerated code: 'case'];
    return constantObj;
}

+ (TRConstant *)detailed {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"detailed" type: typeEnumerated code: 'lwdt'];
    return constantObj;
}

+ (TRConstant *)diacriticals {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"diacriticals" type: typeEnumerated code: 'diac'];
    return constantObj;
}

+ (TRConstant *)expansion {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"expansion" type: typeEnumerated code: 'expa'];
    return constantObj;
}

+ (TRConstant *)hyphens {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"hyphens" type: typeEnumerated code: 'hyph'];
    return constantObj;
}

+ (TRConstant *)no {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"no" type: typeEnumerated code: 'no  '];
    return constantObj;
}

+ (TRConstant *)numericStrings {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"numericStrings" type: typeEnumerated code: 'nume'];
    return constantObj;
}

+ (TRConstant *)punctuation {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"punctuation" type: typeEnumerated code: 'punc'];
    return constantObj;
}

+ (TRConstant *)standard {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"standard" type: typeEnumerated code: 'lwst'];
    return constantObj;
}

+ (TRConstant *)whitespace {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"whitespace" type: typeEnumerated code: 'whit'];
    return constantObj;
}

+ (TRConstant *)yes {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"yes" type: typeEnumerated code: 'yes '];
    return constantObj;
}


/* Types and properties */

+ (TRConstant *)April {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"April" type: typeType code: 'apr '];
    return constantObj;
}

+ (TRConstant *)August {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"August" type: typeType code: 'aug '];
    return constantObj;
}

+ (TRConstant *)December {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"December" type: typeType code: 'dec '];
    return constantObj;
}

+ (TRConstant *)EPSPicture {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"EPSPicture" type: typeType code: 'EPS '];
    return constantObj;
}

+ (TRConstant *)February {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"February" type: typeType code: 'feb '];
    return constantObj;
}

+ (TRConstant *)Friday {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"Friday" type: typeType code: 'fri '];
    return constantObj;
}

+ (TRConstant *)GIFPicture {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"GIFPicture" type: typeType code: 'GIFf'];
    return constantObj;
}

+ (TRConstant *)JPEGPicture {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"JPEGPicture" type: typeType code: 'JPEG'];
    return constantObj;
}

+ (TRConstant *)January {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"January" type: typeType code: 'jan '];
    return constantObj;
}

+ (TRConstant *)July {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"July" type: typeType code: 'jul '];
    return constantObj;
}

+ (TRConstant *)June {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"June" type: typeType code: 'jun '];
    return constantObj;
}

+ (TRConstant *)March {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"March" type: typeType code: 'mar '];
    return constantObj;
}

+ (TRConstant *)May {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"May" type: typeType code: 'may '];
    return constantObj;
}

+ (TRConstant *)Monday {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"Monday" type: typeType code: 'mon '];
    return constantObj;
}

+ (TRConstant *)November {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"November" type: typeType code: 'nov '];
    return constantObj;
}

+ (TRConstant *)October {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"October" type: typeType code: 'oct '];
    return constantObj;
}

+ (TRConstant *)PICTPicture {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"PICTPicture" type: typeType code: 'PICT'];
    return constantObj;
}

+ (TRConstant *)RGB16Color {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"RGB16Color" type: typeType code: 'tr16'];
    return constantObj;
}

+ (TRConstant *)RGB96Color {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"RGB96Color" type: typeType code: 'tr96'];
    return constantObj;
}

+ (TRConstant *)RGBColor {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"RGBColor" type: typeType code: 'cRGB'];
    return constantObj;
}

+ (TRConstant *)Saturday {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"Saturday" type: typeType code: 'sat '];
    return constantObj;
}

+ (TRConstant *)September {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"September" type: typeType code: 'sep '];
    return constantObj;
}

+ (TRConstant *)Sunday {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"Sunday" type: typeType code: 'sun '];
    return constantObj;
}

+ (TRConstant *)TIFFPicture {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"TIFFPicture" type: typeType code: 'TIFF'];
    return constantObj;
}

+ (TRConstant *)Thursday {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"Thursday" type: typeType code: 'thu '];
    return constantObj;
}

+ (TRConstant *)Tuesday {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"Tuesday" type: typeType code: 'tue '];
    return constantObj;
}

+ (TRConstant *)Wednesday {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"Wednesday" type: typeType code: 'wed '];
    return constantObj;
}

+ (TRConstant *)alias {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"alias" type: typeType code: 'alis'];
    return constantObj;
}

+ (TRConstant *)anything {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"anything" type: typeType code: '****'];
    return constantObj;
}

+ (TRConstant *)application {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"application" type: typeType code: 'capp'];
    return constantObj;
}

+ (TRConstant *)applicationBundleID {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"applicationBundleID" type: typeType code: 'bund'];
    return constantObj;
}

+ (TRConstant *)applicationSignature {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"applicationSignature" type: typeType code: 'sign'];
    return constantObj;
}

+ (TRConstant *)applicationURL {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"applicationURL" type: typeType code: 'aprl'];
    return constantObj;
}

+ (TRConstant *)backgroundColor {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"backgroundColor" type: typeType code: 'pbcl'];
    return constantObj;
}

+ (TRConstant *)best {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"best" type: typeType code: 'best'];
    return constantObj;
}

+ (TRConstant *)boldTextColor {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"boldTextColor" type: typeType code: 'pbtc'];
    return constantObj;
}

+ (TRConstant *)boolean {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"boolean" type: typeType code: 'bool'];
    return constantObj;
}

+ (TRConstant *)boundingRectangle {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"boundingRectangle" type: typeType code: 'qdrt'];
    return constantObj;
}

+ (TRConstant *)bounds {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"bounds" type: typeType code: 'pbnd'];
    return constantObj;
}

+ (TRConstant *)busy {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"busy" type: typeType code: 'busy'];
    return constantObj;
}

+ (TRConstant *)centimeters {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"centimeters" type: typeType code: 'cmtr'];
    return constantObj;
}

+ (TRConstant *)classInfo {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"classInfo" type: typeType code: 'gcli'];
    return constantObj;
}

+ (TRConstant *)class_ {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"class_" type: typeType code: 'pcls'];
    return constantObj;
}

+ (TRConstant *)cleanCommands {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"cleanCommands" type: typeType code: 'tcln'];
    return constantObj;
}

+ (TRConstant *)closeable {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"closeable" type: typeType code: 'hclb'];
    return constantObj;
}

+ (TRConstant *)collating {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"collating" type: typeType code: 'lwcl'];
    return constantObj;
}

+ (TRConstant *)color {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"color" type: typeType code: 'cRGB'];
    return constantObj;
}

+ (TRConstant *)colorTable {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"colorTable" type: typeType code: 'clrt'];
    return constantObj;
}

+ (TRConstant *)contents {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"contents" type: typeType code: 'pcnt'];
    return constantObj;
}

+ (TRConstant *)copies {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"copies" type: typeType code: 'lwcp'];
    return constantObj;
}

+ (TRConstant *)cubicCentimeters {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"cubicCentimeters" type: typeType code: 'ccmt'];
    return constantObj;
}

+ (TRConstant *)cubicFeet {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"cubicFeet" type: typeType code: 'cfet'];
    return constantObj;
}

+ (TRConstant *)cubicInches {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"cubicInches" type: typeType code: 'cuin'];
    return constantObj;
}

+ (TRConstant *)cubicMeters {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"cubicMeters" type: typeType code: 'cmet'];
    return constantObj;
}

+ (TRConstant *)cubicYards {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"cubicYards" type: typeType code: 'cyrd'];
    return constantObj;
}

+ (TRConstant *)currentSettings {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"currentSettings" type: typeType code: 'tcst'];
    return constantObj;
}

+ (TRConstant *)cursorColor {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"cursorColor" type: typeType code: 'pcuc'];
    return constantObj;
}

+ (TRConstant *)customTitle {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"customTitle" type: typeType code: 'titl'];
    return constantObj;
}

+ (TRConstant *)dashStyle {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"dashStyle" type: typeType code: 'tdas'];
    return constantObj;
}

+ (TRConstant *)data {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"data" type: typeType code: 'rdat'];
    return constantObj;
}

+ (TRConstant *)date {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"date" type: typeType code: 'ldt '];
    return constantObj;
}

+ (TRConstant *)decimalStruct {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"decimalStruct" type: typeType code: 'decm'];
    return constantObj;
}

+ (TRConstant *)defaultSettings {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"defaultSettings" type: typeType code: 'tdpr'];
    return constantObj;
}

+ (TRConstant *)degreesCelsius {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"degreesCelsius" type: typeType code: 'degc'];
    return constantObj;
}

+ (TRConstant *)degreesFahrenheit {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"degreesFahrenheit" type: typeType code: 'degf'];
    return constantObj;
}

+ (TRConstant *)degreesKelvin {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"degreesKelvin" type: typeType code: 'degk'];
    return constantObj;
}

+ (TRConstant *)doubleInteger {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"doubleInteger" type: typeType code: 'comp'];
    return constantObj;
}

+ (TRConstant *)elementInfo {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"elementInfo" type: typeType code: 'elin'];
    return constantObj;
}

+ (TRConstant *)encodedString {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"encodedString" type: typeType code: 'encs'];
    return constantObj;
}

+ (TRConstant *)endingPage {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"endingPage" type: typeType code: 'lwlp'];
    return constantObj;
}

+ (TRConstant *)enumerator {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"enumerator" type: typeType code: 'enum'];
    return constantObj;
}

+ (TRConstant *)errorHandling {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"errorHandling" type: typeType code: 'lweh'];
    return constantObj;
}

+ (TRConstant *)eventInfo {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"eventInfo" type: typeType code: 'evin'];
    return constantObj;
}

+ (TRConstant *)extendedFloat {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"extendedFloat" type: typeType code: 'exte'];
    return constantObj;
}

+ (TRConstant *)faxNumber {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"faxNumber" type: typeType code: 'faxn'];
    return constantObj;
}

+ (TRConstant *)feet {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"feet" type: typeType code: 'feet'];
    return constantObj;
}

+ (TRConstant *)fileRef {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fileRef" type: typeType code: 'fsrf'];
    return constantObj;
}

+ (TRConstant *)fileSpecification {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fileSpecification" type: typeType code: 'fss '];
    return constantObj;
}

+ (TRConstant *)fileURL {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fileURL" type: typeType code: 'furl'];
    return constantObj;
}

+ (TRConstant *)fixed {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fixed" type: typeType code: 'fixd'];
    return constantObj;
}

+ (TRConstant *)fixedPoint {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fixedPoint" type: typeType code: 'fpnt'];
    return constantObj;
}

+ (TRConstant *)fixedRectangle {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fixedRectangle" type: typeType code: 'frct'];
    return constantObj;
}

+ (TRConstant *)float128bit {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"float128bit" type: typeType code: 'ldbl'];
    return constantObj;
}

+ (TRConstant *)float_ {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"float_" type: typeType code: 'doub'];
    return constantObj;
}

+ (TRConstant *)fontAntialiasing {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fontAntialiasing" type: typeType code: 'panx'];
    return constantObj;
}

+ (TRConstant *)fontName {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fontName" type: typeType code: 'font'];
    return constantObj;
}

+ (TRConstant *)fontSize {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"fontSize" type: typeType code: 'ptsz'];
    return constantObj;
}

+ (TRConstant *)frame {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"frame" type: typeType code: 'pfra'];
    return constantObj;
}

+ (TRConstant *)frontmost {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"frontmost" type: typeType code: 'pisf'];
    return constantObj;
}

+ (TRConstant *)gallons {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"gallons" type: typeType code: 'galn'];
    return constantObj;
}

+ (TRConstant *)grams {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"grams" type: typeType code: 'gram'];
    return constantObj;
}

+ (TRConstant *)graphicText {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"graphicText" type: typeType code: 'cgtx'];
    return constantObj;
}

+ (TRConstant *)history {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"history" type: typeType code: 'hist'];
    return constantObj;
}

+ (TRConstant *)id_ {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"id_" type: typeType code: 'ID  '];
    return constantObj;
}

+ (TRConstant *)inches {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"inches" type: typeType code: 'inch'];
    return constantObj;
}

+ (TRConstant *)index {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"index" type: typeType code: 'pidx'];
    return constantObj;
}

+ (TRConstant *)integer {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"integer" type: typeType code: 'long'];
    return constantObj;
}

+ (TRConstant *)internationalText {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"internationalText" type: typeType code: 'itxt'];
    return constantObj;
}

+ (TRConstant *)internationalWritingCode {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"internationalWritingCode" type: typeType code: 'intl'];
    return constantObj;
}

+ (TRConstant *)item {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"item" type: typeType code: 'cobj'];
    return constantObj;
}

+ (TRConstant *)kernelProcessID {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"kernelProcessID" type: typeType code: 'kpid'];
    return constantObj;
}

+ (TRConstant *)kilograms {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"kilograms" type: typeType code: 'kgrm'];
    return constantObj;
}

+ (TRConstant *)kilometers {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"kilometers" type: typeType code: 'kmtr'];
    return constantObj;
}

+ (TRConstant *)list {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"list" type: typeType code: 'list'];
    return constantObj;
}

+ (TRConstant *)listOfFileOrSpecifier {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"listOfFileOrSpecifier" type: typeType code: 'cct0'];
    return constantObj;
}

+ (TRConstant *)liters {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"liters" type: typeType code: 'litr'];
    return constantObj;
}

+ (TRConstant *)locationReference {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"locationReference" type: typeType code: 'insl'];
    return constantObj;
}

+ (TRConstant *)longFixed {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"longFixed" type: typeType code: 'lfxd'];
    return constantObj;
}

+ (TRConstant *)longFixedPoint {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"longFixedPoint" type: typeType code: 'lfpt'];
    return constantObj;
}

+ (TRConstant *)longFixedRectangle {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"longFixedRectangle" type: typeType code: 'lfrc'];
    return constantObj;
}

+ (TRConstant *)longPoint {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"longPoint" type: typeType code: 'lpnt'];
    return constantObj;
}

+ (TRConstant *)longRectangle {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"longRectangle" type: typeType code: 'lrct'];
    return constantObj;
}

+ (TRConstant *)machPort {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"machPort" type: typeType code: 'port'];
    return constantObj;
}

+ (TRConstant *)machine {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"machine" type: typeType code: 'mach'];
    return constantObj;
}

+ (TRConstant *)machineLocation {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"machineLocation" type: typeType code: 'mLoc'];
    return constantObj;
}

+ (TRConstant *)meters {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"meters" type: typeType code: 'metr'];
    return constantObj;
}

+ (TRConstant *)miles {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"miles" type: typeType code: 'mile'];
    return constantObj;
}

+ (TRConstant *)miniaturizable {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"miniaturizable" type: typeType code: 'ismn'];
    return constantObj;
}

+ (TRConstant *)miniaturized {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"miniaturized" type: typeType code: 'pmnd'];
    return constantObj;
}

+ (TRConstant *)missingValue {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"missingValue" type: typeType code: 'msng'];
    return constantObj;
}

+ (TRConstant *)name {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"name" type: typeType code: 'pnam'];
    return constantObj;
}

+ (TRConstant *)normalTextColor {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"normalTextColor" type: typeType code: 'ptxc'];
    return constantObj;
}

+ (TRConstant *)null {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"null" type: typeType code: 'null'];
    return constantObj;
}

+ (TRConstant *)numberOfColumns {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"numberOfColumns" type: typeType code: 'ccol'];
    return constantObj;
}

+ (TRConstant *)numberOfRows {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"numberOfRows" type: typeType code: 'crow'];
    return constantObj;
}

+ (TRConstant *)origin {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"origin" type: typeType code: 'pori'];
    return constantObj;
}

+ (TRConstant *)ounces {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"ounces" type: typeType code: 'ozs '];
    return constantObj;
}

+ (TRConstant *)pagesAcross {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"pagesAcross" type: typeType code: 'lwla'];
    return constantObj;
}

+ (TRConstant *)pagesDown {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"pagesDown" type: typeType code: 'lwld'];
    return constantObj;
}

+ (TRConstant *)parameterInfo {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"parameterInfo" type: typeType code: 'pmin'];
    return constantObj;
}

+ (TRConstant *)pixelMapRecord {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"pixelMapRecord" type: typeType code: 'tpmm'];
    return constantObj;
}

+ (TRConstant *)point {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"point" type: typeType code: 'QDpt'];
    return constantObj;
}

+ (TRConstant *)position {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"position" type: typeType code: 'ppos'];
    return constantObj;
}

+ (TRConstant *)pounds {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"pounds" type: typeType code: 'lbs '];
    return constantObj;
}

+ (TRConstant *)printSettings {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"printSettings" type: typeType code: 'pset'];
    return constantObj;
}

+ (TRConstant *)processSerialNumber {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"processSerialNumber" type: typeType code: 'psn '];
    return constantObj;
}

+ (TRConstant *)processes {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"processes" type: typeType code: 'prcs'];
    return constantObj;
}

+ (TRConstant *)properties {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"properties" type: typeType code: 'pALL'];
    return constantObj;
}

+ (TRConstant *)property {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"property" type: typeType code: 'prop'];
    return constantObj;
}

+ (TRConstant *)propertyInfo {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"propertyInfo" type: typeType code: 'pinf'];
    return constantObj;
}

+ (TRConstant *)quarts {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"quarts" type: typeType code: 'qrts'];
    return constantObj;
}

+ (TRConstant *)record {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"record" type: typeType code: 'reco'];
    return constantObj;
}

+ (TRConstant *)reference {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"reference" type: typeType code: 'obj '];
    return constantObj;
}

+ (TRConstant *)resizable {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"resizable" type: typeType code: 'prsz'];
    return constantObj;
}

+ (TRConstant *)rotation {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"rotation" type: typeType code: 'trot'];
    return constantObj;
}

+ (TRConstant *)script {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"script" type: typeType code: 'scpt'];
    return constantObj;
}

+ (TRConstant *)selected {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"selected" type: typeType code: 'tbsl'];
    return constantObj;
}

+ (TRConstant *)selectedTab {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"selectedTab" type: typeType code: 'tcnt'];
    return constantObj;
}

+ (TRConstant *)settingsSet {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"settingsSet" type: typeType code: 'tprf'];
    return constantObj;
}

+ (TRConstant *)shortFloat {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"shortFloat" type: typeType code: 'sing'];
    return constantObj;
}

+ (TRConstant *)shortInteger {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"shortInteger" type: typeType code: 'shor'];
    return constantObj;
}

+ (TRConstant *)size {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"size" type: typeType code: 'psiz'];
    return constantObj;
}

+ (TRConstant *)squareFeet {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"squareFeet" type: typeType code: 'sqft'];
    return constantObj;
}

+ (TRConstant *)squareKilometers {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"squareKilometers" type: typeType code: 'sqkm'];
    return constantObj;
}

+ (TRConstant *)squareMeters {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"squareMeters" type: typeType code: 'sqrm'];
    return constantObj;
}

+ (TRConstant *)squareMiles {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"squareMiles" type: typeType code: 'sqmi'];
    return constantObj;
}

+ (TRConstant *)squareYards {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"squareYards" type: typeType code: 'sqyd'];
    return constantObj;
}

+ (TRConstant *)startingPage {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"startingPage" type: typeType code: 'lwfp'];
    return constantObj;
}

+ (TRConstant *)startupSettings {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"startupSettings" type: typeType code: 'tspr'];
    return constantObj;
}

+ (TRConstant *)string {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"string" type: typeType code: 'TEXT'];
    return constantObj;
}

+ (TRConstant *)styledClipboardText {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"styledClipboardText" type: typeType code: 'styl'];
    return constantObj;
}

+ (TRConstant *)styledText {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"styledText" type: typeType code: 'STXT'];
    return constantObj;
}

+ (TRConstant *)suiteInfo {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"suiteInfo" type: typeType code: 'suin'];
    return constantObj;
}

+ (TRConstant *)tab {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"tab" type: typeType code: 'ttab'];
    return constantObj;
}

+ (TRConstant *)tabOrWindowOrAny {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"tabOrWindowOrAny" type: typeType code: 'cct2'];
    return constantObj;
}

+ (TRConstant *)targetPrinter {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"targetPrinter" type: typeType code: 'trpr'];
    return constantObj;
}

+ (TRConstant *)textOrAny {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"textOrAny" type: typeType code: 'cct1'];
    return constantObj;
}

+ (TRConstant *)textStyleInfo {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"textStyleInfo" type: typeType code: 'tsty'];
    return constantObj;
}

+ (TRConstant *)titleDisplaysCustomTitle {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"titleDisplaysCustomTitle" type: typeType code: 'tdct'];
    return constantObj;
}

+ (TRConstant *)titleDisplaysDeviceName {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"titleDisplaysDeviceName" type: typeType code: 'tddn'];
    return constantObj;
}

+ (TRConstant *)titleDisplaysFileName {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"titleDisplaysFileName" type: typeType code: 'tdfn'];
    return constantObj;
}

+ (TRConstant *)titleDisplaysSettingsName {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"titleDisplaysSettingsName" type: typeType code: 'tdsn'];
    return constantObj;
}

+ (TRConstant *)titleDisplaysShellPath {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"titleDisplaysShellPath" type: typeType code: 'tdsp'];
    return constantObj;
}

+ (TRConstant *)titleDisplaysWindowSize {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"titleDisplaysWindowSize" type: typeType code: 'tdws'];
    return constantObj;
}

+ (TRConstant *)tty {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"tty" type: typeType code: 'ttty'];
    return constantObj;
}

+ (TRConstant *)typeClass {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"typeClass" type: typeType code: 'type'];
    return constantObj;
}

+ (TRConstant *)unicodeText {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"unicodeText" type: typeType code: 'utxt'];
    return constantObj;
}

+ (TRConstant *)unsignedInteger {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"unsignedInteger" type: typeType code: 'magn'];
    return constantObj;
}

+ (TRConstant *)utf16Text {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"utf16Text" type: typeType code: 'ut16'];
    return constantObj;
}

+ (TRConstant *)utf8Text {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"utf8Text" type: typeType code: 'utf8'];
    return constantObj;
}

+ (TRConstant *)version {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"version" type: typeType code: 'vers'];
    return constantObj;
}

+ (TRConstant *)version_ {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"version_" type: typeType code: 'vers'];
    return constantObj;
}

+ (TRConstant *)visible {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"visible" type: typeType code: 'pvis'];
    return constantObj;
}

+ (TRConstant *)window {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"window" type: typeType code: 'cwin'];
    return constantObj;
}

+ (TRConstant *)writingCode {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"writingCode" type: typeType code: 'psct'];
    return constantObj;
}

+ (TRConstant *)yards {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"yards" type: typeType code: 'yard'];
    return constantObj;
}

+ (TRConstant *)zoomable {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"zoomable" type: typeType code: 'iszm'];
    return constantObj;
}

+ (TRConstant *)zoomed {
    static TRConstant *constantObj;
    if (!constantObj)
        constantObj = [TRConstant constantWithName: @"zoomed" type: typeType code: 'pzum'];
    return constantObj;
}

@end

