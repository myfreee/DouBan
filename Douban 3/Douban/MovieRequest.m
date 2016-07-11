//
//  MovieRequest.m
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "MovieRequest.h"

@implementation MovieRequest


- (void)MovieRequestWithParameter:(NSDictionary *)parameterDic  successBlock:(SuccessRequest)success failBlock:(FailuerResponse)failuer {
    
    
    NetWorkRequest *workRequest = [[NetWorkRequest alloc]init];
    
    [workRequest requestWithUrl:MovieRequest_URL paramenters:parameterDic successRequest:^(NSDictionary *dic) {
        success(dic);
    } failuerResponse:^(NSError *error) {
        failuer(error);
        
    }];
    
}


@end
