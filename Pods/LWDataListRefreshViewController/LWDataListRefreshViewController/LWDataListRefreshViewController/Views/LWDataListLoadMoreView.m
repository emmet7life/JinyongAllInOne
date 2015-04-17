//
//  LWDataListLoadMoreView.m
//  LWDataListRefreshViewController
//
//  Created by 李巍 on 15/4/8.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "LWDataListLoadMoreView.h"

#define DEFAULT_FOOTER_WIDTH [[UIScreen mainScreen] applicationFrame].size.width
#define DEFAULT_FOOTER_HEIGHT 44

@interface LWDataListLoadMoreView ()

@property (strong, nonatomic) UIActivityIndicatorView *activity;
@property (strong, nonatomic) UIButton *prompt;

@end

#pragma mark -

@implementation LWDataListLoadMoreView
{
	LWDataListLoadMoreState _state;
}

- (instancetype)init {
	return [self initWithFrame:CGRectMake(0, 0, DEFAULT_FOOTER_WIDTH, DEFAULT_FOOTER_HEIGHT)];
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		indicator.frame = CGRectMake(100, 9.5, 25, 25);
		[self addSubview:indicator];
		self.activity = indicator;
		
		UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
		[actionBtn setTitle:@"加载下一页" forState:UIControlStateNormal];
		[actionBtn setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:actionBtn];
		self.prompt = actionBtn;
	}
	return self;
}

- (void)loadPageFinished {
	[self setState:kDataListLoadMoreNormal];
}

- (void)loadDataFinished {
	[self setState:kDataListLoadMoreFinished];
}

- (void)loadDataFailed {
	[self setState:kDataListLoadMoreError];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)setState:(LWDataListLoadMoreState)aState {
	
	switch (aState) {
		case kDataListLoadMoreNormal: {
			self.activity.hidden = YES;
			[self.prompt setTitle:@"加载下一页" forState:UIControlStateNormal];
			[self.activity stopAnimating];
		}
			break;
		case kDataListLoadMoreLoading: {
			[self.prompt setTitle:@"正在加载数据" forState:UIControlStateNormal];
			self.activity.hidden = NO;
			[self.activity startAnimating];
		}
			break;
		case kDataListLoadMoreFinished: {
			[self.activity stopAnimating];
			self.activity.hidden = YES;
			[self.prompt setTitle:@"已经是最后一页" forState:UIControlStateNormal];
		}
			break;
		case kDataListLoadMoreError: {
			self.activity.hidden = YES;
			[self.prompt setTitle:@"加载失败，请点击重试！" forState:UIControlStateNormal];
		}
			break;
		default:
			break;
	}
	_state = aState;
}

#pragma mark -
#pragma mark ScrollView Methods

- (void)loadMoreScrollViewDidScroll:(UIScrollView *)scrollView {
	if (scrollView.isDragging) {
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(loadMoreTableDataSourceIsLoading:)]) {
			_loading = [_delegate loadMoreTableDataSourceIsLoading:self];
		}
		if (_state == kDataListLoadMoreFinished) {
			return;
		}
		if (_state == kDataListLoadMoreNormal && scrollView.contentOffset.y > scrollView.contentSize.height - CGRectGetHeight(scrollView.frame) - CGRectGetHeight(self.frame) && !_loading) {
			if ([_delegate respondsToSelector:@selector(loadMoreTableDidTriggerRefresh:)]) {
				[_delegate loadMoreTableDidTriggerRefresh:self];
			}
			[self setState:kDataListLoadMoreLoading];
		}
	}
}

- (void)loadMoreScrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	
}

- (void)loadMoreScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
	if (_state == kDataListLoadMoreFinished) {
		return;
	}
	[self setState:kDataListLoadMoreNormal];
}

@end
