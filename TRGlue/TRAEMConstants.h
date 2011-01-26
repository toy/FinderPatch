/*
 * TRAEMConstants.h
 * /Applications/Utilities/Terminal.app
 * osaglue 0.5.4
 *
 */

#import <Foundation/Foundation.h>
#import "Appscript/Appscript.h"

/* Types, enumerators, properties */

enum {
    kTRApplicationResponses = 'rmte',
    kTRAsk = 'ask ',
    kTRCase_ = 'case',
    kTRDetailed = 'lwdt',
    kTRDiacriticals = 'diac',
    kTRExpansion = 'expa',
    kTRHyphens = 'hyph',
    kTRNo = 'no  ',
    kTRNumericStrings = 'nume',
    kTRPunctuation = 'punc',
    kTRStandard = 'lwst',
    kTRWhitespace = 'whit',
    kTRYes = 'yes ',
    kTRApril = 'apr ',
    kTRAugust = 'aug ',
    kTRDecember = 'dec ',
    kTREPSPicture = 'EPS ',
    kTRFebruary = 'feb ',
    kTRFriday = 'fri ',
    kTRGIFPicture = 'GIFf',
    kTRJPEGPicture = 'JPEG',
    kTRJanuary = 'jan ',
    kTRJuly = 'jul ',
    kTRJune = 'jun ',
    kTRMarch = 'mar ',
    kTRMay = 'may ',
    kTRMonday = 'mon ',
    kTRNovember = 'nov ',
    kTROctober = 'oct ',
    kTRPICTPicture = 'PICT',
    kTRRGB16Color = 'tr16',
    kTRRGB96Color = 'tr96',
    kTRRGBColor = 'cRGB',
    kTRSaturday = 'sat ',
    kTRSeptember = 'sep ',
    kTRSunday = 'sun ',
    kTRTIFFPicture = 'TIFF',
    kTRThursday = 'thu ',
    kTRTuesday = 'tue ',
    kTRWednesday = 'wed ',
    kTRAlias = 'alis',
    kTRAnything = '****',
    kTRApplication = 'capp',
    kTRApplicationBundleID = 'bund',
    kTRApplicationSignature = 'sign',
    kTRApplicationURL = 'aprl',
    kTRBackgroundColor = 'pbcl',
    kTRBest = 'best',
    kTRBoldTextColor = 'pbtc',
    kTRBoolean = 'bool',
    kTRBoundingRectangle = 'qdrt',
    kTRBounds = 'pbnd',
    kTRBusy = 'busy',
    kTRCentimeters = 'cmtr',
    kTRClassInfo = 'gcli',
    kTRClass_ = 'pcls',
    kTRCleanCommands = 'tcln',
    kTRCloseable = 'hclb',
    kTRCollating = 'lwcl',
    kTRColor = 'cRGB',
    kTRColorTable = 'clrt',
    kTRContents = 'pcnt',
    kTRCopies = 'lwcp',
    kTRCubicCentimeters = 'ccmt',
    kTRCubicFeet = 'cfet',
    kTRCubicInches = 'cuin',
    kTRCubicMeters = 'cmet',
    kTRCubicYards = 'cyrd',
    kTRCurrentSettings = 'tcst',
    kTRCursorColor = 'pcuc',
    kTRCustomTitle = 'titl',
    kTRDashStyle = 'tdas',
    kTRData = 'rdat',
    kTRDate = 'ldt ',
    kTRDecimalStruct = 'decm',
    kTRDefaultSettings = 'tdpr',
    kTRDegreesCelsius = 'degc',
    kTRDegreesFahrenheit = 'degf',
    kTRDegreesKelvin = 'degk',
    kTRDoubleInteger = 'comp',
    kTRElementInfo = 'elin',
    kTREncodedString = 'encs',
    kTREndingPage = 'lwlp',
    kTREnumerator = 'enum',
    kTRErrorHandling = 'lweh',
    kTREventInfo = 'evin',
    kTRExtendedFloat = 'exte',
    kTRFaxNumber = 'faxn',
    kTRFeet = 'feet',
    kTRFileRef = 'fsrf',
    kTRFileSpecification = 'fss ',
    kTRFileURL = 'furl',
    kTRFixed = 'fixd',
    kTRFixedPoint = 'fpnt',
    kTRFixedRectangle = 'frct',
    kTRFloat128bit = 'ldbl',
    kTRFloat_ = 'doub',
    kTRFontAntialiasing = 'panx',
    kTRFontName = 'font',
    kTRFontSize = 'ptsz',
    kTRFrame = 'pfra',
    kTRFrontmost = 'pisf',
    kTRGallons = 'galn',
    kTRGrams = 'gram',
    kTRGraphicText = 'cgtx',
    kTRHistory = 'hist',
    kTRId_ = 'ID  ',
    kTRInches = 'inch',
    kTRIndex = 'pidx',
    kTRInteger = 'long',
    kTRInternationalText = 'itxt',
    kTRInternationalWritingCode = 'intl',
    kTRItem = 'cobj',
    kTRKernelProcessID = 'kpid',
    kTRKilograms = 'kgrm',
    kTRKilometers = 'kmtr',
    kTRList = 'list',
    kTRListOfFileOrSpecifier = 'cct0',
    kTRLiters = 'litr',
    kTRLocationReference = 'insl',
    kTRLongFixed = 'lfxd',
    kTRLongFixedPoint = 'lfpt',
    kTRLongFixedRectangle = 'lfrc',
    kTRLongPoint = 'lpnt',
    kTRLongRectangle = 'lrct',
    kTRMachPort = 'port',
    kTRMachine = 'mach',
    kTRMachineLocation = 'mLoc',
    kTRMeters = 'metr',
    kTRMiles = 'mile',
    kTRMiniaturizable = 'ismn',
    kTRMiniaturized = 'pmnd',
    kTRMissingValue = 'msng',
    kTRName = 'pnam',
    kTRNormalTextColor = 'ptxc',
    kTRNull = 'null',
    kTRNumberOfColumns = 'ccol',
    kTRNumberOfRows = 'crow',
    kTROrigin = 'pori',
    kTROunces = 'ozs ',
    kTRPagesAcross = 'lwla',
    kTRPagesDown = 'lwld',
    kTRParameterInfo = 'pmin',
    kTRPixelMapRecord = 'tpmm',
    kTRPoint = 'QDpt',
    kTRPosition = 'ppos',
    kTRPounds = 'lbs ',
    kTRPrintSettings = 'pset',
    kTRProcessSerialNumber = 'psn ',
    kTRProcesses = 'prcs',
    kTRProperties = 'pALL',
    kTRProperty = 'prop',
    kTRPropertyInfo = 'pinf',
    kTRQuarts = 'qrts',
    kTRRecord = 'reco',
    kTRReference = 'obj ',
    kTRResizable = 'prsz',
    kTRRotation = 'trot',
    kTRScript = 'scpt',
    kTRSelected = 'tbsl',
    kTRSelectedTab = 'tcnt',
    kTRSettingsSet = 'tprf',
    kTRShortFloat = 'sing',
    kTRShortInteger = 'shor',
    kTRSize = 'psiz',
    kTRSquareFeet = 'sqft',
    kTRSquareKilometers = 'sqkm',
    kTRSquareMeters = 'sqrm',
    kTRSquareMiles = 'sqmi',
    kTRSquareYards = 'sqyd',
    kTRStartingPage = 'lwfp',
    kTRStartupSettings = 'tspr',
    kTRString = 'TEXT',
    kTRStyledClipboardText = 'styl',
    kTRStyledText = 'STXT',
    kTRSuiteInfo = 'suin',
    kTRTab = 'ttab',
    kTRTabOrWindowOrAny = 'cct2',
    kTRTargetPrinter = 'trpr',
    kTRTextOrAny = 'cct1',
    kTRTextStyleInfo = 'tsty',
    kTRTitleDisplaysCustomTitle = 'tdct',
    kTRTitleDisplaysDeviceName = 'tddn',
    kTRTitleDisplaysFileName = 'tdfn',
    kTRTitleDisplaysSettingsName = 'tdsn',
    kTRTitleDisplaysShellPath = 'tdsp',
    kTRTitleDisplaysWindowSize = 'tdws',
    kTRTty = 'ttty',
    kTRTypeClass = 'type',
    kTRUnicodeText = 'utxt',
    kTRUnsignedInteger = 'magn',
    kTRUtf16Text = 'ut16',
    kTRUtf8Text = 'utf8',
    kTRVersion = 'vers',
    kTRVersion_ = 'vers',
    kTRVisible = 'pvis',
    kTRWindow = 'cwin',
    kTRWritingCode = 'psct',
    kTRYards = 'yard',
    kTRZoomable = 'iszm',
    kTRZoomed = 'pzum',
};

enum {
    eTRApplications = 'capp',
    eTRColor = 'cRGB',
    eTRItems = 'cobj',
    eTRListOfFileOrSpecifier = 'cct0',
    eTRPrintSettings = 'pset',
    eTRSettingsSets = 'tprf',
    eTRTabOrWindowOrAny = 'cct2',
    eTRTabs = 'ttab',
    eTRTextOrAny = 'cct1',
    eTRWindows = 'cwin',
    pTRBackgroundColor = 'pbcl',
    pTRBoldTextColor = 'pbtc',
    pTRBounds = 'pbnd',
    pTRBusy = 'busy',
    pTRClass_ = 'pcls',
    pTRCleanCommands = 'tcln',
    pTRCloseable = 'hclb',
    pTRCollating = 'lwcl',
    pTRContents = 'pcnt',
    pTRCopies = 'lwcp',
    pTRCurrentSettings = 'tcst',
    pTRCursorColor = 'pcuc',
    pTRCustomTitle = 'titl',
    pTRDefaultSettings = 'tdpr',
    pTREndingPage = 'lwlp',
    pTRErrorHandling = 'lweh',
    pTRFaxNumber = 'faxn',
    pTRFontAntialiasing = 'panx',
    pTRFontName = 'font',
    pTRFontSize = 'ptsz',
    pTRFrame = 'pfra',
    pTRFrontmost = 'pisf',
    pTRHistory = 'hist',
    pTRId_ = 'ID  ',
    pTRIndex = 'pidx',
    pTRMiniaturizable = 'ismn',
    pTRMiniaturized = 'pmnd',
    pTRName = 'pnam',
    pTRNormalTextColor = 'ptxc',
    pTRNumberOfColumns = 'ccol',
    pTRNumberOfRows = 'crow',
    pTROrigin = 'pori',
    pTRPagesAcross = 'lwla',
    pTRPagesDown = 'lwld',
    pTRPosition = 'ppos',
    pTRProcesses = 'prcs',
    pTRProperties = 'pALL',
    pTRResizable = 'prsz',
    pTRSelected = 'tbsl',
    pTRSelectedTab = 'tcnt',
    pTRSize = 'psiz',
    pTRStartingPage = 'lwfp',
    pTRStartupSettings = 'tspr',
    pTRTargetPrinter = 'trpr',
    pTRTitleDisplaysCustomTitle = 'tdct',
    pTRTitleDisplaysDeviceName = 'tddn',
    pTRTitleDisplaysFileName = 'tdfn',
    pTRTitleDisplaysSettingsName = 'tdsn',
    pTRTitleDisplaysShellPath = 'tdsp',
    pTRTitleDisplaysWindowSize = 'tdws',
    pTRTty = 'ttty',
    pTRVersion_ = 'vers',
    pTRVisible = 'pvis',
    pTRZoomable = 'iszm',
    pTRZoomed = 'pzum',
};


/* Events */

enum {
    ecTRActivate = 'misc',
    eiTRActivate = 'actv',
};

enum {
    ecTRClose = 'core',
    eiTRClose = 'clos',
    epTRSaving = 'savo',
    epTRSavingIn = 'kfil',
};

enum {
    ecTRCount = 'core',
    eiTRCount = 'cnte',
    epTREach = 'kocl',
};

enum {
    ecTRDelete = 'core',
    eiTRDelete = 'delo',
};

enum {
    ecTRDoScript = 'core',
    eiTRDoScript = 'dosc',
    epTRIn = 'kfil',
};

enum {
    ecTRDuplicate = 'core',
    eiTRDuplicate = 'clon',
    epTRTo = 'insh',
    epTRWithProperties = 'prdt',
};

enum {
    ecTRExists = 'core',
    eiTRExists = 'doex',
};

enum {
    ecTRGet = 'core',
    eiTRGet = 'getd',
};

enum {
    ecTRGetURL = 'GURL',
    eiTRGetURL = 'GURL',
};

enum {
    ecTRLaunch = 'ascr',
    eiTRLaunch = 'noop',
};

enum {
    ecTRMake = 'core',
    eiTRMake = 'crel',
    epTRAt = 'insh',
    epTRNew_ = 'kocl',
    epTRWithData = 'data',
//  epTRWithProperties = 'prdt',
};

enum {
    ecTRMove = 'core',
    eiTRMove = 'move',
//  epTRTo = 'insh',
};

enum {
    ecTROpen = 'aevt',
    eiTROpen = 'odoc',
};

enum {
    ecTROpenLocation = 'GURL',
    eiTROpenLocation = 'GURL',
    epTRWindow = 'WIND',
};

enum {
    ecTRPrint = 'aevt',
    eiTRPrint = 'pdoc',
    epTRPrintDialog = 'pdlg',
//  epTRWithProperties = 'prdt',
};

enum {
    ecTRQuit = 'aevt',
    eiTRQuit = 'quit',
//  epTRSaving = 'savo',
};

enum {
    ecTRReopen = 'aevt',
    eiTRReopen = 'rapp',
};

enum {
    ecTRRun = 'aevt',
    eiTRRun = 'oapp',
};

enum {
    ecTRSave = 'core',
    eiTRSave = 'save',
//  epTRIn = 'kfil',
};

enum {
    ecTRSet = 'core',
    eiTRSet = 'setd',
//  epTRTo = 'data',
};

