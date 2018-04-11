//
//  DateUtil.m
//  NoIcon
//
//  Created by bigcat on 14-12-11.
//  Copyright (c) 2014年 luocena. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil{
    
}

static NSDateFormatter * df = nil;

+ (NSDate*) getNowDate
{
    // 获取系统当前时间
    NSDate * date = [NSDate date];
    NSTimeInterval sec = [date timeIntervalSinceNow];
    return[NSDate dateWithTimeIntervalSinceNow:sec];
}

//获取当前日期时间
+ (NSString*) getNowDateTimeStr
{
    //设置时间输出格式:
    if(df == nil){
        df = [[NSDateFormatter alloc] init];
    }
    [df setDateFormat:FORMATTER_STRING_DATETIME];
    NSString * na = [df stringFromDate: [self getNowDate]];
    
    // NSLog(@"系统当前时间为: %@",na);
    return na;
}

//获取当前日期

+ (NSString*) getNowDateStr
{
    //设置时间输出格式:
    if(df == nil){
        df = [[NSDateFormatter alloc] init];
    }
    [df setDateFormat:FORMATTER_STRING_DATE];
    NSString * na = [df stringFromDate: [self getNowDate]];
    
    //NSLog(@"系统当前时间为: %@",na);
    return na;
}

// 根据传入格式输出日期
+ (NSString*) getNowStrByFormar:(NSString *)str
{
    //设置时间输出格式:
    if(df == nil){
        df = [[NSDateFormatter alloc] init];
    }
    [df setDateFormat:str];
    NSString * na = [df stringFromDate: [self getNowDate]];
    
    //NSLog(@"系统当前时间为: %@",na);
    return na;
}

+ (NSString*) getTimeStr
{
    //设置时间输出格式:
    if(df == nil){
        df = [[NSDateFormatter alloc] init];
    }
    [df setDateFormat:FORMATTER_STRING_DATETIME];
    NSString * na = [df stringFromDate: [self getNowDate]];
    
    //NSLog(@"系统当前时间为: %@",na);
    return na;
}

//获取当前时间
+ (NSString*) getNowTimeStr
{
    //设置时间输出格式:
    if(df == nil){
        df = [[NSDateFormatter alloc] init];
    }
    [df setDateFormat:FORMATTER_STRING_TIME];
    NSString * na = [df stringFromDate: [self getNowDate]];
    
    //NSLog(@"系统当前时间为: %@",na);
    return na;
}

+ (int)compareDateTimeByFormatter:(NSString*)date01 withDate:(NSString*)date02 withFormatter:(NSString*)formatterString
{
    int ci;
    if(df == nil){
        df = [[NSDateFormatter alloc] init];
    }
    [df setDateFormat:formatterString];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}

+ (NSDate*) stringToDate: (NSString*) formatter _time:(NSString*) time{
    //设置时间输出格式:
    if(df == nil){
        df = [[NSDateFormatter alloc] init];
    }
    [df setDateFormat:formatter];
    NSDate *date = [df dateFromString:time];
    return date;
}

#pragma 计算第一个时间减去第二个时间的差
+ (NSTimeInterval) getTimeSpan: (NSString*) time1 _time2:(NSString*) time2{
    NSDate* date1 = [self stringToDate:FORMATTER_STRING_DATETIME _time:time1];
    NSDate* date2 = [self stringToDate:FORMATTER_STRING_DATETIME _time:time2];
    return [date1 timeIntervalSinceDate:date2];
}

// 比较两个日期时间大小
+ (int)compareDateTime:(NSString*)date01 withDate:(NSString*)date02{
    return [self compareDateTimeByFormatter:date01 withDate:date02 withFormatter:FORMATTER_STRING_DATETIME];
}

// 比较两个日期大小
+ (int)compareDate:(NSString*)date01 withDate:(NSString*)date02{
    return [self compareDateTimeByFormatter:date01 withDate:date02 withFormatter:FORMATTER_STRING_DATE];
}

// 比较两个日期时间大小
+ (int)compareTime:(NSString*)time01 withDate:(NSString*)time02{
    return [self compareDateTimeByFormatter:time01 withDate:time02 withFormatter:FORMATTER_STRING_TIME];
}

@end
