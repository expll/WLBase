//
//  .m
//  
//
//  Created by dachuiwang on 2017/9/1.
//  Copyright © 2017年 dachuiwang. All rights reserved.
//

#import "WLTool.h"
#import <sys/utsname.h>
#import <CoreText/CoreText.h>
#import "RSA.h"
#import "DateUtil.h"


@implementation WLTool


+ (NSString *)urlencode:(NSString *)url {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[url UTF8String];
    unsigned long sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}


+ (UIViewController *)appTopViewController
{
    
    //NSLog(@"------->有几个windows:%@", [[UIApplication sharedApplication] windows]);
    UIViewController *appRootVC;
    id AppDelegate = [UIApplication sharedApplication].delegate;
    if ([AppDelegate respondsToSelector:@selector(window)]) {
        appRootVC = [AppDelegate window].rootViewController;
    } else {
        for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
            //NSLog(@"------->[Window Tag]: %d", [window tag]);
            if ([window tag] == 666) {
                //NSLog(@"------>找到了：%@", window);
                appRootVC = window.rootViewController;
            }
        }
    }
    
    UIViewController *topVC = appRootVC;
    
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    //NSLog(@"------->[%s]%@,%@", __FUNCTION__,[UIApplication sharedApplication].delegate,  topVC);
    
    if (!topVC) {
        topVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    }
    //NSLog(@"------->[%s]%@,%@", __FUNCTION__,[UIApplication sharedApplication].delegate,  topVC);
    
    return topVC;
}

+ (UIView *)initViewWithName:(NSString *)name {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
    return [nibContents lastObject];
}



// 获取机器字符串
+ (NSString *)modeStr {
    
    //
    NSString *phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSString *platform = [self iphoneType];
    
    return [NSString stringWithFormat:@"%@|%@", platform, phoneVersion];
    
}

+ (NSString *)iphoneType {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    return platform;
    
}


+ (UIFont*)customFontWithPath:(NSString*)path size:(CGFloat)size
{
    NSURL *fontUrl = [NSURL fileURLWithPath:path];
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)fontUrl);
    CGFontRef fontRef = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(fontRef, NULL);
    NSString *fontName = CFBridgingRelease(CGFontCopyPostScriptName(fontRef));
    UIFont *font = [UIFont fontWithName:fontName size:size];
    CGFontRelease(fontRef);
    return font;
}


// 字符串的加解密

+ (NSString *)Encode:(NSString *)s{
    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";
    
    NSString *encWithPubKey = [RSA encryptString:s publicKey:pubkey];
    return encWithPubKey;
}

+ (NSString *)Decode:(NSString *)s {
    
    NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";
    
    NSString *decWithPrivKey = [RSA decryptString:s privateKey:privkey];
    
    
    return decWithPrivKey;
}


// 判断是否是新的小时
// 返回YES的地方一定保存一下
// 使用了1个小时了 就需要更新缓存
+ (BOOL)isANewHOUR {
    id day = [[NSUserDefaults standardUserDefaults] objectForKey:@"isANewHOUR"];
    if (day == nil) {
        NSString *today = [DateUtil getNowStrByFormar:@"yyyy-MM-dd HH"];
        [[NSUserDefaults standardUserDefaults] setObject:today forKey:@"isANewHOUR"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
    NSString *today = [DateUtil getNowStrByFormar:@"yyyy-MM-dd HH"];
    if ([day isEqualToString:today]) {
        return NO;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:today forKey:@"isANewHOUR"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
    
}

+ (BOOL)isANewSecond {
    id second = [[NSUserDefaults standardUserDefaults] objectForKey:@"isANewSecond"];
    if (second == nil) {
        NSString *s = [DateUtil getNowStrByFormar:@"yyyy-MM-dd HH:mm:ss"];
        [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"isANewSecond"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
    NSString *s = [DateUtil getNowStrByFormar:@"yyyy-MM-dd HH:mm:ss"];
    if ([second isEqualToString:s]) {
        return NO;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"isANewSecond"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}


+ (void)saveNewHOUR {
    NSString *today = [DateUtil getNowStrByFormar:@"yyyy-MM-dd HH"];
    [[NSUserDefaults standardUserDefaults] setObject:today forKey:@"isANewHOUR"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)saveNewSecond {
    NSString *s = [DateUtil getNowStrByFormar:@"yyyy-MM-dd HH:mm:ss"];
    [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"isANewSecond"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}














































@end
