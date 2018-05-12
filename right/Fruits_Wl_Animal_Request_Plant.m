//
//  WLRequest.m
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "Fruits_Wl_Animal_Request_Plant.h"

@implementation Fruits_Wl_Animal_Request_Plant
+ (void)Fruits_Wl_Animal_Request_Plant:(NSString *_Nullable)url ret:(void (^_Nullable)(NSURLResponse* _Nullable response, NSData* _Nullable data, NSError* _Nullable connectionError)) handler {

    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfig delegate:nil delegateQueue: [[NSOperationQueue alloc] init]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////
    [self Fruits_setHttp_Animal_Headers_Plant:&request];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        handler(response, data, error);
        if (error) {
        }
    }];
    // 使用resume方法启动任务
    [task resume];
}

// 预留一个API 设置httpHeads
+ (void)Fruits_setHttp_Animal_Headers_Plant:(NSMutableURLRequest **_Nullable)request {
    
}
+ (NSString *)Fruits_Decoding_Animal_GB32_Plant:(NSData *)data {
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];
    return retStr;
}

@end
