//
//  UIColor+WL.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/12.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WL)

+ (UIColor *)colorWithHex:(NSString *)hexValue
                    alpha:(CGFloat)alphaValue;
+ (UIColor *)colorWithHex:(NSString *)hexValue;
+ (NSString *)hexFromUIColor:(UIColor *)color;

@end
