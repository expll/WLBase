//
//  JKLian_2017_IOS_Mobile_Iphone_Ipad_APIFileTool.m
//  PLReader
//
//  Created by dachuiwang on 2017/7/12.
//  Copyright © 2017年 dachuiwang. All rights reserved.
//

#import "WLFile.h"

@implementation WLFile

// 通过URL等字符串生成file
+ (NSString *)getFileByStr:(NSString *)str{
    
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
+ (NSString *)getNILFileByStr:(NSString *)str{
    
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [[paths objectAtIndex:0] stringByAppendingFormat:@"/STR/CACHE"];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:cacheDir isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *file = [cacheDir stringByAppendingFormat:@"/%@", str];
    
    
    return file;
}

+ (float )folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    int count = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        //        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        //        folderSize += [self fileSizeAtPath:fileAbsolutePath];
        count++;
    }
    return count*0.0037;
    return folderSize/(1024.0*1024.0);
}

//单个文件的大小
+ (float) fileSizeAtPath:(NSString*) filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}


+ (void)clearAllCache {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [[paths objectAtIndex:0] stringByAppendingFormat:@"/STR/CACHE"];
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:cacheDir error:&error];
}





@end
