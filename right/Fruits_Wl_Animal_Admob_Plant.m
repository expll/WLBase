#import "Fruits_Wl_Animal_Admob_Plant.h"
GADInterstitial *interstitiala;
@implementation Fruits_Wl_Animal_Admob_Plant
+ (void)Fruits_LoadWith_Animal_AdUnitID_Plant:(NSString *)AdUnitID {
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
}
@end
