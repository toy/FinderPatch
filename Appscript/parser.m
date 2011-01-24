//
//  parser.m
//  appscript
//

#import "parser.h"

//#define DEBUG 1


/**********************************************************************/


// kAEInheritedProperties isn't defined in OpenScripting.h for some reason
#define kASAEInheritedProperties 'c@#^'

// skip unneeded aete data
#define SKIP_UINT16 cursor += 2;
#define SKIP_OSTYPE cursor += 4;
#define SKIP_STRING cursor += (unsigned char)aeteData[cursor]; cursor += 1;

// realign aete data cursor after reading strings
#define ALIGN cursor += cursor & 1;

// perform a bounds check on aete data cursor to protect against malformed aete data
#define CHECK_CURSOR \
	if (cursor > aeteSize) \
		[NSException raise: @"Bad aete" \
					format: @"Data ended prematurely (%i bytes expected, %i bytes read)", \
							aeteSize, cursor];


/**********************************************************************/


@implementation ASParserDef

- (void)dealloc {
	[name release];
	[super dealloc];
}

- (id)init {
	return nil;
}

- (id)initWithName:(NSString*)name_ code:(OSType)code_ {
	self = [super init];
	if (!self) return self;
	[name_ retain];
	name = name_;
	code = code_;
	hash = [name hash] + (NSUInteger)code;
	return self;
}

- (NSString *)name {
	return name;
}

- (OSType)fourCharCode {
	return code;
}

- (NSUInteger)hash {
	return hash;
}

- (BOOL)isEqual:(id)anObject {
	if (anObject == self) return YES;
	if (!anObject || ![anObject isKindOfClass: [self class]]) return NO;
	return [[self name] isEqual: [anObject name]] && [self fourCharCode] == [(ASParserDef *)anObject fourCharCode];
}

- (NSString *)description {
	return [NSString stringWithFormat: @"<ASParserDef \"%@\" '%@'>", [self name], [AEMObjectRenderer formatOSType: code]];
}

@end


/**********************************************************************/


@implementation ASParserCommandDef : ASParserDef

- (id)initWithName:(NSString*)name_ code:(OSType)code_ {
	return nil;
}

- (id)initWithName:(NSString*)name_ eventClass:(OSType)classCode_ eventID:(OSType)code_ {
	self = [super initWithName: name_ code: code_];
	if (!self) return self;
	classCode = classCode_;
	parameters = [[NSMutableSet alloc] init];
	hash = (NSUInteger)classCode + (NSUInteger)code;
	return self;
}

- (void)dealloc {
	[parameters release];
	[super dealloc];
}

- (OSType)eventClass {
	return classCode;
}

- (OSType)eventID {
	return code;
}

- (void)addParameter:(ASParserDef *)paramDef {
	[parameters addObject: paramDef];
}

- (NSSet *)parameters {
	return (NSSet *)parameters;
}

- (NSUInteger)hash {
	return hash;
}

- (BOOL)isEqual:(id)anObject {
	return [super isEqual: anObject]
			&& [self eventClass] == [anObject eventClass]
			&& [[self parameters] isEqual: [anObject parameters]];
}

- (NSString *)description {
	return [NSString stringWithFormat: @"<ASParserCommandDef \"%@\" '%@'/'%@' %@>", 
			[self name], [AEMObjectRenderer formatOSType: classCode], 
			[AEMObjectRenderer formatOSType: code], [self parameters]];
}

@end


/**********************************************************************/


@implementation ASAETEParser

- (id)init {
	self = [super init];
	if (!self) return self;
	commands    = [[NSMutableDictionary alloc] init];
	properties  = [[NSMutableSet alloc] init];
	elements    = [[NSMutableSet alloc] init];
	classes     = [[NSMutableSet alloc] init];
	enumerators = [[NSMutableSet alloc] init];
	// following are used in -parse: to supply 'missing' singular/plural class names
	classAndElementDefsByCode = [[NSMutableDictionary alloc] init];
	foundClassCodes           = [[NSMutableSet alloc] init];
	foundElementCodes         = [[NSMutableSet alloc] init];
	return self;
}

- (void)dealloc {
	[commands release];
	[properties release];
	[elements release];
	[classes release];
	[enumerators release];
	[classAndElementDefsByCode release];
	[foundClassCodes release];
	[foundElementCodes release];
	[super dealloc];
}

// Data source methods

- (unsigned short)integer {
	unsigned short *n;
	
	n = (void *)aeteData + cursor;
	cursor += 2;
	return *n;
}

- (OSType)word {
	OSType *t;
	
	t = (void *)aeteData + cursor;
	cursor += 4;
	return *t;
}

- (NSString *)name {
	unsigned char len;
	NSString *s;
	
	len = aeteData[cursor]; // Pascal string
	cursor += 1;
	if (len) {
		s = [[NSString alloc] initWithBytes: (aeteData + cursor)
									 length: len
								   encoding: NSMacOSRomanStringEncoding];
	} else {
		s = [[NSString alloc] init];
	}
	cursor += len;
	return s;
}

// Parse methods

- (void)parseCommand {
	NSString *name, *paramName;
	ASParserCommandDef *commandDef, *otherCommandDef;
	OSType classCode, code;
	ASParserDef *paramDef;
	int i, n;
	
	name = [self name];
	#ifdef DEBUG
		NSLog(@"Parse Command %@\n", name);
	#endif
	SKIP_STRING;		// description
	ALIGN;
	classCode = [self word];
	code = [self word];
	commandDef = [[ASParserCommandDef alloc] initWithName: name 
											   eventClass: classCode
												  eventID: code];
	// skip result
	SKIP_OSTYPE;		// datatype
	SKIP_STRING;		// description
	ALIGN;
	SKIP_UINT16;		// flags
	// skip direct parameter
	SKIP_OSTYPE;		// datatype
	SKIP_STRING;		// description
	ALIGN;
	SKIP_UINT16;		// flags
	// parse keyword parameters
	/* Note: overlapping command definitions (e.g. InDesign) should be processed as follows:
		- If their names and codes are the same, only the last definition is used; other definitions are ignored and will not compile.
		- If their names are the same but their codes are different, only the first definition is used; other definitions are ignored and will not compile.
		- If a dictionary-defined command has the same name but different code to a built-in definition, escape its name so it doesn't conflict with the default built-in definition.
	*/
	otherCommandDef = [commands objectForKey: name];
	if (!otherCommandDef
			|| [commandDef eventClass] == [otherCommandDef eventClass]
			&& [commandDef eventID] == [otherCommandDef eventID])
		[commands setObject: commandDef forKey: name];
	n = [self integer];
	for (i = 0; i < n; i++) {
		paramName = [self name];
		ALIGN;
		paramDef = [[ASParserDef alloc] initWithName: paramName code: [self word]];
		SKIP_OSTYPE;	// datatype
		SKIP_STRING;	// description
		ALIGN;
		SKIP_UINT16;	// flags
		[commandDef addParameter: paramDef];
		[paramDef release];
		[paramName release];
		CHECK_CURSOR;
	}
	[commandDef release];
	[name release];
}

- (void)parseClass {
	NSString *className, *propertyName;
	AEMType *code;
	OSType classCode, propertyCode;
	ASParserDef *classDef, *propertyDef;
	BOOL isPlural = NO;
	short flags;
	int i, n, m;
	
	className = [self name];
	#ifdef DEBUG
		NSLog(@"Parse Class %@\n", className);
	#endif
	ALIGN;
	classCode = [self word];
	SKIP_STRING;		// description
	ALIGN;
	// properties
	n = [self integer];
	for (i = 0; i < n; i++) {
		propertyName = [self name];
		#ifdef DEBUG
			NSLog(@"    property: %@\n", propertyName);
		#endif
		ALIGN;
		propertyCode = [self word];
		SKIP_OSTYPE;	// datatype
		SKIP_STRING;	// description
		ALIGN;
		flags = [self integer];
		if (propertyCode != kASAEInheritedProperties) {
			// it's a normal property definition, not a superclass  definition
			propertyDef = [[ASParserDef alloc] initWithName: propertyName code: propertyCode];
			if (flags & 1)
				// class name is plural
				isPlural = YES;
			else if (![properties containsObject: propertyDef])
				// add to list of property definitions
				[properties addObject: propertyDef];
			[propertyDef release];
		}
		[propertyName release];
		CHECK_CURSOR;
	}
	// skip elements
	n = [self integer];
	#ifdef DEBUG
		NSLog(@"    skipping %i elements\n", n);
	#endif
	for (i = 0; i < n; i++) {
		SKIP_OSTYPE;	// code
		m = [self integer]; // number of reference forms
		cursor += 4 * m;
		CHECK_CURSOR;
	}
	// add either singular (class) or plural (element) name definition
	classDef = [[ASParserDef alloc] initWithName: className code: classCode];
	code = [AEMType typeWithCode: classCode];
	if (isPlural) {
		if (![elements containsObject: classDef]) {
			[elements addObject: classDef];
			[foundElementCodes addObject: code];
		}
	} else {
		if (![classes containsObject: classDef]) {
			[classes addObject: classDef];
			[foundClassCodes addObject: code];
		}
	}
	[classAndElementDefsByCode setObject: classDef forKey: code];
	[classDef release];
	[className release];
}

- (void)parseComparison { // comparison info isn't used
	SKIP_STRING;		// name
	ALIGN;
	SKIP_OSTYPE;		// code
	SKIP_STRING;		// description
	ALIGN;
}

- (void)parseEnumeration {
	NSString *name;
	ASParserDef *enumeratorDef;
	int i, n;
	
	SKIP_OSTYPE;		// code
	n = [self integer];
	#ifdef DEBUG
		NSLog(@"parsing %i enumerators\n", n);
	#endif
	// enumerators
	for (i = 0; i < n; i++) {
		name = [self name];
		ALIGN;
		#ifdef DEBUG
			NSLog(@"enum: %@\n", [enumeratorDef name]);
		#endif
		enumeratorDef = [[ASParserDef alloc] initWithName: name code: [self word]];
		SKIP_STRING;	// description
		ALIGN;
		if (![enumerators containsObject: enumeratorDef])
			[enumerators addObject: enumeratorDef];
		[enumeratorDef release];
		[name release];
		CHECK_CURSOR;
	}
}

- (void)parseSuite {
	int i, n;
	
	#ifdef DEBUG
		NSLog(@"\n\nParse Suite %@\n", [self name]);
	#else
		SKIP_STRING;	// name string
	#endif	
	SKIP_STRING;		// description
	ALIGN;
	SKIP_OSTYPE;		// code
	SKIP_UINT16;		// level
	SKIP_UINT16;		// version
	n = [self integer];
	#ifdef DEBUG
		NSLog(@"\nparsing %i commands...\n", n);
	#endif
	for (i = 0; i < n; i++) {
		[self parseCommand];
		CHECK_CURSOR;
	}
	n = [self integer];
	#ifdef DEBUG
		NSLog(@"\nparsing %i classes...\n", n);
	#endif
	for (i = 0; i < n; i++) {
		[self parseClass];
		CHECK_CURSOR;
	}
	n = [self integer];
	for (i = 0; i < n; i++) {
		[self parseComparison];
		CHECK_CURSOR;
	}
	n = [self integer];
	#ifdef DEBUG
		NSLog(@"\nparsing %i enumerations...\n", n);
	#endif
	for (i = 0; i < n; i++) {
		[self parseEnumeration];
		CHECK_CURSOR;
	}
}

- (void)parseAETEDescriptor:(NSAppleEventDescriptor *)aete {
	NSData *data;
	int j, n;
	if ([aete descriptorType] == typeAETE || [aete descriptorType] == typeAEUT) {
		data = [aete data];
		aeteData = (char *)[data bytes];
		aeteSize = [data length];
		cursor = 6; // skip version, language, script integers
		n = [self integer];
		for (j = 0; j < n; j++)
			[self parseSuite];
	}
}

- (ASAETEParser *)parse:(id)aetes {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSEnumerator *enumerator;
	NSString *code;
	int i;
	
	if ([aetes isKindOfClass: [NSAppleEventDescriptor class]]) {
		if ([aetes descriptorType] != typeAEList)
			aetes = [aetes coerceToDescriptorType: typeAEList];
		for (i = 1; i <= [aetes numberOfItems]; i++)
			[self parseAETEDescriptor: [aetes descriptorAtIndex: i]];
	} else if ([aetes isKindOfClass: [NSArray class]]) {
		for (i = 0; i < [aetes count]; i++)
			[self parseAETEDescriptor: [aetes objectAtIndex: i]];
	} else {
		[pool drain];
		[NSException raise: @"Bad aete" 
					format: @"Not an AETE descriptor or AEList/NSArray of AETE descriptors: %@", aetes];
	}
	/* singular names are normally used in the classes table and plural names in the elements table. However, if an aete defines a singular name but not a plural name then the missing plural name is substituted with the singular name; and vice-versa if there's no singular equivalent for a plural name.
	*/
	enumerator = [foundClassCodes objectEnumerator];
	while (code = [enumerator nextObject]) {
		if (![foundElementCodes containsObject: code]) {
			#ifdef DEBUG
				NSLog(@"missing element: %@\n", code);
			#endif
			[elements addObject: [classAndElementDefsByCode objectForKey: code]];
		}
	}
	enumerator = [foundElementCodes objectEnumerator];
	while (code = [enumerator nextObject]) {
		if (![foundClassCodes containsObject: code]) {
			#ifdef DEBUG
				NSLog(@"missing class: %@\n", code);
			#endif
			[classes addObject: [classAndElementDefsByCode objectForKey: code]];
		}
	}
	[pool drain];
	return self;
}

- (NSArray *)classes {
	return [classes allObjects];
}

- (NSArray *)enumerators {
	return [enumerators allObjects];
}
- (NSArray *)properties {
	return [properties allObjects];
}

- (NSArray *)elements {
	return [elements allObjects];
}
- (NSArray *)commands {
	return [commands allValues];
}
@end
