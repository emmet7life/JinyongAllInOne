//
//  LWDataListRefreshViewController.m
//  LWDataListRefreshViewController
//
//  Created by 李巍 on 15/4/8.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "LWDataListRefreshViewController.h"
#import "LWDataListRefreshHeaderView.h"
#import "LWDataListLoadMoreView.h"

#import "UIScrollView+EmptyDataSet.h"

@interface LWDataListRefreshViewController () <LWDataListRefreshTableHeaderDelegate, LWDataListLoadMoreDelegate, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

//@property (strong, nonatomic) LWDataListRefreshHeaderView *refreshHeaderView;
@property (assign, nonatomic) BOOL isLastPage;		   //当前页是否是最后一页
@property (assign, nonatomic) NSInteger dataPerCount;  //每页有多少条数据

@property (strong, nonatomic) LWDataListLoadMoreView *loadMoreView;

@end

@implementation LWDataListRefreshViewController
{
	NSInteger           numberOfPages;	//总页码
	BOOL                isLoading;		//是否正在加载
	
	LWDataListRefreshHeaderView *refreshHeaderView;
}

- (void)dealloc {
	self.tableView.emptyDataSetSource = nil;
	self.tableView.emptyDataSetDelegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	self.dataArray = [[NSMutableArray alloc] initWithCapacity:10];
	self.dataPerCount = DEFAULT_DATA_COUNT_PER_PAGE;
	_currentPageIndex = DEFAULT_FIRST_PAGE_INDEX;
	_isLastPage = NO;
	
	// dzemptydata setup
	self.tableView.emptyDataSetSource = self;
	self.tableView.emptyDataSetDelegate = self;
	
	// A little trick for removing the cell separators
	self.tableView.tableFooterView = [UIView new];
	
	if (!self.shieldRefreshModule) {
		//初始化refresh header view
		LWDataListRefreshHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"LWDataListRefreshHeaderView" owner:nil options:nil] lastObject];
		headerView.delegate = self;
		
		[self.tableView addSubview:headerView];
		refreshHeaderView = headerView;
		
		headerView.backgroundColor = [UIColor greenColor];
		
	}
	
	if (self.autoRefreshFirstPage) {
		[self loadDataWithPageIndex:_currentPageIndex];
		[self.tableView setContentOffset:CGPointMake(0, DRAGGING_OFFSET_Y) animated:YES];
		if (!self.shieldRefreshModule) {
			[refreshHeaderView showLoadingStatus];
		}
	}
	if (self.needLoadMoreModule) {
		LWDataListLoadMoreView *loadMoreView = [[LWDataListLoadMoreView alloc] init];
		loadMoreView.delegate = self;
		_loadMoreView = loadMoreView;
		self.tableView.tableFooterView = _loadMoreView;
		_loadMoreView.hidden = YES;
	}
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
	NSArray *constraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[refreshHeaderView(==width)]|" options:0 metrics:@{@"width":@(CGRectGetWidth(self.tableView.frame))} views:NSDictionaryOfVariableBindings(refreshHeaderView)];
	NSArray *constraintsV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[refreshHeaderView(==height)]|" options:0 metrics:@{@"height":@(CGRectGetHeight(self.tableView.frame))} views:NSDictionaryOfVariableBindings(refreshHeaderView)];
	[self.tableView addConstraints:constraintsH];
	[self.tableView addConstraints:constraintsV];
	refreshHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)reloadData {
	_currentPageIndex = DEFAULT_FIRST_PAGE_INDEX;
	self.isLastPage = NO;
	[self loadDataWithPageIndex:_currentPageIndex];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)setIsLastPage:(BOOL)isLastPage {
	_isLastPage = isLastPage;
	if (isLastPage && [self shouldShowLoadMoreView]) {
		[_loadMoreView loadDataFinished];
	}else {
		[_loadMoreView loadPageFinished];
	}
}

- (void)loadDataWithPageIndex:(NSInteger)pageIndex {}

- (void)applyDataWithDataArray:(NSArray *)array withAllDataCount:(NSInteger)allDataCount dataPerCount:(NSInteger)dataPerCount {
	
	[self loadDataFinished];
	
	if ([array count] == 0) {
		self.isLastPage = YES;
		[self.tableView reloadData];
		return;
	}
	if (_currentPageIndex == DEFAULT_FIRST_PAGE_INDEX) {
		[self.dataArray removeAllObjects];
	}
	[self.dataArray addObjectsFromArray:array];
	self.dataPerCount = dataPerCount;
	[self.tableView reloadData];
	
	if (self.dataPerCount > 0) {
		if (dataPerCount < self.dataPerCount) {
			self.isLastPage = YES;
		}else {
			NSInteger maxPage = (allDataCount % self.dataPerCount) == 0 ? (allDataCount / self.dataPerCount) : (allDataCount / self.dataPerCount) + 1;
			if (_currentPageIndex < maxPage) {
				self.isLastPage = NO;
			}else {
				self.isLastPage = YES;
			}
		}
	}

	_loadMoreView.hidden = ![self shouldShowLoadMoreView];
}

- (void)loadDataFinished {
	dispatch_async(dispatch_get_main_queue(), ^{
		[self doneLoadingTableViewData];
	});
}

- (void)requestDataFailed {
	[self loadDataFinished];
	if ([self shouldShowLoadMoreView]) {
		[_loadMoreView loadDataFailed];
	}
}

- (BOOL)shouldShowLoadMoreView {
	if (self.tableView.contentSize.height > self.tableView.frame.size.height && self.needLoadMoreModule) {
		return YES;
	}
	return NO;
}

#pragma mark - UITableViewDelegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.dataArray count];
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	if (refreshHeaderView) {
		[refreshHeaderView refreshScrollViewDidScroll:scrollView];
	}
	
	if ([self shouldShowLoadMoreView]) {
		[_loadMoreView loadMoreScrollViewDidScroll:scrollView];
	}
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	if (refreshHeaderView) {
		[refreshHeaderView refreshScrollViewDidEndDragging:scrollView];
	}
}

- (void)doneLoadingTableViewData {
	isLoading = NO;
	if (_currentPageIndex == DEFAULT_FIRST_PAGE_INDEX) {
		if (refreshHeaderView) {
			dispatch_async(dispatch_get_main_queue(), ^{
				[refreshHeaderView refreshScrollViewDataSourceDidFinishedLoading:self.tableView];
			});
		}
	}else if ([self shouldShowLoadMoreView]) {
		[_loadMoreView loadMoreScrollViewDataSourceDidFinishedLoading:self.tableView];
	}
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)refreshTableHeaderDidTriggerRefresh:(LWDataListRefreshHeaderView *)view{
	isLoading = YES;
	_currentPageIndex = DEFAULT_FIRST_PAGE_INDEX;
	[self loadDataWithPageIndex:_currentPageIndex];
}

- (BOOL)refreshTableHeaderDataSourceIsLoading:(LWDataListRefreshHeaderView*)view{
	return isLoading; // should return if data source model is reloading
}

- (NSDate*)refreshTableHeaderDataSourceLastUpdated:(LWDataListRefreshHeaderView*)view{
	return [NSDate date]; // should return date data source was last changed
}

#pragma mark -
#pragma mark LoadMoreFooterView

- (void)loadMoreTableDidTriggerRefresh:(LWDataListLoadMoreView *)view {
	if (self.isLastPage) {
		return;
	}
	isLoading = YES;
	_currentPageIndex += 1;
	[self loadDataWithPageIndex:_currentPageIndex];
}

- (BOOL)loadMoreTableDataSourceIsLoading:(LWDataListLoadMoreView *)view {
	return isLoading;
}

#pragma mark -
#pragma mark - DZNEmptyDataSetSource Methods
#pragma mark -

//- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
//	
//	NSString *text = @"暂无数据";
//	
//	NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0],
//								 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
//	
//	return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}
//
//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
//	
//	NSString *text = @"暂无活动数据，您可以点击右上角发布按钮发布最新的活动！";
//	
//	NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
//	paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//	paragraph.alignment = NSTextAlignmentCenter;
//	
//	NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0],
//								 NSForegroundColorAttributeName: [UIColor lightGrayColor],
//								 NSParagraphStyleAttributeName: paragraph};
//	
//	return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}

//- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//	
//	NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0]};
//	
//	return [[NSAttributedString alloc] initWithString:@"发布活动" attributes:attributes];
//}

//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
//	
//	return [UIImage imageNamed:@"empty_placeholder"];
//}

//- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
//	
//	return [UIColor whiteColor];
//}
//
//- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
//	
//	UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//	[activityView startAnimating];
//	return activityView;
//}

//- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView {
//	
//	return CGPointMake(0, -self.tableView.tableHeaderView.frame.size.height/2);
//}
//
//#pragma mark - DZNEmptyDataSetDelegate Methods
//
//- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
//	
//	return YES;
//}
//
//- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
//	
//	return YES;
//}
//
//- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
//	
//	return YES;
//}
//
//- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
//	
//}
//
//- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
//	
//}

@end
