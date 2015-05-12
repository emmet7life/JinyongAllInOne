//
//  LWDataListLoadMoreView.h
//  LWDataListRefreshViewController
//
//  Created by 李巍 on 15/4/8.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	kDataListLoadMoreNormal = 0,			//正常状态，有下一页数据
	kDataListLoadMoreLoading,				//正在加载中状态
	kDataListLoadMoreFinished,				//加载完成，并且无下一页状态
	kDataListLoadMoreError,				//加载失败,点击刷新
} LWDataListLoadMoreState;

@protocol LWDataListLoadMoreDelegate;



@interface LWDataListLoadMoreView : UIView

@property (assign, nonatomic) id<LWDataListLoadMoreDelegate> delegate;

- (void)loadMoreScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)loadMoreScrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)loadMoreScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

- (void)loadPageFinished;
- (void)loadDataFinished;
- (void)loadDataFailed;

@end


@protocol LWDataListLoadMoreDelegate <NSObject>

- (void)loadMoreTableDidTriggerRefresh:(LWDataListLoadMoreView *)view;
- (BOOL)loadMoreTableDataSourceIsLoading:(LWDataListLoadMoreView *)view;

@end