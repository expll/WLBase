//
//  WLFile.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLFile : NSObject

/*
 通过URL等字符串生成file
 /Documents/STR/CACHE 在这个目录下缓存
 */
+ (NSString *)getFileByStr:(NSString *)str;

// 通过URL等字符串生成file, 该文件不存在
+ (NSString *)getNILFileByStr:(NSString *)str;

// 文件夹大小
+ (float )folderSizeAtPath:(NSString*) folderPath;

// 清除所有缓存
+ (void)clearAllCache;


@end
