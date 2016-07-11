//
//  VideoRewuest.m
//  LessonVideo
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 yangke.guo. All rights reserved.
//

#import "VideoRewuest.h"

static VideoRewuest *request = nil;
@implementation VideoRewuest


+(instancetype)shareVideoRequest{
  
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[VideoRewuest alloc]init];
    });
    return request;
}


- (void)requestDotaAllAuthorWithAuthorID:(NSString *)ID
                           success:(SuccessRequest)success
                        failure:(FailuerResponse)failure{
    
    [self requestSingleAuthorAllVideoWihtUrl:DetaSingleAuthorAllVideoRequest_Url(ID) success:^(NSDictionary *dic) {
        success(dic);
    } failure:^(NSError *error) {
        failure(error);
    } ];
}


- (void)requestSingleAuthorAllVideoWihtUrl:(NSString *)url
                                   success:(SuccessRequest)success
                                   failure:(FailuerResponse)failure{

    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request requestWithUrl:url paramenters:nil successRequest:^(NSDictionary *dic) {
        
    } failuerResponse:^(NSError *error) {
        
    }];
}
@end
