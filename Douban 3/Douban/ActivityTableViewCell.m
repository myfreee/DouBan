//
//  ActivityTableViewCell.m
//  Douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ActivityDetaillViewController.h"
@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
     
    // Configure the view for the selected state
}
-(void)setModel:(ActivityModel *)model {
    _model = model;
   
    self.titleL.text = model.title;
    self.timeL.text = [NSString stringWithFormat:@"%@-%@",model.begin_time,model.end_time];
    self.partyL.text = model.category_name;
    self.insL.text = [NSString stringWithFormat:@"%d",model.wisher_count];
    self.joinL.text =[NSString stringWithFormat:@"%d", model.participant_count];
    self.adressIMG.text = model.address;
    ActivityDetaillViewController *detalvc = [ActivityDetaillViewController new];
     detalvc.textLV.text = model.content;
    
    [self.imageV setImageWithURL:[NSURL URLWithString:model.image ]];
}
@end
