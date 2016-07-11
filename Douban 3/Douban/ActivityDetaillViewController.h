//
//  ActivityDetaillViewController.h
//  
//
//  Created by lanou3g on 16/6/30.
//
//

#import "BaseViewController.h"
@class ActivityModel;
@interface ActivityDetaillViewController : BaseViewController

@property (nonatomic, strong)ActivityModel *model;
@property (strong, nonatomic) IBOutlet UILabel *titleL;
@property (strong, nonatomic) IBOutlet UILabel *timeL;
@property (strong, nonatomic) IBOutlet UILabel *detailL;
@property (strong, nonatomic) IBOutlet UILabel *partyL;
@property (strong, nonatomic) IBOutlet UILabel *addressL;
@property (strong, nonatomic) IBOutlet UITextView *textLV;
@property (strong, nonatomic) IBOutlet UIImageView *imageV;

@end
