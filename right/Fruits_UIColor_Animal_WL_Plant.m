//
//  UIColor+WL.m
//  WLBase
//
//  Created by dachuiwang on 2018/4/12.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "Fruits_UIColor_Animal_WL_Plant.h"

@implementation UIColor (Fruits_UIColor_Animal_WL_Plant)

+ (UIColor*)Fruits_Color_Animal_WithHex_Plant:(NSString *)hexValue{
    return [UIColor Fruits_Color_Animal_WithHex_Plant:hexValue alpha:1.0];
}

+ (UIColor*)Fruits_Color_Animal_WithHex_Plant:(NSString *)hexValue alpha:(CGFloat)alphaValue{
    return [UIColor colorWithRed:((float)((strtoul([hexValue UTF8String], 0, 16) & 0xFF0000) >> 16))/255.0
                           green:((float)((strtoul([hexValue UTF8String], 0, 16) & 0xFF00) >> 8))/255.0
                            blue:((float)(strtoul([hexValue UTF8String], 0, 16) & 0xFF))/255.0 alpha:alphaValue];
}
+ (NSString *)Fruits_Hex_Animal_FromUIColor_Plant:(UIColor *)color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"FFFFFF"];
    }
    return [NSString stringWithFormat:@"%x%x%x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}


@end