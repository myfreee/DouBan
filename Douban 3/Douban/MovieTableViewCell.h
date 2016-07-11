//
//  MovieTableViewCell.h
//  Douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
@interface MovieTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageV;
@property (strong, nonatomic) IBOutlet UILabel *titleL;

@property(nonatomic,strong)MovieModel *model;
@property (strong, nonatomic) IBOutlet UILabel *thestarL;
@property (strong, nonatomic) IBOutlet UILabel *timeL;


@end
