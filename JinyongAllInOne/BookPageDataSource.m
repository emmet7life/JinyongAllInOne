//
//  BookPageDataSource.m
//  BookStore
//
//  Created by 李巍 on 15/2/5.
//  Copyright (c) 2015年 LW. All rights reserved.
//

#import "BookPageDataSource.h"
#import "BookPageContentViewController.h"

@implementation BookPageDataSource

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

#pragma mark -

- (BookPageContentViewController *)bookContentControllerAtIndex:(NSUInteger)index {
	self.currentPageIndex = index;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BookPageContentViewController *pageContentViewController = [storyboard instantiateViewControllerWithIdentifier:@"BookPageContentViewController"];
	pageContentViewController.pageIndex = index;
    return pageContentViewController;
}

@end
