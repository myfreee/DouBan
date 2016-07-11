//
//  MovieDetailRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailRequest : NSObject

-(void)movieDetailRequestParameter:(NSDictionary *)parameterDic successBlock:(SuccessRequest)success failuer:(FailuerResponse)failuer;


@end
