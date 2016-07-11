//
//  ActivityDetailRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityDetailRequest : NSObject

-(void)activityDetailRequestWithParameter:(NSDictionary *)parameter successBlock:(SuccessRequest)success failureBlock:(FailuerResponse)failuer;


@end
