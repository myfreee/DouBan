//
//  LoginViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "LoginViewController.h"
#import "LonginRequest.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;

@end

@implementation LoginViewController
- (IBAction)btnAction:(UIButton *)sender {
    //登陆
    [self login];
    //登陆成功后消失
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userNameTF.delegate = self;
      self.passWordTF.delegate = self;
}

-(void)login{
    
    //验证 判断用户名 密码
    if (self.userNameTF.text.length == 0) {
        NSLog(@"用户名为空");
    }else if (self.passWordTF.text.length == 0){
           NSLog(@"密码为空");
    }else {
        
        LonginRequest *request = [[LonginRequest alloc]init];
        [request loginRequestWithUsername:self.userNameTF.text password:self.passWordTF.text success:^(NSDictionary *dic) {
            NSLog(@"succeed");
            NSLog(@"%@",dic);
           long code = [[dic objectForKey:@"code"] longValue];
            if (code  == 1103) {
                
                
                NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
                NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
                
                [[NSUserDefaults standardUserDefaults] setObject: avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
                
            }
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
        
        
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)presentRegisterBtnAction:(UIButton *)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    RegisterViewController * registerVC = [storyBoard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    
     [self presentViewController:registerVC animated:YES completion:^{
         
     }];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
