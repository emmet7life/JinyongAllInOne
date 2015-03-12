//
//  BookPageContentViewController.m
//  BookStore
//
//  Created by 李巍 on 15/2/5.
//  Copyright (c) 2015年 LW. All rights reserved.
//

#import "BookPageContentViewController.h"

#import "BookContentDataSource.h"

@interface BookPageContentViewController ()

@end

@implementation BookPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	[self showPageContent];
}

- (void)showPageContent {
	// 设置内容
	self.contentView.layoutManager.hyphenationFactor = 1.0;
//	[BookContentDataSource sharedInstance].contentContainer = self.contentView.textContainer;
	
	[self.contentView.textStorage setAttributedString:[[BookContentDataSource sharedInstance] contentAtPageIndex:self.pageIndex withContainerSize:self.contentView.textContainer.size]];
	[self.contentView.textStorage addAttributes:[[BookContentDataSource sharedInstance] contentAttributes] range:NSMakeRange(0, self.contentView.textStorage.string.length)];
	
//	NSLog(@"text view storage === %@", self.contentView.textStorage);

//	NSRange tmpRange = [self.contentView.layoutManager glyphRangeForTextContainer:self.contentView.textContainer];
//	
//	NSLog(@"tmpRange loc = %lu tmpRange length = %lu", (unsigned long)tmpRange.location, (unsigned long)tmpRange.length);
//	NSLog(@"text === %@", [string substringWithRange:tmpRange]);
//	
//	NSLog(@"self.contentView.contentSize.height = %f", self.contentView.contentSize.height);
//	NSLog(@"frame size height = %f", self.contentView.bounds.size.height);
//	NSLog(@"container size height = %f", self.contentView.textContainer.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
