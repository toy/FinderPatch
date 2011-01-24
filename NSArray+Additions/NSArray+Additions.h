//
//  NSArray+Map.h
//  link
//
//  Created by toy on 20.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef id (^NSIndexer)(id obj, NSUInteger idx);

NSComparisonResult NSCompareUsingSelector(id a, id b, SEL comparator);
NSComparisonResult NSCompare(id a, id b);

@interface NSArray (Additions)

- (NSArray *) mapUsingBlock:(NSIndexer)block;
- (NSArray *) mapUsingSelector:(SEL)aSelector;
- (NSArray *) uniq;
- (NSArray *) reverse;
- (NSArray *) sortedArrayByOtherArray:(NSArray *)other usingComparator:(NSComparator)cmptr;
- (NSComparisonResult) compare:(NSArray *)other;
- (NSComparisonResult) compare:(NSArray *)other usingComparator:(NSComparator)cmptr;

@end

@interface NSMutableArray (Additions)

- (void) addObjectOrNull:(id)anObject;

@end
