//
//  BookPageDelegate.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/9.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "BookPageDelegate.h"

@implementation BookPageDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {
	_pageIsAnimating = NO;
	
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
