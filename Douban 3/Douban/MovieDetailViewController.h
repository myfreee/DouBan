//
//  MovieDetailViewController.h
//  Douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "MovieDetailModel.h"
@interface MovieDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (strong, nonatomic) IBOutlet UILabel *pfL;
@property (strong, nonatomic) IBOutlet UILabel *timeL;
@property (strong, nonatomic) IBOutlet UILabel *miaoL;
@property (strong, nonatomic) IBOutlet UILabel *cratL;
@property (strong, nonatomic) IBOutlet UITextView *detalTV;
@property (strong, nonatomic) IBOutlet UILabel *addrESSL;
@property (nonatomic,strong)MovieModel *model;
@property (nonatomic,strong)MovieDetailModel *detailModel;
@end
