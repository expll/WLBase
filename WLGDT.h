//
//  WLGDT.h
//  WLBase
//
//  Created by dachuiwang on 2018/5/9.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GDTMobInterstitial.h"

@interface WLGDT : NSObject
+ (void)loadAdWithAppId:(NSString *)appId placementId:(NSString *)placementId;
//+ (void)loadSplashWithAppId:(NSString *)appId placementId:(NSString *)placementId;

@end
