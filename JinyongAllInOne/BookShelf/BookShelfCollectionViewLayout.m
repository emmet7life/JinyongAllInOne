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

@interface BookShelfCollectionViewLayout ()

@property (nonatomic, strong) NSDictionary *shelfRects;

@end

@implementation BookShelfCollectionViewLayout

+ (Class)layoutAttributesClass {
	return [BookShelfViewLayoutAttributes class];
}

- (void)awakeFromNib {
	[super awakeFromNib];
//	self.scrollDirection = UICollectionViewScrollDirectionVertical;
//	self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//	
//	
//	CGFloat width = CGRectGetWidth([[UIScreen mainScreen] applicationFrame]);
//	self.itemSize = CGSizeMake(ceil((width - 50 ) / 3), ceil((width - 50 ) / 3));
////	self.headerReferenceSize = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad? (CGSize){50, 50} : (CGSize){43, 43}; // 100
////	self.footerReferenceSize = (CGSize){44, 44}; // 88
//	self.minimumInteritemSpacing = 10; // 40;
//	self.minimumLineSpacing = 10;//40;
	[self registerClass:[BookShelfDecorationView class] forDecorationViewOfKind:@"BookShelfDecorationView"];
}

- (void)prepareLayout {
	[super prepareLayout];
	
//	NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
//	// Calculate where shelves go in a vertical layout
//	
////	CGFloat availableWidth = self.collectionViewContentSize.width - (self.sectionInset.left + self.sectionInset.right);
////	NSInteger itemsAcross = floorf((availableWidth + self.minimumInteritemSpacing) / (self.itemSize.width + self.minimumInteritemSpacing));
//	
//	CGFloat height = self.itemSize.height + 20;
//	NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
//	NSInteger rowsCount = itemCount % 3 == 0 ? itemCount / 3 : itemCount / 3 + 1;
//	for (int row = 0; row < rowsCount; row++) {
//		dictionary[[NSIndexPath indexPathForItem:row inSection:0]] = [NSValue valueWithCGRect:CGRectMake(0, height * row, self.collectionViewContentSize.width, height)];
//
//		CGRect rect = CGRectMake(0, height * row, self.collectionViewContentSize.width, height);
//		NSLog(@"row = %zd, rect x = %f y = %f w = %f h = %f", row, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//	}
//	self.shelfRects = [NSDictionary dictionaryWithDictionary:dictionary];
//	NSLog(@"shellllfffff rectttttt ==== %@", self.shelfRects);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
	NSMutableArray *attributes = [NSMutableArray arrayWithArray:[super layoutAttributesForElementsInRect:rect]];
//    NSLog(@"rect x = %f y = %f w = %f h = %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
//	for (NSUInteger i = 0; i < [attributes count]; i++) {
//		UICollectionViewLayoutAttributes *attribute = attributes[i];
//		if (attribute.representedElementKind == UICollectionElementCategoryCell && attribute.indexPath.item % 3 == 0) { //[attribute isKindOfClass:[BookShelfViewLayoutAttributes class]]
//			// Create decoration attributes
//            BookShelfViewLayoutAttributes *decorationAttributes = (BookShelfViewLayoutAttributes *)[self layoutAttributesForDecorationViewOfKind:@"BookShelfDecorationView" atIndexPath:attribute.indexPath];
//
//			// Make the decoration view span the entire row (you can do item by item as well.  I just
//			// chose to do it this way)
//			decorationAttributes.frame = CGRectMake(0, (i / 3) * CGRectGetHeight(attribute.frame) / 2, CGRectGetWidth([[UIScreen mainScreen] applicationFrame]), CGRectGetHeight(attribute.frame));
//
//			// Set the zIndex to be behind the item
//			decorationAttributes.zIndex = attribute.zIndex-1;
//			
//			// Add the attribute to the list
//			[attributes addObject:decorationAttributes];
//		}
//	}

	// Add our decoration views (shelves)
	NSMutableArray *newArray = [attributes mutableCopy];
	[self.shelfRects enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		if (CGRectIntersectsRect([obj CGRectValue], rect))
		{
			UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"BookShelfDecorationView" withIndexPath:key];
			attributes.frame = [obj CGRectValue];
			attributes.zIndex = -1;
			//attributes.alpha = 0.5; // screenshots
			[newArray addObject:attributes];
		}
	}];
	
	[attributes addObjectsFromArray:newArray];
	
	
	return attributes;
}

- (BookShelfViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    BookShelfViewLayoutAttributes *attributes = [BookShelfViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    
    return attributes;
}

//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
//    return NO;
//}

@end
