//
//  WLRequest.m
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "Fruits_Wl_Animal_Request_Plant.h"
#import "Reachability.h"

Reachability *hostReach;
BOOL isReachable = NSNotFound;

@implementation Fruits_Wl_Animal_Request_Plant
+ (void)Fruits_Wl_Animal_Request_Plant:(NSString *_Nullable)url ret:(void (^_Nullable)(NSURLResponse* _Nullable response, NSData* _Nullable data, NSError* _Nullable connectionError)) handler {
    if (isReachable != NSNotFound) {
        NSError *error = [NSError errorWithDomain:@"" code:NETWORK_ERROR userInfo:nil];
        if (isReachable == NO) {
            handler(nil, nil, error);
            return;
        }
    }
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
+ (void)Fruits_NetWork_Animal_Monitor_Plant{
    //开启网络状况的监听
    //来订阅实时的网络状态变化通知。导入Reachability.h头文件，然后注册一个对象来订阅网络状态变化的信息，网络状态变化的信息名称为kReachabilityChanged-Notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Fruits_Reachability_Animal_Changed_Plant:) name:kReachabilityChangedNotification object:nil];
    //通过检查某个主机能否访问来判断当前网络是否可用：
    hostReach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    //开始监听，会启动一个run loop
    [hostReach startNotifier];
}

+(void)Fruits_Reachability_Animal_Changed_Plant:(NSNotification *)note{
    Reachability *currReach = [note object];
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    //对连接改变做出响应处理动作
    NetworkStatus status = [currReach currentReachabilityStatus];
    //如果没有连接到网络就弹出提醒实况
    isReachable = YES;
    if(status == NotReachable){
        isReachable = NO;
        //[[VWProgressHUD shareInstance] showWarningMsg:@"似乎断网了"];
        return;
    }
    if (status==ReachableViaWiFi||status==ReachableViaWWAN) {
        isReachable = YES;
        // 网络有网通知
    }
}

@end