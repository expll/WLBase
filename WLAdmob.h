//
//  WLAdmob.h
//  WLBase
//
//  Created by dachuiwang on 2018/5/9.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface WLAdmob : NSObject
+ (void)loadWithAdUnitID:(NSString *)AdUnitID;
@end
