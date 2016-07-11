//
//  MovieDetailRequest.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "MovieDetailRequest.h"

@implementation MovieDetailRequest


-(void)movieDetailRequestParameter:(NSDictionary *)parameterDic successBlock:(SuccessRequest)success failuer:(FailuerResponse)failuer {
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    NSString *ID = [parameterDic objectForKey:@"id"];
    
     [request requestWithUrl:MovieDetailRequest_URL(ID) paramenters:nil successRequest:^(NSDictionary *dic) {
         success(dic);
     } failuerResponse:^(NSError *error) {
         failuer(error);
     }];
    
}



@end
