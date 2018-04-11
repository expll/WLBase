//
//  WLConstant.h
//  WLBase
//
//  Created by dachuiwang on 2018/4/11.
//  Copyright © 2018年 dachuiwang. All rights reserved.
//

#ifndef WLConstant_h
#define WLConstant_h

typedef void (^blockRetObj) (id _Nullable obj);

#define WeakSelf __weak typeof(self) weakSelf = self;
#define StrongSelf __strong __typeof(weakSelf)strongSelf = weakSelf;





/*
 
    git tag '1.0.0'
    git push --tags
    pod lib lint
    pod trunk push WLBase.podspec --allow-warnings
 
 */



#endif /* WLConstant_h */
