//
//  LWActivityIndicatorView.m
//  LWDataListRefreshViewController
//
//  Created by 李巍 on 15/4/8.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "LWActivityIndicatorView.h"

@implementation LWActivityIndicatorView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		self.backgroundColor = [UIColor clearColor];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	// Drawing code
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 2.0);
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	CGFloat startAngle = -M_PI/3;
	CGFloat step = 11*M_PI/6 * self.progress;
	CGContextAddArc(context, self.bounds.size.width/2, self.bounds.size.height/2, self.bounds.size.width/2-3, startAngle, startAngle+step, 0);
	CGContextStrokePath(context);
}

@end
