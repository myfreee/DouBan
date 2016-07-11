//
//  CineTableViewCell.h
//  Douban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaDataModel.h"
@interface CineTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *addressLable;
@property (strong, nonatomic) IBOutlet UILabel *phoneLable;

@property (nonatomic,strong)CinemaDataModel *model;
@end
