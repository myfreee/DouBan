//
//  RegisterViewController.m
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest.h"
@interface RegisterViewController ()<UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *RuserNameTF;
@property (weak, nonatomic) IBOutlet UITextField *RpassWordTF;
@property (weak, nonatomic) IBOutlet UIImageView *HimageView;

@end

@implementation RegisterViewController
- (IBAction)RegisterAction:(UIButton *)sender {
    
    if (self.RuserNameTF.text.length == 0 || self.RpassWordTF.text.length == 0) {
        
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码不能为空！" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *KAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertVC addAction:KAction];
        
        [self presentViewController:alertVC animated:YES completion:^{
            
        }];
        
    }else {
        
        
        //保存头像到本地
        RegisterRequest *request = [[RegisterRequest alloc]init];
        [request registerWithUsername:self.RuserNameTF.text password:self.RpassWordTF.text avatar: _HimageView.image success:^(NSDictionary *dic) {
            NSLog(@"%@",dic);
            
            
            long code = [[dic objectForKey:@"code"] longValue];
            
            if (code == 1002) {
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名已经存在" preferredStyle:(UIAlertControllerStyleAlert)];
                
                UIAlertAction *failAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertVC addAction:failAction];
                
                [self presentViewController:alertVC animated:YES completion:^{
                    
                }];
                
            }
            
            if (code == 1005) {
                
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:(UIAlertControllerStyleAlert)];
                
                UIAlertAction *failAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                    NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
                    NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
                    
                    [[NSUserDefaults standardUserDefaults] setObject: avatar forKey:@"avatar"];
                    [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
                    
                    [[NSUserDefaults standardUserDefaults]synchronize];
                    
                    [self dismissViewControllerAnimated:YES completion:^{
                        
                    }];
                    
                    
                }];
                
                [alertVC addAction:failAction];
                
                [self presentViewController:alertVC animated:YES completion:^{
                    
                    
                    
                }];
                
            }
            
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
        
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.RpassWordTF.delegate = self;
    self.RuserNameTF.delegate = self;
    //轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapAction:)];
    [self.HimageView addGestureRecognizer:tap];
    self.HimageView.userInteractionEnabled = YES;
    
    
}

-(void)TapAction:(UITapGestureRecognizer *)tap {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.HimageView.image = selectedImage;
    
    [self dismissViewControllerAnimated:YES completion:^{
        
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
