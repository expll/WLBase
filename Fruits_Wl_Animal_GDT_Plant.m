#import "Fruits_Wl_Animal_GDT_Plant.h"
#import "GDTSplashAd.h"
GDTMobInterstitial *interstitial;
GDTSplashAd *splashAd;
@implementation Fruits_Wl_Animal_GDT_Plant
+ (void)Fruits_LoadAd_Animal_WithAppId_Plant:(NSString *)appId placementId:(NSString *)placementId {
    if(interstitial) {
        interstitial.delegate = nil;
    }
    interstitial = [[GDTMobInterstitial alloc] initWithAppId:appId placementId:placementId];
    interstitial.delegate = self;
    [interstitial loadAd];
}
+ (void)Fruits_Show_Animal_Ad_Plant{
    UIViewController *root = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [interstitial presentFromRootViewController:root];
}
+ (void)interstitialSuccessToLoadAd:(GDTMobInterstitial *)interstitial {
    [self Fruits_Show_Animal_Ad_Plant];
}
+ (void)interstitialFailToLoadAd:(GDTMobInterstitial *)interstitial error:(NSError *)error {
}
@end
