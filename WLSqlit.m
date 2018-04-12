//
//  Sqlit.m
//  PLReader
//
//  Created by dachuiwang on 2017/7/15.
//  Copyright © 2017年 dachuiwang. All rights reserved.
//


#import "JQFMDB.h"
#import "WLSqlit.h"

@implementation WLSqlit

+ (void)saveAObject:(id)obj Class:(Class)class primaryName:(NSString *)primaryName
         primaryKey:(NSString *)primaryKey {
    
    JQFMDB *db = [JQFMDB shareDatabase];
    
    [db jq_inDatabase:^{
        // 保证线程安全
        if (![db jq_isExistTable:NSStringFromClass(class)]) {
            [db jq_createTable:NSStringFromClass(class) dicOrModel:class];
        }
        NSString *sql = [NSString stringWithFormat:@"where %@ = '%@'",primaryName, primaryKey];
        NSArray *arr = [db jq_lookupTable:NSStringFromClass(class) dicOrModel:class whereFormat:sql];
        if (arr.count > 0) {
            [db jq_updateTable:NSStringFromClass(class) dicOrModel:obj whereFormat:sql];
            
        } else {
            //插入一条数据
            [db jq_insertTable:NSStringFromClass(class) dicOrModel:obj];
        }
        
    }];
}


+ (void)getAObject:(Class )class ret:(blockRetObj)block {
    JQFMDB *db = [JQFMDB shareDatabase];
    [db jq_inDatabase:^{
        // 保证线程安全
        if (![db jq_isExistTable:NSStringFromClass(class)]) {
            [db jq_createTable:NSStringFromClass(class) dicOrModel:class];
        }
        NSArray *arr = [db jq_lookupTable:NSStringFromClass(class) dicOrModel:class whereFormat:nil];
        if (arr.count > 0) {
            block([arr firstObject]);
        } else {
            block(nil);
        }
    }];
}

// 判断一个对象是否存在
+ (void)getAObjectClass:(Class)class primaryName:(NSString *)primaryName primaryKey:(NSString *)primaryKey ret:(blockRetObj)block; {
    JQFMDB *db = [JQFMDB shareDatabase];
    
    [db jq_inDatabase:^{
        // 保证线程安全
        if (![db jq_isExistTable:NSStringFromClass(class)]) {
            [db jq_createTable:NSStringFromClass(class) dicOrModel:class];
        }
        NSString *sql = [NSString stringWithFormat:@"where %@ = '%@'",primaryName, primaryKey];
        NSArray *arr = [db jq_lookupTable:NSStringFromClass(class) dicOrModel:class whereFormat:sql];
        if (arr.count > 0) {
            block([arr firstObject]);
        } else {
            block(nil);
        }
        
    }];
}


+ (void)getObjects:(Class )class ret:(blockRetObj)block {
    
    //printf("==1=%s:%f\n", __FUNCTION__, clock()/(float)CLOCKS_PER_SEC);
    JQFMDB *db = [JQFMDB shareDatabase];
    [db jq_inDatabase:^{
        // 保证线程安全
        if ([db jq_isExistTable:NSStringFromClass(class)]) {
            NSArray *arr = [db jq_lookupTable:NSStringFromClass(class) dicOrModel:class whereFormat:nil];
            //printf("==2=%s:%f\n", __FUNCTION__, clock()/(float)CLOCKS_PER_SEC);
            NSArray* reversedArray = [[arr reverseObjectEnumerator] allObjects];
            block(reversedArray);
            //printf("==3=%s:%f\n", __FUNCTION__, clock()/(float)CLOCKS_PER_SEC);
        }
        
    }];
}


+ (void)deleteAObject:(id)obj Class:(Class)class primaryName:(NSString *)primaryName primaryKey:(NSString *)primaryKey {
    JQFMDB *db = [JQFMDB shareDatabase];
    
    [db jq_inDatabase:^{
        // 保证线程安全
        if ([db jq_isExistTable:NSStringFromClass(class)]) {
            NSString *sql = [NSString stringWithFormat:@"where %@ = '%@'",primaryName, primaryKey];
            [db jq_deleteTable:NSStringFromClass(class) whereFormat:sql];
        }
        
        
    }];
}

+ (void)deleteObjectsClass:(Class)class {
    JQFMDB *db = [JQFMDB shareDatabase];
    
    [db jq_inDatabase:^{
        // 保证线程安全
        if ([db jq_isExistTable:NSStringFromClass(class)]) {
            [db jq_deleteAllDataFromTable:NSStringFromClass(class)];
        }
        
        
    }];
}








@end
