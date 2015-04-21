//
//  BookPageViewController.m
//  BookStore
//
//  Created by 李巍 on 15/1/21.
//  Copyright (c) 2015年 LW. All rights reserved.
//

#import "BookPageViewController.h"
#import "BookPageContentViewController.h"
#import "BookContentDataSource.h"

@interface BookPageViewController ()

@end

@implementation BookPageViewController

- (void)awakeFromNib {
    [super awakeFromNib];
	
	self.delegate = self;
	self.dataSource = self;
	//从第一页开始计算页码，但是封面是第0页
	self.currentPageIndex = 0;
	self.maxPageCount = [[BookContentDataSource sharedInstance] maxPageCount];
	
    // 设置书籍的第一页
    [self setViewControllers:@[[self.storyboard instantiateViewControllerWithIdentifier:@"BookPageContentViewController"]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
		
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

- (BookPageContentViewController *)bookContentControllerAtIndex:(NSUInteger)index {
	self.currentPageIndex = index;
	BookPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BookPageContentViewController"];
	pageContentViewController.pageIndex = index;
	return pageContentViewController;
}

#pragma mark - UIPageViewControllerDataSource

// 返回前一页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
	
	NSUInteger index = [self presentationIndexForPageViewController:pageViewController];
	if ((index == 0) || (index == NSNotFound)) {
		NSLog(@"已经是第一页");
		return nil;
	}
	index--;
	return [self bookContentControllerAtIndex:index];
}

// 翻到下一页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
	NSUInteger index = [self presentationIndexForPageViewController:pageViewController];
	if (index == [self presentationCountForPageViewController:pageViewController]) {
		NSLog(@"已经是最后一页");
		return nil;
	}
	index++;
	return [self bookContentControllerAtIndex:index];
}

// 总页数
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
	return self.maxPageCount;
}

// 当前页码
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
	return self.currentPageIndex;
}


#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {
//	_pageIsAnimating = NO;
	
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
	
	if (completed) {
		//翻页完成
		
		
	}else{ //翻页未完成 又回来了。
		//		if (_isTurnOver && !_isRight) {//往右翻 且正好跨章节
		//
		//			E_EveryChapter *chapter = [[E_ReaderDataSource shareInstance] nextChapter];
		//			[self parseChapter:chapter];
		//
		//		}else if(_isTurnOver && _isRight){//往左翻 且正好跨章节
		//
		//			E_EveryChapter *chapter = [[E_ReaderDataSource shareInstance] preChapter];
		//			[self parseChapter:chapter];
		//			
		//		}
	}
}

@end