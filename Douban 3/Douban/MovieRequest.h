//
//  MovieRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieRequest : NSObject

- (void)MovieRequestWithParameter:(NSDictionary *)parameterDic  successBlock:(SuccessRequest)success failBlock:(FailuerResponse)failuer;

@end
