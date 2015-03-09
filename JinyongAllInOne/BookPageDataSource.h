//
//  BookPageDataSource.h
//  BookStore
//
//  Created by 李巍 on 15/2/5.
//  Copyright (c) 2015年 LW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BookPageDataSource : NSObject <UIPageViewControllerDataSource>

@property (assign, nonatomic) NSInteger maxPageCount;

@property (assign, nonatomic) NSInteger currentPageIndex;

@end
