//
//  RegisterRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest : NSObject

-(void)registerWithUsername:(NSString *)username
                   password:(NSString *)password
                     avatar:(UIImage *)image
                    success:(SuccessRequest)success
                    failure:(FailuerResponse)failure;


@end
