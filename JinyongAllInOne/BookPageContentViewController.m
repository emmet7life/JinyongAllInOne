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
	
//	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContent:)];
//	[self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	[self showPageContent];
}

- (void)showPageContent {
	// 设置内容
	[self.contentView.textStorage setAttributedString:[[BookContentDataSource sharedInstance] contentAtPageIndex:self.pageIndex withContainerSize:self.contentView.textContainer.size]];
	
//	self.contentView.text = @"http://www.baidu.com/";
//	NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."];
//	[text addAttribute:NSLinkAttributeName value:@"myurl://tapped" range:NSMakeRange(6, 16)];
	
//	[self.contentView.textStorage addAttribute:NSLinkAttributeName value:@"jinyongaio://show.remark" range:NSMakeRange(0, 20)];
	
//	self.contentView.attributedText = text;
}

- (void)tapContent:(UITapGestureRecognizer *)tap {
	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
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
