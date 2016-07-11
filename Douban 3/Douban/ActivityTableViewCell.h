//
//  ActivityTableViewCell.h
//  Douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface ActivityTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleL;
@property (strong, nonatomic) IBOutlet UILabel *timeL;
@property (strong, nonatomic) IBOutlet UILabel *adressIMG;
@property (strong, nonatomic) IBOutlet UILabel *partyL;
@property (strong, nonatomic) IBOutlet UILabel *insL;
@property (strong, nonatomic) IBOutlet UILabel *joinL;
@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, strong)ActivityModel *model;

@end
