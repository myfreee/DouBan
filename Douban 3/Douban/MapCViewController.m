//
//  MapCViewController.m
//  Douban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 myFree. All rights reserved.
//
#import "MapCViewController.h"
#import <BaiduMapAPI_Base/BMKMapManager.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import "CinemaDataModel.h"

@interface MapCViewController ()<BMKGeoCodeSearchDelegate,BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic,strong)BMKMapView *mapView;

@property (nonatomic,strong)BMKGeoCodeSearch  *searcher;

@property (nonatomic,strong)BMKLocationService *locService;

@property (nonatomic,strong)CinemaDataModel * mapMode;

@end

@implementation MapCViewController



- (void)viewWillAppear:(BOOL)animated {
    _mapView.delegate = self;
//    NSLog(@"%@",self.model.cityName);
//    NSLog(@"%@",self.model.address);
    self.title = @"地图";
}

//当不用地图的的时候八代刘设为nil

-(void)viewWillDisappear:(BOOL)animated {
       _mapView.delegate = nil;
}



- (void)viewDidLoad {
    [super viewDidLoad];
  _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WindownWidth , WindowHeight)];
    self.view = _mapView;
    _mapView.zoomLevel = 15;

   
    
    //初始化检索对象
    _searcher =[[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    
    geoCodeSearchOption.city= self.cmodel.cityName;     geoCodeSearchOption.address = self.cmodel.address;
    BOOL flag = [_searcher geoCode:geoCodeSearchOption];

    if(flag)
    {
        NSLog(@"geo检索发送成功");
    }
    else
    {
        NSLog(@"geo检索发送失败");
    }
    
//   //定位
//    //初始化BMKLocationService
//    _locService = [[BMKLocationService alloc]init];
//    _locService.delegate = self;
//    //启动LocationService
//    [_locService startUserLocationService];
  
}
/**编码的代理方法
 *返回地址信息搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结BMKGeoCodeSearch果
 *@param error 错误号，@see BMKSearchErrorCode
 */

-(void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    
    NSLog(@"%@",result);
    //    设置大头针
    BMKPointAnnotation *pointAnnotation = [[BMKPointAnnotation alloc]init];
    pointAnnotation.title = result.address;
    pointAnnotation.coordinate = result.location;
    [_mapView addAnnotation:pointAnnotation];
    _mapView.centerCoordinate = result.location;
    
}

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    //    当做大头针视图的标识符
    NSString *annotationViewId = @"annotationID";
    //    根据标识符,查找一个可以复用的大头针
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewId];
    //    如果没有可复用的大头针,就创建一个新的大头针,并加上标识符
    //
    //    BMKPinAnnotationView 是BMKAnnotationView子类,添加了颜色以及一个动画效果
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationViewId];
        //        效果设置:设置颜色
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorRed;
        //        设置动画效果(从天而降)
        ((BMKPinAnnotationView *)annotationView).animatesDrop = YES;
        
    }
    annotationView.annotation = annotation;
    //    设可以点击大头针弹出信息
    annotationView.canShowCallout = YES;
    return annotationView;
}






















////实现相关delegate 处理位置信息更新
////处理方向变更信息
//- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
//{
//    //NSLog(@"heading is %@",userLocation.heading);
//}
////处理位置坐标更新
//- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
//{
//    //NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
