//
//  ActivityViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityRequest/ActivityRequest.h"
#import "ActivityDetaillViewController.h"
@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *avtivityTableview;

//所有活动
@property (nonatomic,strong)NSMutableArray *activities;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.avtivityTableview registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ActivityTableViewCell"];
         self.activities = [NSMutableArray array];
    [self requestActivityData];

 
    
}



//活动请求
- (void)requestActivityData {
    
    ActivityRequest *activity = [[ActivityRequest alloc]init];
    __weak typeof(self)weakSelf = self;
    [activity activityWithParameter:nil sucessBlock:^(NSDictionary *dic) {
        NSArray *arr = [dic objectForKey:@"events"];
       
        for (NSDictionary *dic in arr) {
            ActivityModel *model = [[ActivityModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [weakSelf.activities addObject:model];
        }
            NSLog(@"%@",weakSelf.activities);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.avtivityTableview reloadData];
        });
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
      return _activities.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityTableViewCell"];
    ActivityModel *model =self.activities[indexPath.row];
    cell.model = model;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 209;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
    ActivityModel *model = self.activities[indexPath.row];
    NSLog(@"%@",model);
    [self performSegueWithIdentifier:@"ActivityDetail" sender:model];
   
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"ActivityDetail"]) {
        
        ActivityDetaillViewController *detailVC = segue.destinationViewController;
          detailVC.model = sender
        ;
        
        
    }
    
    
    
}


@end
