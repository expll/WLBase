//
//  WLFile.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fruits_Wl_Animal_File_Plant : NSObject

/*
 通过URL等字符串生成file
 /Documents/STR/CACHE 在这个目录下缓存
 */
+ (NSString *)Fruits_GetFile_Animal_ByStr_Plant:(NSString *)str;
// 通过URL等字符串生成file, 该文件不存在
+ (NSString *)Fruits_GetNILFile_Animal_ByStr_Plant:(NSString *)str;
// 清除所有缓存
+ (void)Fruits_Clear_Animal_AllCache_Plant;


@end
