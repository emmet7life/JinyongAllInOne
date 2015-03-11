//
//  EBookStorage.h
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/11.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBookStorage : NSTextStorage

- (NSString *)string;
- (NSDictionary *)attributesAtIndex:(NSUInteger)location
					 effectiveRange:(NSRangePointer)range;
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str;
- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;

@end
