//
//  WLSqlit.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLConstant.h"

@interface WLSqlit : NSObject

// 保存一个对象
+ (void)saveAObject:(id)obj Class:(Class)class primaryName:(NSString *)primaryName primaryKey:(NSString *)primaryKey;

// 提取一个对象
+ (void)getAObject:(Class )class ret:(blockRetObj)block;

// 判断一个对象是否存在
+ (void)getAObjectClass:(Class)class primaryName:(NSString *)primaryName primaryKey:(NSString *)primaryKey ret:(blockRetObj)block;

// 提取若干对象
+ (void)getObjects:(Class )class ret:(blockRetObj)block;

// 删除一个对象
+ (void)deleteAObject:(id)obj Class:(Class)class primaryName:(NSString *)primaryName primaryKey:(NSString *)primaryKey;

// 删除所有对象
+ (void)deleteObjectsClass:(Class)class;


@end
