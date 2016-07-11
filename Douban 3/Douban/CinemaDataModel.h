//
//  CinemaDataModel.h
//  
//
//  Created by lanou3g on 16/6/28.
//
//

#import "BaseModel.h"

@interface CinemaDataModel : BaseModel

///影院编号
@property (nonatomic, copy) NSString *ID;
///影院所在城市名
@property (nonatomic, copy) NSString *cityName;
///影院名
@property (nonatomic, copy) NSString *cinemaName;
///影院地址
@property (nonatomic, copy) NSString *address;
///电话号码
@property (nonatomic, copy) NSString *telephone;
///纬度
@property (nonatomic, copy) NSString *latitude;
///经度
@property (nonatomic, copy) NSString *longitude;
///交通路线
@property (nonatomic, copy) NSString *trafficRoutes;

///页码
@property (nonatomic, copy) NSString *page;
///页面大小
@property (nonatomic, copy) NSString *pagesize;
///页码总数
@property (nonatomic, copy) NSString *totalpage;


@end
