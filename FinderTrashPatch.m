//
//  FinderTrashPatch.m
//  FinderPatch
//
//  Created by toy on 17.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinderTrashPatch.h"

@interface NSObject (FinderFaking)

- (id) globalWindowController;
- (id) frontmostBrowserWindowControllerIncludingDesktop;
- (id) browserViewController;
- (id) sortColumn;
- (int) arrangeBy;
- (BOOL) sortInIncreasingOrder;
- (BOOL) calculateAllSizes;

@end

typedef enum {
	FPSortTypeColumn,
	FPSortTypeList,
	FPSortTypeIcon
} FPSortType;

NSComparator compareFinderAttributes = (NSComparator)^(id a, id b) {
	id c = (a && a != [NSNull null]) ? a : b;
	if ([c isKindOfClass:[NSString class]]) {
		return NSCompareUsingSelector(a, b, @selector(localizedStandardCompare:));
	} else if ([c isKindOfClass:[NSNumber class]]) { // sorting by size is inversed
		return -NSCompare(a, b);
	} else {
		return NSCompare(a, b);
	}
};

@implementation FinderTrashPatch

+ (void) load {
	[[[self fileMenu] itemWithTitle:@"Move to Trash"] setTarget:self];
	LOG_PATCH_LOADED;
}

+ (void) cmdMoveToTrash:(id)sender {
	[self performSelectorInBackground:@selector(cmdMoveToTrashAsynchronyously:) withObject:sender];
}

+ (void) cmdMoveToTrashAsynchronyously:(id)sender {
	id pool = [[NSAutoreleasePool alloc] init];

	id cmdTarget = [NSApp targetForAction:@selector(cmdMoveToTrash:)];
	if (cmdTarget == nil) {
		return;
	}

	NSViewController *viewController = [self frontmostBrowserViewController];
	if ([NSStringFromClass([viewController class]) isEqualToString:@"TDesktopViewController"]) {
		[cmdTarget cmdMoveToTrash:sender]; // just move to trash, there is nothing I can do
	} else {
		[self selectNextAfterBlock:^() {
			[cmdTarget cmdMoveToTrash:sender];
		} viewController:viewController];
	}

	[pool release];
}

+ (NSViewController *) frontmostBrowserViewController {
	return [[[NSClassFromString(@"TGlobalWindowController") globalWindowController] frontmostBrowserWindowControllerIncludingDesktop] browserViewController];
}

+ (NSArray *) getUrls:(FNReference *)ref {
	return [[ref getListOfType:typeFSRef] mapUsingSelector:@selector(url)];
}

+ (void) selectNextAfterBlock:(void (^)())block viewController:(NSViewController *)viewController {
	FNApplication *finder = [FNApplication applicationWithName:@"Finder"];

	NSDictionary *sortByToResourceValueKeys = [
																						 NSDictionary dictionaryWithObjectsAndKeys:
																						 NSURLContentModificationDateKey, @"dateModified",
																						 NSURLCreationDateKey, @"dateCreated",
																						 NSURLContentAccessDateKey, @"dateLastOpened",
																						 NSURLFileAllocatedSizeKey, @"size",
																						 NSURLLocalizedTypeDescriptionKey, @"kind",
																						 NSURLLocalizedLabelKey, @"label",
																						 nil
																						 ];

	FPSortType sortType;
	BOOL reverseSort = NO;
	BOOL calculateFolderSize = NO;
	NSString *sortBy = nil;

	if ([viewController isKindOfClass:NSClassFromString(@"TColumnViewController")]) {
		sortType = FPSortTypeColumn;
		sortBy = [[@"name dateModified dateCreated size kind label" componentsSeparatedByString:@" "] objectAtIndex:[viewController arrangeBy]];
	} else if ([viewController isKindOfClass:NSClassFromString(@"TListViewController")]) {
		sortType = FPSortTypeList;
		reverseSort = ![viewController sortInIncreasingOrder];
		sortBy = [viewController sortColumn];
	} else {
		sortType = FPSortTypeIcon;
	}
	if (sortBy && [sortBy isEqualToString:@"size"]) { // sorting by size is inversed
		reverseSort = !reverseSort;
		calculateFolderSize = [viewController calculateAllSizes];
	}
	NSString *resourceValueKey = [sortByToResourceValueKeys objectForKey:sortBy];

	NSArray *selectedUrls = [self getUrls:[finder selection]];
	NSArray *containers = [[selectedUrls mapUsingSelector:@selector(URLByDeletingLastPathComponent)] uniq];
	NSMutableArray *candidateUrls = [NSMutableArray arrayWithCapacity:[selectedUrls count]];
	for (NSURL *container in containers) {
		FNReference *siblingItems = [[[finder items] byIndex:container] items];
		NSArray *siblingUrls = [self getUrls:siblingItems];

		switch (sortType) {
			case FPSortTypeColumn:
			case FPSortTypeList: {
				NSArray *siblingSizes = nil;
				if (calculateFolderSize) {
					siblingSizes = [[siblingItems physicalSize] getList];
				}

				NSArray *siblingAttributes = [siblingUrls mapUsingBlock:(id)^(NSURL *url, NSUInteger idx) {
					id attribute = nil;
					NSMutableArray *attributes = [NSMutableArray arrayWithCapacity:1];

					if (calculateFolderSize) {
						attribute = [siblingSizes objectAtIndex:idx];
					} else if ([sortBy isEqualToString:@"comments"]) {
						MDItemRef mdItem = MDItemCreate(NULL, (CFStringRef)[url path]);
						if (mdItem) {
							attribute = (NSString *)MDItemCopyAttribute(mdItem, kMDItemFinderComment);
							CFRelease(mdItem);
						}
					} else if ([resourceValueKey isEqualToString:NSURLLocalizedLabelKey]) {
						// strange bug with label for symbolic link — it can't have label, but it is blue
						NSNumber *isSymbolicLink;
						if ([url getResourceValue:&isSymbolicLink forKey:NSURLIsSymbolicLinkKey error:nil] && ![isSymbolicLink boolValue]) {
							[url getResourceValue:&attribute forKey:resourceValueKey error:nil];
						}
					} else if (resourceValueKey) {
						[url getResourceValue:&attribute forKey:resourceValueKey error:nil];
					}
					[attributes addObjectOrNull:attribute];

					if ([url getResourceValue:&attribute forKey:NSURLLocalizedNameKey error:nil]) {
						[attributes addObject:[attribute lowercaseString]];
					}

					return attributes;
				}];

				siblingUrls = [siblingUrls sortedArrayByOtherArray:siblingAttributes usingComparator:(NSComparator)^(NSArray *as1, NSArray *as2) {
					return [as1 compare:as2 usingComparator:compareFinderAttributes];
				}];

				if (reverseSort) {
					siblingUrls = [siblingUrls reverse];
				}

				break;
			}
			case FPSortTypeIcon: {
				NSArray *siblingPositions = [[[siblingItems position] getList] mapUsingSelector:@selector(reverse)];

				siblingUrls = [siblingUrls sortedArrayByOtherArray:siblingPositions usingComparator:(NSComparator)^(NSArray *p1, NSArray *p2) {
					return [p1 compare:p2];
				}];

				break;
			}
		}

		NSUInteger itemIndex = [siblingUrls indexOfObject:[siblingUrls firstObjectCommonWithArray:selectedUrls]];
		if (itemIndex != NSNotFound) {
			NSArray *before = [siblingUrls subarrayWithRange:NSMakeRange(0, itemIndex)];
			NSArray *after = [siblingUrls subarrayWithRange:NSMakeRange(itemIndex, [siblingUrls count] - itemIndex)];
			[candidateUrls addObjectsFromArray:after];
			[candidateUrls addObjectsFromArray:[before reverse]];
		}
	}
	[candidateUrls removeObjectsInArray:selectedUrls];

	block();

	if ([candidateUrls count] > 0) {
		int wait;
		for (wait = 100; wait > 0; wait--) {
			usleep(100000);

			if (nil == [selectedUrls firstObjectCommonWithArray:[self getUrls:[finder selection]]]) {
				break;
			}
		}
		if (wait > 0) {
			if (viewController == [self frontmostBrowserViewController]) {
				for (NSURL *candidateUrl in candidateUrls) {
					if ([candidateUrl checkResourceIsReachableAndReturnError:nil]) {
						NSURL *candidateParentUrl = [candidateUrl URLByDeletingLastPathComponent];

						switch (sortType) {
							case FPSortTypeColumn: {
								[[finder select:candidateUrl] send];
								break;
							}
							case FPSortTypeList: {
								[[[[finder FinderWindows] first] target] setItem:candidateParentUrl];
								[[finder select:candidateUrl] send];
								break;
							}
							case FPSortTypeIcon: {
								[[finder select:candidateUrl] send];
								break;
							}
						}

						break;
					}
				}
			}
		}
	}
}


@end
