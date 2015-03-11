//
//  EBookStorage.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/11.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "EBookStorage.h"

@implementation EBookStorage
{
	NSMutableAttributedString *_imp;
}

- (id)init
{
	self = [super init];
	if (self) {
		_imp = [NSMutableAttributedString new];
	}
	return self;
}

- (NSString *)string
{
	return _imp.string;
}

- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
	return [_imp attributesAtIndex:location effectiveRange:range];
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
	[_imp replaceCharactersInRange:range withString:str];
	[self edited:NSTextStorageEditedCharacters range:range
  changeInLength:(NSInteger)str.length - (NSInteger)range.length];
}

- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range
{
	[_imp setAttributes:attrs range:range];
	[self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
}
@end
