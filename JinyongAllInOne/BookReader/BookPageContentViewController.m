//
//  BookPageContentViewController.m
//  BookStore
//
//  Created by 李巍 on 15/2/5.
//  Copyright (c) 2015年 LW. All rights reserved.
//

#import "BookPageContentViewController.h"
#import "BookNavBarView.h"
#import "BookContentDataSource.h"

#import "MacroDefinition.h"

@interface BookPageContentViewController () <BookNavBarViewProtocol>

@property (strong, nonatomic) BookNavBarView *navView;

@end

@implementation BookPageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	BookNavBarView *nav = [[BookNavBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
	nav.delegate = self;
	[self.view addSubview:nav];
	self.navView = nav;
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContent:)];
	[self.view addGestureRecognizer:tapGesture];
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
	[UIView animateWithDuration:0.4 animations:^{
		CGRect frame = self.navView.frame;
		if (frame.size.height == 0) {
			frame.size.height = 64;
		}else {
			frame.size.height = 0;
		}
		self.navView.frame = frame;
	} completion:NULL];
}

- (void)backAction {
	[[BookContentDataSource sharedInstance] restore];
	[self dismissViewControllerAnimated:YES completion:NULL];
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
