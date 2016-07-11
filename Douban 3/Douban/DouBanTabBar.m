//
//  DouBanTabBar.m
//  Douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 myFree. All rights reserved.
//

#import "DouBanTabBar.h"

@implementation DouBanTabBar

-(id)initWithItems:(NSArray *)items fram:(CGRect)fram {
    self=[super init];
    
    if (self) {
       self.frame = fram;
        for (int i = 0; i < items.count; i++) {
            
            UIButton *btn = (UIButton *)items[i];
            
            CGFloat width = self.bounds.size.width  / items.count;
            
            CGFloat higth = self.bounds.size.height;
            btn.frame = CGRectMake(i * width, 0, width , higth);
            [btn addTarget:self action:@selector(btnClickde:) forControlEvents: UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        self.currentSelected = 0;
        self.currentSelectedItem = items[0];
        self.allitems = items;
    }
    return self;
    
}

-(void)btnClickde:(UIButton *)btn {
    self.currentSelectedItem = btn;
    for (int i = 0 ; i <self.allitems.count; i++) {
        
        UIButton *tempBtn = (UIButton *)self.allitems[i];
        
        if (btn == tempBtn) {
            self.currentSelected = i;
            tempBtn.selected = YES;
        }else {
            tempBtn.selected = NO;
        }
 
    }
    if (_douBanDelegate) {
        [_douBanDelegate douBanItemDidClicked:self];

    }
}





@end
