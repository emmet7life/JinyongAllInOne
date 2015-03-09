//
//  BookPageViewController.m
//  BookStore
//
//  Created by 李巍 on 15/1/21.
//  Copyright (c) 2015年 LW. All rights reserved.
//

#import "BookPageViewController.h"
#import "BookPageContentViewController.h"
#import "BookPageDataSource.h"

@interface BookPageViewController ()

@end

@implementation BookPageViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 设置书籍的第一页
	__weak typeof(self) weakSelf = self;
    [self setViewControllers:@[[self.storyboard instantiateViewControllerWithIdentifier:@"BookPageContentViewController"]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
		if (weakSelf.dataSource) {
			BookPageDataSource *dataSource = weakSelf.dataSource;
			//从第一页开始计算页码，但是封面是第0页
			dataSource.currentPageIndex = 0;
			dataSource.maxPageCount = 10;
		}
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
