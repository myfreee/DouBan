//
//  CinemaRequest.m
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "CinemaRequest.h"

@implementation CinemaRequest


-(void)cinemaWithParameter:(NSDictionary *)parameterDic successBlock:(SuccessRequest)success failBlock:(FailuerResponse)fail {
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    [request requestWithUrl:CinemaRequest_URL paramenters:parameterDic successRequest:^(NSDictionary *dic) {
        success(dic);
    } failuerResponse:^(NSError *error) {
        
        fail(error);
        
    }];
 
    
}


@end
