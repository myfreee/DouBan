//
//  MyViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "MyHeaderTableViewCell.h"
#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic,strong)NSArray *titles;

@end

@implementation MyViewController

-(void)viewWillAppear:(BOOL)animated {
    [self.myTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    [self data];
    
}

    
    


-(void)data {
    
    self.titles = @[@"我的活动",@"我的电影",@"我的收藏",@"清理缓存"];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:@"登陆" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(0, 0, 40, 40);
    
    [btn setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn addTarget:self action:@selector(rightClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];

    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyHeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderableViewCell_Identify];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyTableViewCell_Identify];

}

-(void)rightClicked:(UIButton *)sender {
    
    UIStoryboard *storyID = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController *loginVC = [storyID instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyHeaderableViewCell_Identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://162.211.125.85/%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"avatar"]]];
        
        [cell.cellImageView sd_setImageWithURL:imageUrl];
        
//        NSURL *nameUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://162.211.125.85/%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]]];
//        NSString *name = nameUrl.absoluteString;
//        
//        cell.cellLable.text = name;

    cell.cellLable.text = @"愤怒的小鸡";
    return cell;
    }else {
        
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCell_Identify];
            
        cell.Titlelable.text = self.titles[indexPath.row -1];
        if ( indexPath.row == 4) {
            cell.CacheLable.text = [NSString stringWithFormat:@"%.1fM",[self getFilePath]];
        }
        
        return cell;
    }
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 ) {
        return 145;
    }
    return 44;
}




-(float)getFilePath{
    
    //文件管理
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //缓存路径
    
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    
    NSArray *cacheFileList;
    
    NSEnumerator *cacheEnumerator;
    
    NSString *cacheFilePath;
    
    unsigned long long cacheFolderSize = 0;
    
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    
    cacheEnumerator = [cacheFileList objectEnumerator];
    
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir
        stringByAppendingPathComponent:cacheFilePath] error:nil];
        
        cacheFolderSize += [cacheFileAttributes fileSize];
        
    }
    
    //单位MB
    
    return cacheFolderSize/1024/1024;
    
}
//清除缓存
-(void)removeCaches {
    dispatch_async(
                   
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   
                   , ^{
                       
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                       
                       
                       
                       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                       
                       NSLog(@"files :%lu",(unsigned long)[files count]);
                       
                       for (NSString *p in files) {
                           
                           NSError *error;
                           
                           NSString *path = [cachPath stringByAppendingPathComponent:p];
                           
                           if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                               
                               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                               
                           }
                           
                       }
                       
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
    
}





-(void)clearCacheSuccess

{
    
    NSLog(@"清理成功");
    
    



    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 4) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"清除缓存成功" message:[NSString stringWithFormat:@"本次共清理：%.1fM",[self getFilePath]] preferredStyle:(UIAlertControllerStyleAlert)];
           [self removeCaches];
        UIAlertAction *failAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
     
        
        }];
        
        [alertVC addAction:failAction];
        [self presentViewController:alertVC animated:YES completion:^{
            
            
            
        }];
        
        [self.myTableView reloadData];
    }
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
