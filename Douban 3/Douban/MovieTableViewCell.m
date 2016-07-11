//
//  MovieTableViewCell.m
//  Douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(MovieModel *)model {
    _model = model;
    self.titleL.text =  model.title;
    self.thestarL.text = model.stars;
    self.timeL.text = model.pubdate;
    [self.imageV setImageWithURL:[NSURL URLWithString:[model.images objectForKey:@"small"]]];
     
}
@end
