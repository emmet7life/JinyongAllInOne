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
	[self registerClass:[BookShelfDecorationView class] forDecorationViewOfKind:[BookShelfDecorationView reuseIdentifier]];
	
	
	
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
	NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
	NSMutableArray *allAttributes = [NSMutableArray arrayWithArray:attributes];
	
	for (NSUInteger i = 0; i < [attributes count]; i++) {
		UICollectionViewLayoutAttributes *attribute = attributes[i];
		if (attribute.representedElementKind == UICollectionElementCategoryCell && attribute.frame.origin.x == self.sectionInset.left) {
			// Create decoration attributes
			UICollectionViewLayoutAttributes *decorationAttributes =
			[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:[BookShelfDecorationView reuseIdentifier] withIndexPath:attribute.indexPath];
			//			BookShelfViewLayoutAttributes *decorationAttributes =
			//			(BookShelfViewLayoutAttributes *)[self layoutAttributesForDecorationViewOfKind:[BookShelfDecorationView reuseIdentifier] atIndexPath:attribute.indexPath];
			
			// Make the decoration view span the entire row (you can do item by item as well.  I just
			// chose to do it this way)
//			NSLog(@"iiiii = %zd", i / 3);
			decorationAttributes.frame = CGRectMake(0, (i / 3) * CGRectGetHeight(attribute.frame) / 2, CGRectGetWidth([[UIScreen mainScreen] applicationFrame]), CGRectGetHeight(attribute.frame));
			
//			decorationAttributes.frame = CGRectMake(0, attribute.frame.origin.y - (self.sectionInset.top),
//													self.collectionViewContentSize.width,
//													CGRectGetHeight(attribute.frame)+(self.sectionInset.top+self.sectionInset.bottom));
			
			
//			id<UIPickerViewDataSource> dataSource = self.collectionView.dataSource;
//			id event = [dataSource eventAtIndexPath:indexPath];
//			UICollectionViewLayoutAttributes *attributes =
//			[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//			attributes.frame = [self frameForEvent:event];
			
			
			//			decorationAttributes.backgroundImageView.frame = attribute.bounds;
			
			// Set the zIndex to be behind the item
			decorationAttributes.zIndex = attribute.zIndex-1;
			
			// Add the attribute to the list
			[allAttributes addObject:decorationAttributes];
		}
	}
	
//	for (UICollectionViewLayoutAttributes *attribute in attributes) {
//		// Look for the first item in a row && attribute.frame.origin.x == self.sectionInset.left
//		if (attribute.representedElementKind == UICollectionElementCategoryCell
//			  && attribute.frame.origin.x == self.sectionInset.left) {
//			// Create decoration attributes
//			BookShelfViewLayoutAttributes *decorationAttributes =
//			[BookShelfViewLayoutAttributes layoutAttributesForDecorationViewOfKind:[BookShelfDecorationView reuseIdentifier] withIndexPath:attribute.indexPath];
////			BookShelfViewLayoutAttributes *decorationAttributes =
////			(BookShelfViewLayoutAttributes *)[self layoutAttributesForDecorationViewOfKind:[BookShelfDecorationView reuseIdentifier] atIndexPath:attribute.indexPath];
//			
//			// Make the decoration view span the entire row (you can do item by item as well.  I just
//			// chose to do it this way)
////			decorationAttributes.frame = CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] applicationFrame]), CGRectGetHeight(attribute.frame));
//			decorationAttributes.frame = CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] applicationFrame]), CGRectGetHeight(attribute.frame));
//			
////			decorationAttributes.backgroundImageView.frame = attribute.bounds;
//			
//
//			// Set the zIndex to be behind the item
//			decorationAttributes.zIndex = attribute.zIndex-1;
//			
//			// Add the attribute to the list
//			[allAttributes addObject:decorationAttributes];
//		}
//	}
	return allAttributes;
}


@end
