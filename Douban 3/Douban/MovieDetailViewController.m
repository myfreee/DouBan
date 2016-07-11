//
//  MovieDetailViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieRequest.h"
#import "MovieDetailModel.h"
#import "MovieDetailRequest.h"
#import "UIImageView+AFNetworking.h"
#import "MovieDetailModel.h"
#import "MBProgressHUD.h"
#import "UMSocialData.h"
#import "UMSocialSnsService.h"
#import "UMSocialSnsPlatformManager.h"
@interface MovieDetailViewController ()<MBProgressHUDDelegate,UMSocialUIDelegate>

@property (nonatomic,strong)MBProgressHUD *hub;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.model.title;
    self.pfL.text = self.model.rating;
    self.timeL.text = self.model.pubdate;
  [self.imageV setImageWithURL:[NSURL URLWithString:[self.model.images objectForKey:@"small"]]];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(shareAction:)];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:(UIBarButtonItemStylePlain) target:self action:@selector(shareAction1:)];
   
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:item1,item2, nil]];
//原型进度条
    self.hub = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview: self.hub];
     self.hub.mode = MBProgressHUDModeAnnularDeterminate;
     self.hub.delegate = self;
     self.hub.labelText = @"Loading";
    [ self.hub showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
 
  
    
//    
//    // Set custom view mode
//     self.hub.mode = MBProgressHUDModeCustomView;
//     self.hub.delegate = self;
//     self.hub.labelText = @"稍等";
//    [ self.hub show:YES];
//    [ self.hub hide:YES afterDelay:3];
//    [self.view addSubview:self.hub];
    
}

-(void) myProgressTask{
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        self.hub.progress = progress;
        usleep(5000);
       
    }  
    
}


-(void)hudWasHidden:(MBProgressHUD *)hud
{
    [hud removeFromSuperview];
    hud = nil;
     [ self MovieDetailRequestDataWith:self.model.ID];
}


-(void)shareAction:(UIBarButtonItem *)sendr {
    
    
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:[self.model.images objectForKey:@"small"]];
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText: [NSString stringWithFormat:@"%@ 上映时间：%@",self.model.title,self.timeL.text]                                shareImage:[UIImage imageNamed:@""]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina]
                                       delegate:self];
    
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

-(void)shareAction1:(UIBarButtonItem *)sender {
    
}

//电影详情请求

- (void)MovieDetailRequestDataWith:(NSString *)ID {
    
    MovieDetailRequest *request = [[MovieDetailRequest alloc]init];
    [request movieDetailRequestParameter:@{@"id":ID} successBlock:^(NSDictionary *dic) {
        NSString *summary = [dic objectForKey:@"summary"];
        NSArray *durations = [dic objectForKey:@"durations"];
        NSArray *genres = [dic objectForKey:@"genres"];
        NSArray *countries = [dic objectForKey:@"countries"];
        self.detalTV.text = summary;
         
        self.miaoL.text = durations.firstObject;
        
        self.cratL.text = genres.firstObject;
        
        self.addrESSL.text = [NSString stringWithFormat:@"%@" ,countries.firstObject];
    } failuer:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
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
