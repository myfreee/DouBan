//
//  CinemaViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "CinemaViewController.h"
#import "CineTableViewCell.h"
#import "CinemaDataModel.h"
#import "MapCViewController.h"
@interface CinemaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *cineTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.cineTableView registerNib:[UINib nibWithNibName:@"CineTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CineTableViewCell"];
    self.dataArray = [NSMutableArray array];
    [self CinemaRequestData];
}
//影院请求
- (void)CinemaRequestData {
    
    CinemaRequest *request = [[CinemaRequest alloc]init];
    
    [request cinemaWithParameter:nil successBlock:^(NSDictionary *dic) {
        NSLog(@"123%@",dic);
        __weak typeof (self)weakself = self;
        
        NSDictionary *tempp = dic[@"result"];
        NSArray *tempArray = tempp[@"data"];
        
        for (NSDictionary *temppDic in tempArray) {
            CinemaDataModel *model = [[CinemaDataModel alloc]init];
            [model setValuesForKeysWithDictionary:temppDic];
            [weakself.dataArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.cineTableView reloadData];
            
        });
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
        
    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
    
    


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CineTableViewCell"];
    
    CinemaDataModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MapCViewController *mapVC = [MapCViewController new];
    mapVC.cmodel = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:mapVC animated:YES];
    
}

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
