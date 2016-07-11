//
//  MyHeaderTableViewCell.h
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MyHeaderableViewCell_Identify @"MyHeaderableViewCell_Identify"
@interface MyHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@property (weak, nonatomic) IBOutlet UILabel *cellLable;

@end
