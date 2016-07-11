//
//  ActivityDetailRequest.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "ActivityDetailRequest.h"

@implementation ActivityDetailRequest


-(void)activityDetailRequestWithParameter:(NSDictionary *)parameter successBlock:(SuccessRequest)success failureBlock:(FailuerResponse)failuer {
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    
    NSString *ID = [parameter objectForKey:@"id"];
    
    
    [request requestWithUrl:ActivityDetailRequest_URL(ID) paramenters:nil successRequest:^(NSDictionary *dic) {
        success(dic);
    } failuerResponse:^(NSError *error) {
         NSLog(@"%@",error);
        failuer(error);
    }];
    
    
}



@end
