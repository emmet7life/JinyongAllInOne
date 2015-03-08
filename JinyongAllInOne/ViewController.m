//
//  ViewController.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/5.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "ViewController.h"
#import "BookPageViewController.h"
#import "BookPageContentViewController.h"

@interface ViewController ()

@property (strong, nonatomic) BookPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pageViewController = [self.childViewControllers firstObject];
    
    // 设置书籍的第一页内容
    for (NSInteger index = 0; index < [self.pageViewController.viewControllers count]; index++) {
        BookPageContentViewController *content = self.pageViewController.viewControllers[index];
        content.contentView.text = [NSString stringWithFormat:@"第%zd页", index + 1];
    }
    
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
