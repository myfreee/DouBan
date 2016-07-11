//
//  MyTableViewCell.h
//  
//
//  Created by lanou3g on 16/6/29.
//
//

#import <UIKit/UIKit.h>
#define MyTableViewCell_Identify @"MyTableViewCell_Identify"
@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Titlelable;
@property (weak, nonatomic) IBOutlet UILabel *CacheLable;

@end
