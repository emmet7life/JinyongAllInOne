//
//  LWDataListRefreshHeaderView.m
//  LWDataListRefreshViewController
//
//  Created by 李巍 on 15/4/8.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "LWDataListRefreshHeaderView.h"

@interface LWDataListRefreshHeaderView ()

- (void)setState:(LWDataListPullRefreshState)aState;

@end

@implementation LWDataListRefreshHeaderView
{
	LWDataListPullRefreshState			_state;
	
	IBOutlet UILabel					*_lastUpdatedLabel;
	IBOutlet UILabel					*_statusLabel;
	IBOutlet LWActivityIndicatorView	*_activityView;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self setState:kDataListPullRefreshLoading];
	[super setNeedsDisplay];
}

- (void)showLoadingStatus {
	_activityView.progress = 1.0;
}

#pragma mark -
#pragma mark Setters

- (void)refreshLastUpdatedDate {
	if ([_delegate respondsToSelector:@selector(refreshTableHeaderDataSourceLastUpdated:)]) {
		NSDate *date = [_delegate refreshTableHeaderDataSourceLastUpdated:self];
		[NSDateFormatter setDefaultFormatterBehavior:NSDateFormatterBehaviorDefault];
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle:NSDateFormatterShortStyle];
		[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
		_lastUpdatedLabel.text = [NSString stringWithFormat:@"上次更新: %@", [dateFormatter stringFromDate:date]];
	} else {
		_lastUpdatedLabel.text = @"从未刷新";
	}
}

- (void)setState:(LWDataListPullRefreshState)aState{
	switch (aState) {
		case kDataListPullRefreshPulling:
			_statusLabel.text = NSLocalizedString(@"松开以刷新...", @"松开以刷新数据");
			
			break;
		case kDataListPullRefreshNormal:
			if (_state != kDataListPullRefreshPulling) {
				_activityView.progress = 0;
				[_activityView setNeedsDisplay];
			}
			_statusLabel.text = NSLocalizedString(@"下拉以刷新...", @"下拉以刷新");
			[self refreshLastUpdatedDate];
			break;
		case kDataListPullRefreshLoading: {
			_statusLabel.text = NSLocalizedString(@"加载中...", @"加载中");
			
			CABasicAnimation* rotate =  [CABasicAnimation animationWithKeyPath: @"transform.rotation.z"];
			rotate.removedOnCompletion = FALSE;
			rotate.fillMode = kCAFillModeForwards;
			[rotate setToValue: [NSNumber numberWithFloat: M_PI / 2]];
			rotate.repeatCount = 10000;
			rotate.duration = 0.25;
			rotate.cumulative = TRUE;
			rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
			[_activityView.layer addAnimation:rotate forKey:@"rotateAnimation"];
		}
			break;
		default:
			break;
	}
	_state = aState;
}


#pragma mark -
#pragma mark ScrollView Methods

- (void)refreshScrollViewDidScroll:(UIScrollView *)scrollView {
	if (_state == kDataListPullRefreshLoading) {
		CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
		offset = MIN(offset, 60);
		scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
	} else if (scrollView.isDragging) {
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(refreshTableHeaderDataSourceIsLoading:)]) {
			_loading = [_delegate refreshTableHeaderDataSourceIsLoading:self];
		}
		if (_state == kDataListPullRefreshPulling && scrollView.contentOffset.y > -65.0f && scrollView.contentOffset.y < 0.0f && !_loading) {
			[self setState:kDataListPullRefreshNormal];
		} else if (_state == kDataListPullRefreshNormal && scrollView.contentOffset.y < -0.0f && !_loading) {
			
			float moveY = fabs(scrollView.contentOffset.y);
			if (moveY > 65)
				moveY = 65;
			_activityView.progress = (moveY-15) / (65-15);
			[_activityView setNeedsDisplay];
			
			if (scrollView.contentOffset.y < -65.0f) {
				[self setState:kDataListPullRefreshPulling];
			}
		}
		if (scrollView.contentInset.top != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
	}
}

- (void)refreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(refreshTableHeaderDataSourceIsLoading:)]) {
		_loading = [_delegate refreshTableHeaderDataSourceIsLoading:self];
	}
	if (scrollView.contentOffset.y <= - 65.0f && !_loading) {
		if ([_delegate respondsToSelector:@selector(refreshTableHeaderDidTriggerRefresh:)]) {
			[_delegate refreshTableHeaderDidTriggerRefresh:self];
		}
		[self setState:kDataListPullRefreshLoading];
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		scrollView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
		[UIView commitAnimations];
	}
}

- (void)refreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
	
	[UIView animateWithDuration:.3f animations:^{
		scrollView.contentInset = UIEdgeInsetsZero;
	} completion:^(BOOL finished) {
		[self setState:kDataListPullRefreshNormal];
		NSLog(@" 2 edge top = %f", scrollView.contentInset.top);
		if (scrollView.contentInset.top != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
		[scrollView layoutIfNeeded];
		[_activityView.layer removeAllAnimations];
	}];
}

@end
