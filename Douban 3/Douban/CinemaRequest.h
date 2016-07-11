//
//  CinemaRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaRequest : NSObject

-(void)cinemaWithParameter:(NSDictionary *)parameterDic successBlock:(SuccessRequest)success failBlock:(FailuerResponse)fail;

@end
