//
//  LWDataListRefreshHeaderView.h
//  LWDataListRefreshViewController
//
//  Created by 李巍 on 15/4/8.
//  Copyright (c) 2015年 李巍. All rights reserved.d
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LWActivityIndicatorView.h"

#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f

typedef enum {
	kDataListPullRefreshPulling = 0,
	kDataListPullRefreshNormal,
	kDataListPullRefreshLoading,
} LWDataListPullRefreshState;

@protocol LWDataListRefreshTableHeaderDelegate;

@interface LWDataListRefreshHeaderView : UIView

@property (nonatomic, assign) id <LWDataListRefreshTableHeaderDelegate> delegate;


- (void)refreshLastUpdatedDate;
- (void)refreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)refreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)refreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

- (void)showLoadingStatus;

@end


@protocol LWDataListRefreshTableHeaderDelegate <NSObject>

- (void)refreshTableHeaderDidTriggerRefresh:(LWDataListRefreshHeaderView *)view;
- (BOOL)refreshTableHeaderDataSourceIsLoading:(LWDataListRefreshHeaderView *)view;
@optional
- (NSDate *)refreshTableHeaderDataSourceLastUpdated:(LWDataListRefreshHeaderView *)view;

@end