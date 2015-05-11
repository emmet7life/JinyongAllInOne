//
//  EBookModel.h
//  JinyongAllInOne
//
//  Created by 李巍 on 15/5/11.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "MTLModel.h"
#import "EBook.h"

@interface EBookModel : MTLModel

/*!
 *  @author Megatron, 2015-05-11
 *
 *  @brief  书籍ID
 */
@property (nonatomic, strong) NSString * identifier;
/*!
 *  @author Megatron, 2015-05-11
 *
 *  @brief  书名
 */
@property (nonatomic, strong) NSString * title;
/*!
 *  @author Megatron, 2015-05-11
 *
 *  @brief  用户当前阅读页数
 */
@property (nonatomic) NSUInteger currentPage;
/*!
 *  @author Megatron, 2015-05-11
 *
 *  @brief  书籍总页数
 */
@property (nonatomic) NSUInteger maxPageCount;
/*!
 *  @author Megatron, 2015-05-11
 *
 *  @brief  作者
 */
@property (nonatomic, strong) NSString * author;
/*!
 *  @author Megatron, 2015-05-11
 *
 *  @brief  书籍类型
 */
@property (nonatomic) BookType type;

@end
