//
//  CineTableViewCell.m
//  Douban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "CineTableViewCell.h"

@implementation CineTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(CinemaDataModel *)model {
    
    self.titleLable.text = model.cinemaName;
    self.addressLable.text = model.address;
    self.phoneLable.text = model.telephone;
    
}
@end
