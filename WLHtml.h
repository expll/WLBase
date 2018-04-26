//
//  WLHtml.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/26.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLHtmlRegex.h"

@interface WLHtml : NSObject

+ (NSString *)flipContent:(NSString *)content withRegex:(WLHtmlRegex *)regex;

+ (NSArray *)content2Dics:(NSString *)content withRegex:(WLHtmlRegex *)regex;

@end
