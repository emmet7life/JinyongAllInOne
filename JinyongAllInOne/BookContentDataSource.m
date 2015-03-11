//
//  BookContentDataSource.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/3/11.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookContentDataSource.h"

@interface BookContentDataSource ()

@property (strong, nonatomic) NSString *bookName;

@property (strong, nonatomic) NSString *content;

@property (strong, nonatomic) NSMutableArray *contentRanges;

@property (assign, nonatomic) NSRange currentRange;

//@property (strong, nonatomic) NSLayoutManager *contentLayoutManager;

@property (assign, nonatomic) NSUInteger currentLocation;



@end

@implementation BookContentDataSource

+ (instancetype)sharedInstance {
	static dispatch_once_t pred = 0;
	__strong static id _sharedObject = nil;
	dispatch_once(&pred, ^{
		_sharedObject = [[self alloc] init];
	});
	return _sharedObject;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		self.contentRanges = [[NSMutableArray alloc] initWithCapacity:20];
		self.textStorage = [[NSTextStorage alloc] initWithString:[self loadDataWithBookName:@"雪山飞狐"]];
		self.contentLayoutManager = [[NSLayoutManager alloc] init];
		[self.textStorage addLayoutManager:self.contentLayoutManager];
		
		for (int i = 0; i < 10; i++) {
			NSTextContainer *container = [[NSTextContainer alloc] initWithSize:[[UIScreen mainScreen] applicationFrame].size];
			[self.contentLayoutManager addTextContainer:container];
		}
	}
	return self;
}

- (NSString *)loadDataWithBookName:(NSString *)bName {
//	if ([self.bookName isEqualToString:bName]) {
//		return YES;
//	}
	NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
	NSError *error = nil;
	NSString *string = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:bName ofType:@"txt"] encoding:enc error:&error];
	if (error) {
		NSLog(@"page data error = %@", [error localizedDescription]);
	}
	self.bookName = bName;
	return string;
//	self.content = [string mutableCopy];
//	self.bookName = bName;
//	return YES;
}

//- (BOOL)loadDataWithBookName:(NSString *)bName {
//	if ([self.bookName isEqualToString:bName]) {
//		return YES;
//	}
//	NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//	NSError *error = nil;
//	NSString *string = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:bName ofType:@"txt"] encoding:enc error:&error];
//	if (error) {
//		NSLog(@"page data error = %@", [error localizedDescription]);
//	}
//	self.content = [string mutableCopy];
//	self.bookName = bName;
//	return YES;
//}

- (void)calculatePageRanges {
	
	NSUInteger glyphs = [self.contentLayoutManager numberOfGlyphs];
	NSLog(@"glyphsss == %zd", glyphs);
//	do {
//		NSRange range = [self.contentLayoutManager glyphRangeForTextContainer:self.contentContainer];
//		NSLog(@"range loc = %lu, length = %lu", (unsigned long)range.location, (unsigned long)range.length);
//		[self.contentRanges addObject:[NSValue valueWithRange:range]];
//		self.currentLocation = range.length;
//	} while (self.currentLocation < glyphs);
//	
//	NSLog(@"array == %@", self.contentRanges);
	
//	self.currentRange = range;
	
//	[self.contentLayoutManager invalidateDisplayForGlyphRange:range];
	
	
//	CGRect allDataFrame = [self.content boundingRectWithSize:self.contentSize options:NSStringDrawingUsesLineFragmentOrigin attributes:[self contentAttributes] context:nil];
//	CGSize allDataSize = allDataFrame.size;
//	NSLog(@"size w = %f, h = %f", allDataSize.width, allDataSize.height);
//	
//	// 如果一页就能显示完，直接显示所有文本串即可。
//	if (allDataSize.height < self.contentSize.height) {
//		NSRange range = NSMakeRange(0, self.content.length);
//		[self.contentRanges setArray:@[[NSValue valueWithRange:range]]];
//	}else {
//
//	}
}

- (NSString *)contentAtPageIndex:(NSInteger)index {
//	if ([self loadDataWithBookName:@"雪山飞狐"]) {
//		return [self.content substringWithRange:[self.contentRanges[index] rangeValue]];
//
//		NSRange range = [self.contentLayoutManager glyphRangeForTextContainer:self.contentContainer];
//		
		return self.content;
//	}
//	return nil;
}



- (NSDictionary *)contentAttributes {
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.lineHeightMultiple  = 1.f;                    // 可变行高,乘因数
	paragraphStyle.lineSpacing         = 5.f;                    // 行间距
	paragraphStyle.minimumLineHeight   = 10.f;                   // 最小行高
	paragraphStyle.maximumLineHeight   = 20.f;                   // 最大行高
	paragraphStyle.paragraphSpacing    = 10.f;                   // 段间距
	paragraphStyle.alignment           = NSTextAlignmentLeft;    // 对齐方式
	paragraphStyle.firstLineHeadIndent = 30.f;                   // 段落首文字离边缘间距
	paragraphStyle.headIndent          = 0.f;                    // 段落除了第一行的其他文字离边缘间距
	paragraphStyle.tailIndent          = 0.f;                    // ???????
	
	NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont fontWithName:@"Snell Roundhand" size:16.f], NSForegroundColorAttributeName:[UIColor blackColor]};
	return attributes;
}

@end
