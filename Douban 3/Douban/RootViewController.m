
//
//  RootViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"
@interface RootViewController ()<DoubanDelegate>

@property (nonatomic, strong) DouBanTabBar *dbTabBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [self addtabBar];
     [self.tabBar removeFromSuperview];
     self.dbTabBar.douBanDelegate = self;
   }

-(void)addtabBar {
   
    UIButton *btn1 = [UIButton buttonWithType:(  UIButtonTypeCustom)];
    [btn1 setImage:[UIImage imageNamed:@"paper.png"] forState:UIControlStateNormal];
    [btn1 setTitle:@"活动" forState:(UIControlStateNormal)];
    btn1.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn1 setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
     [btn1 setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
     [btn1 setImageEdgeInsets:(UIEdgeInsetsMake(0, 5, 15, 0))];
    [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60,-30, 0)];
    [btn1 setImage:[UIImage imageNamed:@"paperH.png"] forState:(UIControlStateSelected)];
    UIButton *btn2 = [UIButton buttonWithType:(  UIButtonTypeCustom)];
    [btn2 setTitle:@"电影" forState:(UIControlStateNormal)];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn2 setImageEdgeInsets:(UIEdgeInsetsMake(0, 5, 15, 0))];
    [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60,-30, 0)];
     [btn2 setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    [btn2 setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
    [btn2 setImage:[UIImage imageNamed:@"video.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"videoH.png"]  forState:(UIControlStateSelected)];
   
    UIButton *btn3 = [UIButton buttonWithType:(  UIButtonTypeCustom)];
    [btn3 setImage:[UIImage imageNamed:@"2image.png"]  forState:UIControlStateNormal];
    [btn3 setTitle:@"影院" forState:(UIControlStateNormal)];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14];
     [btn3 setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
     [btn3 setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
    [btn3 setImageEdgeInsets:(UIEdgeInsetsMake(0, 5, 15, 0))];
    [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60,-30, 0)];
    [btn3 setImage:[UIImage imageNamed:@"2imageH.png"]  forState:(UIControlStateSelected)];
    
    UIButton *btn4 = [UIButton buttonWithType:(  UIButtonTypeCustom)];
    [btn4 setTitle:@"我的" forState:(UIControlStateNormal)];
    btn4.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn4 setImageEdgeInsets:(UIEdgeInsetsMake(0, 5, 15, 0))];
    [btn4 setTitleEdgeInsets:UIEdgeInsetsMake(0, -60,-30, 0)];
     [btn4 setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
     [btn4 setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
    [btn4 setImage:[UIImage imageNamed:@"person.png"]   forState:UIControlStateNormal];
    [btn4 setImage:[UIImage imageNamed:@"personH.png"]  forState:(UIControlStateSelected)];
    
       self.dbTabBar = [[DouBanTabBar alloc]initWithItems:@[btn1,btn2,btn3,btn4] fram:CGRectMake(0,WindowHeight - 49 , WindownWidth, 49)];
   
   self.dbTabBar.backgroundImage =[UIImage imageNamed:@"nav.png"];
    [self.view addSubview:self.dbTabBar];

 
    
}

-(void)btnWithimage:(UIImage *)imageNormal  selectedImage:(UIImage *)imageSelected setImageEdeInsets:(UIEdgeInsets *)imageEdeInsets setTitleEdInsets:(UIEdgeInsets *)titleEdeInsets
{
    
    
}








- (void)douBanItemDidClicked:(DouBanTabBar *)tabBar {
    
    self.selectedIndex  = tabBar.currentSelected ;
    
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
