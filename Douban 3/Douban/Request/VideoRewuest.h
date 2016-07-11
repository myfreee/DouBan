//
//  VideoRewuest.h
//  LessonVideo
//
//  Created by lanou3g on 16/7/8.
//  Copyright © 2016年 yangke.guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkRequest.h"
#import "BaseRequset.h"
@interface VideoRewuest : BaseRequset


+(instancetype)shareVideoRequest;

- (void)requestDotaAllAuthorWithAuthorID:(NSString *)ID
                           success:(SuccessRequest)success
                           failure:(FailuerResponse)failure;
@end
