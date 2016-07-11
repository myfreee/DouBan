//
//  MovieViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModel.h"
#import "MovieTableViewCell.h"
@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *movieTable;
@property (nonatomic, strong)NSMutableArray *movies;
@end

@implementation MovieViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.movieTable registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MovieCell"];
    self.movies = [NSMutableArray array];
    [self MovieRequestData];
}




//电影请求
-(void)MovieRequestData {
    
    MovieRequest *movie = [[MovieRequest alloc]init];
    
    [movie MovieRequestWithParameter:nil successBlock:^(NSDictionary *dic) {
        // NSLog(@"movie==%@",dic);
        
        __weak typeof(self)weakSelf = self;
//        NSString *movieTitle = [dic objectForKey:@"title"];
        NSArray *tempMovie = [dic objectForKey:@"entries"];
        for (NSDictionary *dic in tempMovie) {
            MovieModel *model = [[MovieModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [weakSelf.movies addObject:model];
        }
        NSLog(@"%@/n",weakSelf.movies);
        [weakSelf.movieTable reloadData];
    } failBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.movies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    MovieModel *model = self.movies[indexPath.row];
     
    cell.model = model;
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 157;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieModel *model = self.movies[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"MovieSegu" sender:model];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
   
}


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"MovieSegu"]) {
        
        MovieViewController *detailVC = segue.destinationViewController;
        detailVC.model = sender;
        ;
        
        
    }
    
}


@end
