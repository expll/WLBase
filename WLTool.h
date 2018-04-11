//
//  WLTool.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WLTool : NSObject

// 主要对中文URL编码
+ (NSString *)urlencode:(NSString *)url;

// APP 最上层VC
+ (UIViewController *)appTopViewController;

// 通过xib创建view
+ (UIView *)initViewWithName:(NSString *)name;

// 获取机器字符串
+ (NSString *)modeStr;

// 自定义字体
+ (UIFont*)customFontWithPath:(NSString*)path size:(CGFloat)size;

// 字符串的加解密
+ (NSString *)Encode:(NSString *)s;
+ (NSString *)Decode:(NSString *)s;

@end
