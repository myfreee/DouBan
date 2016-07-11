//
//  MovieDetailModel.h
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "BaseModel.h"

@interface MovieDetailModel : BaseModel
@property (nonatomic,strong)NSString *genres;

@property (nonatomic,strong)NSString *pubdates;
@property (nonatomic,strong)NSString *avatars;
@end
