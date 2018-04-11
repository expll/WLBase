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






#endif /* WLConstant_h */
