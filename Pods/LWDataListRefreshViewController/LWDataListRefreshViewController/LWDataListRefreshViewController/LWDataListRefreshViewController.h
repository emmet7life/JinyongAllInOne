//
//  LWDataListRefreshViewController.h
//  LWDataListRefreshViewController
//
//  Created by 李巍 on 15/4/8.
//  Copyright (c) 2015年 李巍. All rights reserved.
//


/*
 使用方法：
 1、继承LWDataListViewController
 2、在自己的storyboard中设置tableview的delegate和datasource指向自己，并将自身继承自父类的tableview变量指向tableview
 2、请求数据使用的虚方法为 loadDataWithPageIndex:(NSInteger)pageIndex ，子类中需要对这个方法进行重写，更改为自身需要的请求数据的方法，请求数据完成后使用 [applyDataWithDataArray:withAllDataCount:dataPerCount:] 方法设置数据，若请求失败则调用失败方法[requestDataFailed]
 3、所有数组数据存在 dataArray 属性中，如需额外字段需要在网络请求回调中自己设置,默认已经写好了返回1个section，dataArray.count个row，如果需要更改，重写tableview的相关方法即可
 */
#import <UIKit/UIKit.h>

#define DEFAULT_FIRST_PAGE_INDEX 1
#define DEFAULT_DATA_COUNT_PER_PAGE 20
#define FOOTERVIEWHEIGHT 44.0

#define DRAGGING_OFFSET_Y -65



@interface LWDataListRefreshViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (assign, nonatomic) NSInteger currentPageIndex;				//当前页码

/*!
 *  @author Megatron, 2015-01-16
 *
 *  @brief  是否自动加载第一页数据
 */
@property (assign, nonatomic) BOOL autoRefreshFirstPage;

/*!
 *  @author Megatron, 2015-01-22
 *
 *  @brief  是否屏蔽下拉刷新功能模块
 */
@property (assign, nonatomic) BOOL shieldRefreshModule;

/*!
 *  @author Megatron, 2015-01-16
 *
 *  @brief  是否需要加载更多功能模块
 */
@property (assign, nonatomic) BOOL needLoadMoreModule;

/*!
 *  @author Megatron, 2015-01-16
 *
 *  @brief  将服务器数据加载到数据列表中
 *
 *  @param array        当前页数据，指从服务器请求下来的新数据，如果是第一页会将当前数据清空，载入第一页数据，如果不是第一页					   则将请求下来的数据附加到数据数组后面
 *  @param allDataCount 服务器所有数据总数
 *  @param dataPerCount 每页数据个数
 */
- (void)applyDataWithDataArray:(NSArray *)array withAllDataCount:(NSInteger)allDataCount dataPerCount:(NSInteger)dataPerCount;

/*!
 *  @author Megatron, 2015-01-16
 *
 *  @brief  请求数据失败方法
 */
- (void)requestDataFailed;

/*!
 *  @author Megatron, 2015-01-16
 *
 *  @brief  没有下拉刷新模块时调用的重新初始化刷新方法
 */
- (void)reloadData;

#pragma mark - Override Methods

/*!
 *  @brief  需要重写的方法,请求第pageIndex页接口数据
 *
 *  @param pageIndex 页码
 */
- (void)loadDataWithPageIndex:(NSInteger)pageIndex;

@end
