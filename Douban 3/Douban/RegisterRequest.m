//
//  RegisterRequest.m
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest



-(void)registerWithUsername:(NSString *)username
                   password:(NSString *)password
                     avatar:(UIImage *)image
                    success:(SuccessRequest)success
                    failure:(FailuerResponse)failure{
    
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    NSDictionary *parameter = @{@"userName":username,@"password":password};
    [request sendImageWithUrl:RegisterRequset_URL parameters:parameter image:image successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}

@end
