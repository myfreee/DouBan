//
//  DouBanTabBar.h
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DouBanTabBar;
@protocol DoubanDelegate <NSObject>

-(void)douBanItemDidClicked:(DouBanTabBar *)tabBar;

@end

@interface DouBanTabBar : UITabBar
/**
 *  当前选中的tabbar的下标
 */
@property (nonatomic, assign) int currentSelected;
/**
 *  当前选中的item
 */
@property (nonatomic, strong) UIButton *currentSelectedItem;
/**
 *  tabbar上所有的item
 */
@property (nonatomic, strong) NSArray *allitems;

-(id)initWithItems:(NSArray *)items fram:(CGRect)fram;

@property (nonatomic, weak)id<DoubanDelegate>douBanDelegate;

@end
