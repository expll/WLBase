#import "Fruits_Wl_Animal_Tool_Plant.h"
#import <CoreText/CoreText.h>
@implementation Fruits_Wl_Animal_Tool_Plant
+ (NSString *)Fruits_Url_Animal_Encode_Plant:(NSString *)url {
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
+ (UIView *)Fruits_Init_Animal_View_Plant:(NSString *)name {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
    return [nibContents lastObject];
}
+ (UIFont*)Fruits_Custom_Animal_Font_Plant:(NSString*)path size:(CGFloat)size{
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
+ (void)Fruits_Blur_Animal_ImageView_Plant:(UIImageView *)imageview{
    if ([UIDevice currentDevice].systemVersion.floatValue>=8.0) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [imageview addSubview:effectView];
        effectView.frame = CGRectMake(0, 0, imageview.frame.size.width, imageview.frame.size.height);
        effectView.alpha = 0.99f;
    }
}
@end
