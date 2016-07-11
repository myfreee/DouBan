//
//  LonginRequest.m
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "LonginRequest.h"

@implementation LonginRequest


-(void)loginRequestWithUsername:(NSString *)username
                       password:(NSString *)password
                        success:(SuccessRequest)success
                        failure:(FailuerResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request sendDataWithUrl:LoginRequest_URL parameters:@{@"userName":username,@"password":password} successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        failure(error);
        
    }];
    
}


@end
