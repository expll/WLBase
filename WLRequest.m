//
//  WLRequest.m
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "WLRequest.h"

@implementation WLRequest

+ (void)request:(NSString *_Nullable)url ret:(void (^_Nullable)(NSURLResponse* _Nullable response, NSData* _Nullable data, NSError* _Nullable connectionError)) handler {
    //printf("=====:%s\n", [url UTF8String]);
    // NEW
    
    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfig delegate:nil delegateQueue: [[NSOperationQueue alloc] init]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////
    [self setHttpHeadersWithRequest:&request];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        handler(response, data, error);
    }];
    
    // 使用resume方法启动任务
    [task resume];
    
}

// 预留一个API 设置httpHeads
+ (void)setHttpHeadersWithRequest:(NSMutableURLRequest **_Nullable)request {
    
}

+ (NSString *)decodingGB32:(NSData *)data {
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];
    return retStr;
}

@end
