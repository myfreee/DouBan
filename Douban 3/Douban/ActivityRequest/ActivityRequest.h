//
//  ActivityRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
@interface ActivityRequest : NSObject

- (void)activityWithParameter:(NSDictionary *)parameterDic
            sucessBlock:(SuccessRequest)sucess failure:(FailuerResponse)failuer;

@end
