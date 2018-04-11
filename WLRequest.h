//
//  WLRequest.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WLRequest : NSObject

+ (void)request:(NSString *_Nullable)url ret:(void (^_Nullable)(NSURLResponse* _Nullable response, NSData* _Nullable data, NSError* _Nullable connectionError)) handler;

// 预留一个API 设置httpHeads
+ (void)setHttpHeadersWithRequest:(NSMutableURLRequest *_Nullable*_Nullable)request;

+ (NSString *_Nullable)decodingGB32:(NSData *_Nullable)data;

@end
