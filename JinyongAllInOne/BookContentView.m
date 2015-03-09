//
//  BookContentView.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/9.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "BookContentView.h"

@interface BookContentView ()

@end

@implementation BookContentView

- (void)awakeFromNib {
	[super awakeFromNib];
	UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"Change Color" action:@selector(changeColor:)];
	[[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:menuItem]];
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
	if (action == @selector(changeColor:)) {
		if (self.selectedRange.length > 0) {
			return YES;
		}
	}
	return NO;
}

- (void)changeColor:(id)sender {
	NSLog(@"change color ");
}

@end
