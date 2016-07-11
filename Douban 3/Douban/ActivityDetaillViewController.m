//
//  ActivityDetaillViewController.m
//  
//
//  Created by lanou3g on 16/6/30.
//
//

#import "ActivityDetaillViewController.h"
#import "ActivityRequest/ActivityDetailRequest.h"
#import "UIImageView+AFNetworking.h"
#import "UMSocialData.h"
#import "UMSocialSnsService.h"
#import "UMSocialSnsPlatformManager.h"

@interface ActivityDetaillViewController ()<UMSocialUIDelegate>

@end

@implementation ActivityDetaillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"活动详情";
    self.titleL.text = self.model.title;
    self.timeL.text = [NSString stringWithFormat:@"%@-%@",self.model.begin_time,self.model.end_time];
    self.partyL.text = self.model.category_name;
  ;
    
    self.addressL.text = self.model.address;
    self.detailL.text = self.model.content;
    [self.imageV setImageWithURL:[NSURL URLWithString:self.model.image ]];
self.textLV.text = self.model.content;
    
    [self requestActivityDetaildataWith:self.model.ID];
    
    
     UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(shareAction:)];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:(UIBarButtonItemStylePlain) target:self action:@selector(shareAction1:)];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:item1,item2, nil]];
    
    
    
    
    
}

-(void)shareAction:(UIBarButtonItem *)sendr {
 
    
    
    
    
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:self.model.image];
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText: [NSString stringWithFormat:@"%@"@"%@",self.titleL.text,self.model.adapt_url]                                 shareImage:[UIImage imageNamed:@""]
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

- (void)requestActivityDetaildataWith:(NSString *)ID {
    
    ActivityDetailRequest *request = [[ActivityDetailRequest alloc]init];
    
    [request activityDetailRequestWithParameter:@{@"id":ID} successBlock:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
    } failureBlock:^(NSError *error) {
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
