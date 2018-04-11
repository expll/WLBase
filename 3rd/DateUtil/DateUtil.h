//
//  DateUtil.h
//  NoIcon
//
//  Created by bigcat on 14-12-11.
//  Copyright (c) 2014年 luocena. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FORMATTER_STRING_DATETIME   @"yyyy-MM-dd HH:mm:ss"
#define FORMATTER_STRING_DATE       @"yyyy-MM-dd"
#define FORMATTER_STRING_TIME       @"HH:mm:ss"

@interface DateUtil : NSObject

+ (NSDate*) getNowDate;

+ (NSString*) getNowDateTimeStr;

+ (NSString*) getNowTimeStr;

+ (NSString*) getNowDateStr;

+ (NSDate*) stringToDate: (NSString*) formatter _time:(NSString*) time;

+ (NSTimeInterval) getTimeSpan: (NSString*) time1 _time2:(NSString*) time2;

+ (int)compareDateTimeByFormatter:(NSString*)date01 withDate:(NSString*)date02 withFormatter:(NSString*)formatterString;

+ (int)compareDateTime:(NSString*)date01 withDate:(NSString*)date02;

+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02;

+ (int)compareTime:(NSString*)time01 withDate:(NSString*)time02;

+ (NSString*) getTimeStr;

// 根据传入格式输出日期
+ (NSString*) getNowStrByFormar:(NSString *)str;

@end
