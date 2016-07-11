//
//  LonginRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LonginRequest : NSObject

-(void)loginRequestWithUsername:(NSString *)username
                       password:(NSString *)password
                        success:(SuccessRequest)success
                        failure:(FailuerResponse)failure;
@end
