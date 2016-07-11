//
//  NetWorkRequest.h
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "BaseRequset.h"

///成功回调
typedef void(^SuccessRequest)(NSDictionary *dic);
///失败回调
typedef void(^FailuerResponse)(NSError *error);

@interface NetWorkRequest : BaseRequset

///请求数据  url 请求数据的url paramenterDic 请求的参数 success 成功回调的Block 失败回调的Block
- (void)requestWithUrl:(NSString *)url
           paramenters:(NSDictionary *)paramenterDic
        successRequest:(SuccessRequest)success
       failuerResponse:(FailuerResponse)response;

-(void)sendDataWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameterDic
       successResponse:(SuccessRequest)success
       failureResponse:(FailuerResponse)failure;


-(void)sendImageWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
                  image:(UIImage *)uploadImage
        successResponse:(SuccessRequest)success
        failureResponse:(FailuerResponse)failure;

@end
