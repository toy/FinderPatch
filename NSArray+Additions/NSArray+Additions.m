//
//  NSArray+Map.m
//  link
//
//  Created by toy on 20.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Additions.h"

NSComparisonResult NSCompareUsingSelector(id a, id b, SEL comparator) {
	if (a && a != [NSNull null]) {
		if (b && b != [NSNull null]) {
			return (NSComparisonResult)[a performSelector:comparator withObject:b];
		} else {
			return NSOrderedDescending;
		}
	} else {
		if (b && b != [NSNull null]) {
			return NSOrderedAscending;
		} else {
			return NSOrderedSame;
		}
	}
}

NSComparisonResult NSCompare(id a, id b) {
	return NSCompareUsingSelector(a, b, @selector(compare:));
}

@implementation NSArray (Additions)

- (NSArray *) mapUsingBlock:(NSIndexer)block {
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:[self count]];
	[self enumerateObjectsUsingBlock:(id)^(id obj, NSUInteger idx, BOOL *stop) {
		id result = block(obj, idx);
		[results addObjectOrNull:result];
	}];
	return results;
}

- (NSArray *) mapUsingSelector:(SEL)aSelector {
	NSMutableArray *results = [NSMutableArray arrayWithCapacity:[self count]];
	[self enumerateObjectsUsingBlock:(id)^(id obj, NSUInteger idx, BOOL *stop) {
		id result = [obj performSelector:aSelector];
		[results addObjectOrNull:result];
	}];
	return results;
}

- (NSArray *) uniq {
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:([self count] / 2)];
	for (id obj in self) {
		if(![array containsObject:obj]) {
			[array addObject:obj];
		}
	}
	return array;
}

- (NSArray *) reverse {
	return [[self reverseObjectEnumerator] allObjects];
}

- (NSArray *) sortedArrayByOtherArray:(NSArray *)other usingComparator:(NSComparator)cmptr {
	if ([self count] != [other count]) {
		return nil;
	}

	NSMutableArray *results = [NSMutableArray arrayWithCapacity:[self count]];
	NSUInteger i, _i = [self count];

	for (i = 0; i < _i; i++) {
		[results addObject:[NSNumber numberWithUnsignedInteger:i]];
	}

	[results sortUsingComparator:(NSComparator)^(id obj1, id obj2) {
		return cmptr([other objectAtIndex:[obj1 unsignedIntegerValue]], [other objectAtIndex:[obj2 unsignedIntegerValue]]);
	}];

	for (i = 0; i < _i; i++) {
		NSUInteger idx = [[results objectAtIndex:i] unsignedIntegerValue];
		[results replaceObjectAtIndex:i withObject:[self objectAtIndex:idx]];
	}

	return results;
}

- (NSComparisonResult) compare:(NSArray *)other usingComparator:(NSComparator)cmptr {
	NSComparisonResult result;
	NSUInteger _a = [self count], _b = [other count];
	NSUInteger i, _i = MIN(_a, _b);
	for (i = 0; i < _i; i++) {
		result = cmptr([self objectAtIndex:i], [other objectAtIndex:i]);
		if (result != NSOrderedSame) {
			return result;
		}
	}
	return [[NSNumber numberWithUnsignedInteger:_a] compare:[NSNumber numberWithUnsignedInteger:_b]];
}

- (NSComparisonResult) compare:(NSArray *)other {
	return [self compare:other usingComparator:(NSComparator)^(id obj1, id obj2) {
		return NSCompare(obj1, obj2);
	}];
}

@end

@implementation NSMutableArray (Additions)

- (void) addObjectOrNull:(id)anObject {
	[self addObject:anObject ? anObject : [NSNull null]];
}

@end
