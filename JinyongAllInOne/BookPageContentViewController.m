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
	[self showPageContent];
}

- (void)showPageContent {
	// 设置内容
//	self.contentView.layoutManager.hyphenationFactor = 1.0;
//	[BookContentDataSource sharedInstance].contentLayoutManager = self.contentView.layoutManager;
//	[BookContentDataSource sharedInstance].contentContainer = self.contentView.textContainer;
//	[self.contentView.textStorage setAttributedString:[[NSAttributedString alloc] initWithString:[[BookContentDataSource sharedInstance] contentAtPageIndex:self.pageIndex]]];
	
//	[self.contentView.textStorage setAttributedString:[BookContentDataSource sharedInstance].textStorage];
//	
//	[self.contentView.textStorage addAttributes:[[BookContentDataSource sharedInstance] contentAttributes] range:NSMakeRange(0, self.contentView.textStorage.string.length)];
	
	[self.contentView.layoutManager addTextContainer:[[BookContentDataSource sharedInstance].contentLayoutManager textContainers][self.pageIndex]];
	
//	NSRange range = [self.contentView.layoutManager glyphRangeForTextContainer:self.contentView.textContainer];
////	NSUInteger glyphs = [self.contentView.layoutManager numberOfGlyphs];
//	NSLog(@"range loc = %lu, length = %lu", (unsigned long)range.location, (unsigned long)range.length);
////	NSLog(@"glyphsss == %zd", glyphs);
//	
//	[self.contentView.layoutManager invalidateDisplayForGlyphRange:range];
//	[[BookContentDataSource sharedInstance] calculatePageRanges];
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
