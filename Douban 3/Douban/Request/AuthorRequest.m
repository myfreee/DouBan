
//
//  AuthorRequest.m
//  MediaProject
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "AuthorRequest.h"
#import "NetWorkRequest.h"
static AuthorRequest *request = nil;

@implementation AuthorRequest


+(AuthorRequest *)shareAuthoreRequest {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[AuthorRequest alloc]init];
    });
    return request;
}



+(id)allocWithZone:(struct _NSZone *)zone {
    @synchronized(request) {
        if (!request) {
            request = [super allocWithZone:zone];
        }
    }
    return request;
}


+ (id)copyWithZone:(struct _NSZone *)zone {
    return request;
}




-(void)requestAllAuthorWithURL:(NSString *)url
                successRequest:(SuccessRequest)success
               failuerResponse:(FailuerResponse)response {

    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    [request requestWithUrl:url paramenters:nil successRequest:^(NSDictionary *dic) {
        success(dic);
    } failuerResponse:^(NSError *error) {
        response(error);
    }];

}


-(void)requestDotaAllAuthorSuccess:(SuccessRequest)success
                   failuerResponse:(FailuerResponse)response {
    
    
    [self requestAllAuthorWithURL:DotaAuthor_URL successRequest:^(NSDictionary *dic) {
          success(dic);
    } failuerResponse:^(NSError *error) {
          response(error);
    }];
    
    
}

-(void)requestLoLAllAuthorSuccess:(SuccessRequest)success
                  failuerResponse:(FailuerResponse)response
{
    
    
    
    [self requestAllAuthorWithURL: LoLAuthor_URL successRequest:^(NSDictionary *dic) {
          success(dic);
    } failuerResponse:^(NSError *error) {
          response(error);
    }];
    
}









@end
