//
//  ViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "ViewController.h"
#import "ActivityRequest/ActivityRequest.h"
#import "ActivityDetailRequest.h"
#import "MovieDetailRequest.h"
#import "MovieModel.h"
@interface ViewController ()

//所有电影
@property (nonatomic, strong)NSMutableArray *movies;
//所有活动
@property (nonatomic,strong)NSMutableArray *activities;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
   // [self MovieRequestData];
    //所有电影
    self.movies = [NSMutableArray array];
    //[self CinemaRequestData];
    //活动请求
   // [self requestActivityData];
    [self requestActivityDetaildataWith:@"26865955"];
   // [self MovieDetailRequestDataWith:@"25662337"];
    
}

//活动请求
- (void)requestActivityData {
    
    ActivityRequest *activity = [[ActivityRequest alloc]init];
    
    [activity activityWithParameter:nil sucessBlock:^(NSDictionary *dic) {
        //        NSLog(@"success==%@",dic);
        NSArray *events = [dic objectForKey:@"events"];
        // NSLog(@"%@",events);
        __weak typeof(self) weakSelf = self;
        for (NSDictionary *tempDic in events) {
            ActivityModel *model = [ActivityModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.activities addObject:model];
            NSLog(@"%@",weakSelf.activities);
        }
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}



//活动详情请求
- (void)requestActivityDetaildataWith:(NSString *)ID {
    
    ActivityDetailRequest *request = [[ActivityDetailRequest alloc]init];
    
    [request activityDetailRequestWithParameter:@{@"id":ID} successBlock:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
    } failureBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



//电影请求
-(void)MovieRequestData {

    MovieRequest *movie = [[MovieRequest alloc]init];
    
    [movie MovieRequestWithParameter:nil successBlock:^(NSDictionary *dic) {
       // NSLog(@"movie==%@",dic);
        
        __weak typeof(self)weakSelf = self;
        NSString *movieTitle = [dic objectForKey:@"title"];
           NSArray *tempMovie = [dic objectForKey:@"entries"];
        for (NSDictionary *dic in tempMovie) {
            MovieModel *model = [[MovieModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [weakSelf.movies addObject:model];
        }
        NSLog(@"%@/n",weakSelf.movies);
      
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
//电影详情请求
- (void)MovieDetailRequestDataWith:(NSString *)ID {
    
    MovieDetailRequest *request = [[MovieDetailRequest alloc]init];
    [request movieDetailRequestParameter:@{@"id":ID} successBlock:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
    } failuer:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

//影院请求
- (void)CinemaRequestData {
    
    CinemaRequest *request = [[CinemaRequest alloc]init];
    
    [request cinemaWithParameter:nil successBlock:^(NSDictionary *dic) {
        NSLog(@"cinema==%@",dic);
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];
    

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
