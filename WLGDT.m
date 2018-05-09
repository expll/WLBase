//
//  WLGDT.m
//  WLBase
//
//  Created by dachuiwang on 2018/5/9.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "WLGDT.h"
#import "GDTSplashAd.h"

GDTMobInterstitial *interstitial;
GDTSplashAd *splashAd;

@implementation WLGDT

+ (void)loadAdWithAppId:(NSString *)appId placementId:(NSString *)placementId {
    if(interstitial) {
        interstitial.delegate = nil;
    }
    interstitial = [[GDTMobInterstitial alloc] initWithAppId:appId placementId:placementId];
    interstitial.delegate = self;
    [interstitial loadAd];
}

//+ (void)loadSplashWithAppId:(NSString *)appId placementId:(NSString *)placementId {
//    splashAd = [[GDTSplashAd alloc] initWithAppId:appId placementId:placementId];
//    splashAd.delegate = self;
//    splashAd.fetchDelay = 5;
//    [splashAd loadAdAndShowInWindow:[[[UIApplication sharedApplication] delegate] window]];
//}

+ (void)showAd{
    UIViewController *root = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [interstitial presentFromRootViewController:root];
}

+ (void)interstitialSuccessToLoadAd:(GDTMobInterstitial *)interstitial {
    [self showAd];
}

+ (void)interstitialFailToLoadAd:(GDTMobInterstitial *)interstitial error:(NSError *)error {
    NSLog(@"interstitial fail to load, Error : %@",error);
}

//+(void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd{
//    NSLog(@"%s",__FUNCTION__);
//}
//
//+(void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error{
//    NSLog(@"%s%@",__FUNCTION__,error);
//}

@end
