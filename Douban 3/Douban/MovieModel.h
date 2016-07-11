//
//  MovieModel.h
//  
//
//  Created by lanou3g on 16/6/27.
//
//

#import "BaseModel.h"

@interface MovieModel : BaseModel

///大标题
@property(nonatomic, copy) NSString *title;

///正在上映的电影数
@property(nonatomic, copy) NSString *total;

///电影评分
@property(nonatomic, copy) NSString *rating;

///上映日期
@property(nonatomic, copy) NSString *pubdate;

///电影名称
@property(nonatomic, copy) NSString *detail;

///评论数
@property(nonatomic, copy) NSString *wish;

///原始标题
@property(nonatomic, copy) NSString *original_title;
///收藏数
@property(nonatomic, copy) NSString *collection;
///星级
@property(nonatomic, copy) NSString *stars;
///所有图片
@property (nonatomic,copy)NSDictionary *images;
///大图片
@property(nonatomic, copy) NSString *large;
///小图片
@property(nonatomic, copy) NSString *small;
///中等图片
@property(nonatomic, copy) NSString *medium;
///电影编号
@property (nonatomic,copy) NSString *ID;

@property (nonatomic,strong) NSString *client;

@end
