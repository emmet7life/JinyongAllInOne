//
//  BookShelfCollectionViewLayout.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/4/17.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "BookShelfCollectionViewLayout.h"
#import "BookShelfViewLayoutAttributes.h"
#import "BookShelfDecorationView.h"

@implementation BookShelfCollectionViewLayout

+ (Class)layoutAttributesClass {
	return [BookShelfViewLayoutAttributes class];
}

- (void)prepareLayout {
	[super prepareLayout];
	[self registerClass:[BookShelfDecorationView class] forDecorationViewOfKind:@"BookShelfDecorationView"];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
	NSMutableArray *attributes = [NSMutableArray arrayWithArray:[super layoutAttributesForElementsInRect:rect]];
    NSLog(@"rect x = %f y = %f w = %f h = %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
	for (NSUInteger i = 0; i < [attributes count]; i++) {
		UICollectionViewLayoutAttributes *attribute = attributes[i];
//        NSLog(@"representedElementCategory === %lu", (unsigned long)attribute.representedElementCategory);
		if (attribute.representedElementKind == UICollectionElementCategoryCell && attribute.indexPath.item % 3 == 0) {
			// Create decoration attributes
//            NSLog(@"index path item = %zd", attribute.indexPath.item);
//            NSLog(@"representedElementKind = %@", attribute.representedElementKind);
//            NSLog(@"representedElementCategory === %lu", (unsigned long)attribute.representedElementCategory);
            UICollectionViewLayoutAttributes *decorationAttributes = [self layoutAttributesForDecorationViewOfKind:@"BookShelfDecorationView" atIndexPath:attribute.indexPath];

			// Make the decoration view span the entire row (you can do item by item as well.  I just
			// chose to do it this way)
			decorationAttributes.frame = CGRectMake(0, (i / 3) * CGRectGetHeight(attribute.frame) / 2, CGRectGetWidth([[UIScreen mainScreen] applicationFrame]), CGRectGetHeight(attribute.frame));

//			// Set the zIndex to be behind the item
//			decorationAttributes.zIndex = attribute.zIndex-1;
			
			// Add the attribute to the list
			[attributes addObject:decorationAttributes];
		}
	}
//    NSLog(@"layoutAttributesForElementsInRect attributes  count == %zd", [attributes count]);
	return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    
    return attributes;
}

//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
//    return NO;
//}

@end
