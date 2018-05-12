//
//  JKLian_2017_IOS_Mobile_Iphone_Ipad_APIFileTool.m
//  PLReader
//
//  Created by dachuiwang on 2017/7/12.
//  Copyright © 2017年 dachuiwang. All rights reserved.
//

#import "Fruits_Wl_Animal_File_Plant.h"

@implementation Fruits_Wl_Animal_File_Plant

// 通过URL等字符串生成file
+ (NSString *)Fruits_GetFile_Animal_ByStr_Plant:(NSString *)str{
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [[paths objectAtIndex:0] stringByAppendingFormat:@"/STR/CACHE"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:cacheDir isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *file = [cacheDir stringByAppendingFormat:@"/%@", str];
    if(![[NSFileManager defaultManager] fileExistsAtPath:file isDirectory:nil]) {
        [[NSFileManager defaultManager] createFileAtPath:file contents:nil attributes:nil];
    }
    return file;
}

// 通过URL等字符串生成file, 该文件不存在
+ (NSString *)Fruits_GetNILFile_Animal_ByStr_Plant:(NSString *)str{
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [[paths objectAtIndex:0] stringByAppendingFormat:@"/STR/CACHE"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:cacheDir isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *file = [cacheDir stringByAppendingFormat:@"/%@", str];
    return file;
}
+ (void)Fruits_Clear_Animal_AllCache_Plant {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [[paths objectAtIndex:0] stringByAppendingFormat:@"/STR/CACHE"];
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:cacheDir error:&error];
}
@end
