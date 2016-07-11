//
//  ActivityRequest.m
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "ActivityRequest.h"

@implementation ActivityRequest

- (void)activityWithParameter:(NSDictionary *)parameterDic
            sucessBlock:(SuccessRequest)sucess failure:(FailuerResponse)failuer {
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    [request requestWithUrl:ActivityRequest_URL paramenters:parameterDic successRequest:^(NSDictionary *dic) {
        
        sucess(dic);
        
    } failuerResponse:^(NSError *error) {
        
        failuer(error);
        
    }];
    
    
}


@end
