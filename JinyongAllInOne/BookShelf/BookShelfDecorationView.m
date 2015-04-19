//
//  BookShelfDecorationView.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/4/17.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "BookShelfDecorationView.h"

@implementation BookShelfDecorationView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
//		[self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BookShelfCellLeft"]]];
//		self.layer.shadowOpacity = 0.5;
//		self.layer.shadowOffset = CGSizeMake(0,5);
        self.bgView.frame = frame;
//        self.
	}
	return self;
}

//- (void)setFrame:(CGRect)frame {
//	[super setFrame:frame];
//	self.bgView.frame = frame;
//}

- (UIImageView *)bgView {
	if (_bgView == nil) {
		_bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BookShelfCellBg"]];
		[self addSubview:_bgView];
	}
	return _bgView;
}

//- (void)layoutSubviews {
//	CGRect shadowBounds = CGRectMake(0, -5, self.bounds.size.width, self.bounds.size.height + 5);
//	self.layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowBounds].CGPath;
//	
//}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
}

@end
