//
//  AuthorRequest.h
//  MediaProject
//
//  Created by lanou3g on 16/7/7.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "BaseRequset.h"
#import "NetWorkRequest.h"
@interface AuthorRequest : BaseRequset

+(AuthorRequest *)shareAuthoreRequest;

/**
 *  所有Dota主播请求
 *
 *  @param success  ---
 *  @param response ---
 */
-(void)requestDotaAllAuthorSuccess:(SuccessRequest)success
                   failuerResponse:(FailuerResponse)response;
/**
 *  所有LoL主播请求
 *
 *  @param success  ---
 *  @param response ---
 */
-(void)requestLoLAllAuthorSuccess:(SuccessRequest)success
                   failuerResponse:(FailuerResponse)response;

/**
 *  所有全部主播请求
 *
 *  @param success  ---
 *  @param response ---
 */





@end
