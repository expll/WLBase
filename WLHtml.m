//
//  WLHtml.m
//  WLBase
//
//  Created by dachuiwang on 2018/4/26.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "WLHtml.h"
#import "RegexKitLite.h"

@implementation WLHtml

+ (NSString *)flipContent:(NSString *)content withRegex:(WLHtmlRegex *)regex{
    for (NSString *reg in regex.removeRegArr) {
        content = [content stringByReplacingOccurrencesOfRegex:reg withString:@""];
    }
    return content;
}

+ (NSString *)getValueBy:(NSString *)str dic:(NSDictionary *)dic content:(NSString *)content {
    NSString *regexStr = [str stringByAppendingString:@"Regex"];
    NSString *value = [content stringByReplacingOccurrencesOfRegex:dic[regexStr] withString:dic[str]];
    if(![content isMatchedByRegex:dic[regexStr]]){
        value = @"";
    }
    return value;
}

+ (NSArray *)content2Dics:(NSString *)content withRegex:(WLHtmlRegex *)regex{
    NSDictionary *dic = regex.bookRegDic;
    NSArray *arr = [content componentsMatchedByRegex:dic[@"bookcellRegex"]];
    NSMutableArray *mulArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < arr.count; i++) {
        NSString *str = arr[i];
        NSMutableDictionary *mulDic = [NSMutableDictionary dictionaryWithCapacity:0];
        NSArray *keys = @[@"title", @"author", @"des", @"cat", @"lastChapter", @"cover", @"update"];
        for (NSString *key in keys) {
            NSString *value = [self getValueBy:key dic:dic content:str];
            [mulDic setObject:value forKey:key];
        }
        [mulArr addObject:mulDic];
    }
    return mulArr;
}

@end
