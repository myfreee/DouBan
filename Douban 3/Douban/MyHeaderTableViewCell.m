//
//  MyHeaderTableViewCell.m
//  Douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "MyHeaderTableViewCell.h"

@implementation MyHeaderTableViewCell

- (void)awakeFromNib {
    
    self.cellImageView.layer.masksToBounds = YES;
    self.cellImageView.layer.cornerRadius = self.cellImageView.bounds.size.width / 2.0;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
