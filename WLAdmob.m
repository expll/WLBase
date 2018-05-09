//
//  WLAdmob.m
//  WLBase
//
//  Created by dachuiwang on 2018/5/9.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import "WLAdmob.h"
GADInterstitial *interstitiala;

@implementation WLAdmob

+ (void)loadWithAdUnitID:(NSString *)AdUnitID {
    interstitiala = [[GADInterstitial alloc] initWithAdUnitID:AdUnitID];
    interstitiala.delegate = self;
    GADRequest *request = [GADRequest request];
    [interstitiala loadRequest:request];
}

+ (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    if (interstitiala.isReady) {
        UIViewController *root = [[[UIApplication sharedApplication] delegate] window].rootViewController;
        [interstitiala presentFromRootViewController:root];
    }
}

+ (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"interstitial:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

@end
