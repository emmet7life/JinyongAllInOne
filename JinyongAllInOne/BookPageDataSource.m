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

//返回前一页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSLog(@"返回前一页");
//    NSLog(@"page view cs = %@", pageViewController.viewControllers);
//    NSUInteger index = [pageViewController.dataSource presentationIndexForPageViewController:pageViewController];
//    if ((index == 0) || (index == NSNotFound)) {
//        return nil;
//    }
//    index--;
//    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
//    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法，自动来维护次序。
//    // 不用我们去操心每个ViewController的顺序问题。
//    return pageViewController.viewControllers[index];
    return [self viewControllerAtIndex:0];
}

//翻到下一页
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    NSUInteger index = [pageViewController.dataSource presentationIndexForPageViewController:pageViewController];
//    if (index == NSNotFound) {
//        return nil;
//    }
//    index++;
//    if (index == [pageViewController.viewControllers count]) {
//        return nil;
//    }
//    return pageViewController.viewControllers[index];
    NSLog(@"翻到下一页");
    return [self viewControllerAtIndex:0];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.maxPageCount;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return self.currentPageIndex;
}

#pragma mark -

- (BookPageContentViewController *)viewControllerAtIndex:(NSUInteger)index {

    // Create a new view controller and pass suitable data.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BookPageContentViewController *pageContentViewController = [storyboard instantiateViewControllerWithIdentifier:@"BookPageContentViewController"];
    pageContentViewController.contentView.text = @"page 5";
    
    return pageContentViewController;
}

@end
