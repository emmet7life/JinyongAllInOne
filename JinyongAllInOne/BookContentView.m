//
//  BookContentView.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/9.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "BookContentView.h"

@interface BookContentView () <UITextViewDelegate>

@end

@implementation BookContentView

- (void)awakeFromNib {
	[super awakeFromNib];
	UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"添加备注" action:@selector(changeColor:)];
	[[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:menuItem]];
	// 边距
	self.textContainerInset = UIEdgeInsetsMake(40, 20, 20, 20);
	
	self.delegate = self;
	
	self.dataDetectorTypes = UIDataDetectorTypeAll;
	
	self.allowsEditingTextAttributes = YES;
	
	NSDictionary *attributes = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)};
	self.linkTextAttributes = attributes;
	
//	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textTapped:)];
//	[self addGestureRecognizer:tapGesture];
//	
//	
//	NSAttributedString* attributedString = [[NSAttributedString alloc] initWithString:@"a clickable word" attributes:@{ @"myCustomTag" : @(YES) }];
////	[self.textStorage appendAttributedString:attributedString];
//	[self.textStorage setAttributedString:attributedString];
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
//	UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"备注内容是12312312312" action:@selector(changeColor:)];
//	[[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:menuItem]];

	[self.textStorage beginEditing];
	[self.textStorage addAttribute:NSLinkAttributeName value:@"jinyongaio://show.remark" range:NSMakeRange(0, 20)];
	[self.textStorage fixAttributesInRange:self.selectedRange];
	[self.textStorage edited:NSTextStorageEditedAttributes range:self.selectedRange changeInLength:0];
	[self.textStorage endEditing];
	
	[[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
	
//	NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
//	
//	[att addAttribute:NSLinkAttributeName value:@"jinyongaio://show.remark" range:NSMakeRange(0, 20)];
//	
//	[self.textStorage setAttributedString:att];
}

- (void)textTapped:(UITapGestureRecognizer *)recognizer {
	UITextView *textView = (UITextView *)recognizer.view;
	// Location of the tap in text-container coordinates
	NSLayoutManager *layoutManager = textView.layoutManager;
	CGPoint location = [recognizer locationInView:textView];
	
//	return;
	
	location.x -= textView.textContainerInset.left;
	location.y -= textView.textContainerInset.top;
	// Find the character that's been tapped on
	NSUInteger characterIndex;
	characterIndex = [layoutManager characterIndexForPoint:location
										   inTextContainer:textView.textContainer
				  fractionOfDistanceBetweenInsertionPoints:NULL];
	
	if (characterIndex < textView.textStorage.length) {
		NSRange range;
		id value = [textView.attributedText attribute:@"myCustomTag" atIndex:characterIndex effectiveRange:&range];
		// Handle as required...
		NSLog(@"%@, %lu, %lu", value, (unsigned long)range.location, (unsigned long)range.length);
//		self.selectedRange = range;
	}
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//	if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
//		CGPoint location = [gestureRecognizer locationInView:self];
//		if (location.x > self.bounds.size.width - 20) {
//			return NO;
//		}
//	}
//	return YES;
//}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
	BOOL pointInside = NO;
	if (CGRectContainsPoint(CGRectMake(30, 0, self.bounds.size.width - 60, self.bounds.size.height), point)) {
		pointInside = YES;
	}
	
	return pointInside;
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
//	NSLog(@"textViewDidChangeSelection");
}

@end
