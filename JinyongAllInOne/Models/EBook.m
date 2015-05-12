//
//  EBook.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/5/11.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "EBook.h"


@implementation EBook

@dynamic identifier;
@dynamic title;
@dynamic currentPage;
@dynamic maxPageCount;
@dynamic author;
@dynamic type;

+ (NSString *)entityName {
	return NSStringFromClass([self class]);
}

- (void)updateWithModel:(EBook *)model {
	if (model.identifier != self.identifier) {
		return;
	}
	if (![model.title isEqualToString:self.title] && [model.title length] > 0) {
		self.title = model.title;
	}
	if (![model.author isEqualToString:self.author] && [model.author length] > 0) {
		self.author = model.author;
	}
	if (model.type != self.type) {
		self.type = model.type;
	}
	if (model.currentPage != self.currentPage) {
		self.currentPage = model.currentPage;
	}
	if (model.maxPageCount != self.maxPageCount) {
		self.maxPageCount = model.maxPageCount;
	}
}

@end
