//
//  CCNSDate.m
//  CCFC
//
//  Created by xichen on 11-12-17.
//  Copyright 2011年 ccteam. All rights reserved.
//

#import "CCNSDate.h"


@implementation NSDate(cc)

// 获取系统时间(yyyy-MM-dd HH:mm:ss.SSS格式)
+ (NSString *)getSystemTimeStr
{
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];	// 设置格式为年-月-日 时:分:秒.毫秒
	
	NSString *timeStr = [dateFormatter stringFromDate:[NSDate date]];
	[dateFormatter release];
	
	return timeStr;
}

// print current time using printf func
+ (void)printCurrentTime
{
	printf("Current Time is %s\n", [[self getSystemTimeStr] UTF8String]);
}

// print the system date by chinese format
+ (void)printSystemDateByChineseFormat
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	//NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
	//[formatter setLocale:locale];
	//[locale release];
	
	[formatter setDateFormat:@"YYYY年MM月d日EEEE"];
	NSDate *date = [NSDate date];
	NSLog(@"%@", [formatter stringFromDate:date]);
	[formatter release];
}

// get the number of days from self to the current date 
- (NSUInteger)daysAgo 
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:NSDayCalendarUnit
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	
	return [components day];	
}

// get the date of the midnight
- (NSDate *)midnight
{
	NSDateFormatter *formatter = [NSDateFormatter new];
	[formatter setDateFormat:@"yyyy-MM-dd"];
	
	NSDate *midnight = [formatter dateFromString:[formatter stringFromDate:self]];
	[formatter release];
	return midnight;
}

// get the weekday of the date
- (NSUInteger)weekday 
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	return [components weekday];
	
}

// the standard format of date, time, timestamp format string
+ (NSString *)dateFormatStr 
{
	return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatStr
{
	return @"HH:mm:ss";
}

+ (NSString *)timestampFormatStr
{
	return @"yyyy-MM-dd HH:mm:ss.SSS";
}

@end
