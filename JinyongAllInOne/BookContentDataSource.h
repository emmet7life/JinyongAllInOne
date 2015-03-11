//
//  BookContentDataSource.h
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/11.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookContentDataSource : NSObject

@property (strong, nonatomic) NSLayoutManager *contentLayoutManager;

@property (assign, nonatomic) NSTextContainer *contentContainer;

@property (strong, nonatomic) NSTextStorage *textStorage;

+ (instancetype)sharedInstance;

- (NSString *)contentAtPageIndex:(NSInteger)index;

- (NSDictionary *)contentAttributes;

- (void)calculatePageRanges;

@end
