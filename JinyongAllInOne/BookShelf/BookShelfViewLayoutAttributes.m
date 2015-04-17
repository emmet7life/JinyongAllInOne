//
//  BookShelfViewLayoutAttributes.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/4/17.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "BookShelfViewLayoutAttributes.h"

@implementation BookShelfViewLayoutAttributes

//+ (instancetype)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath {
//	BookShelfViewLayoutAttributes *layoutAttributes = [super layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
//
//	NSString *imgName = @"";
//	switch (indexPath.item % 3) {
//		case 0:
//			imgName = @"BookShelfCellLeft";
//			break;
//		case 1:
//			imgName = @"BookShelfCellMiddle";
//			break;
//		case 2:
//			imgName = @"BookShelfCellRight";
//			break;
//		default:
//			break;
//	}
////	[layoutAttributes.backgroundImageView setImage:[UIImage imageNamed:imgName]];
//	layoutAttributes.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
//	return layoutAttributes;
//}

//+ (instancetype)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath {
//	BookShelfViewLayoutAttributes *layoutAttributes = [super layoutAttributesForCellWithIndexPath:indexPath];
//	NSString *imgName = @"";
//	switch (indexPath.item % 3) {
//		case 0:
//			imgName = @"BookShelfCellLeft";
//			break;
//		case 1:
//			imgName = @"BookShelfCellMiddle";
//			break;
//		case 2:
//			imgName = @"BookShelfCellRight";
//			break;
//		default:
//			break;
//	}
//	layoutAttributes.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
//	return layoutAttributes;
//}

//+ (instancetype)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind withIndexPath:(NSIndexPath *)indexPath {
//	BookShelfViewLayoutAttributes *layoutAttributes = [super layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
//	
//	NSString *imgName = @"";
//	switch (indexPath.item % 3) {
//		case 0:
//			imgName = @"BookShelfCellLeft";
//			break;
//		case 1:
//			imgName = @"BookShelfCellMiddle";
//			break;
//		case 2:
//			imgName = @"BookShelfCellRight";
//			break;
//		default:
//			break;
//	}
//	//	[layoutAttributes.backgroundImageView setImage:[UIImage imageNamed:imgName]];
//	layoutAttributes.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
//	return layoutAttributes;
//}

@end
