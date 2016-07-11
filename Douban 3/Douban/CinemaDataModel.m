//
//  CinemaDataModel.m
//  
//
//  Created by lanou3g on 16/6/28.
//
//

#import "CinemaDataModel.h"

@implementation CinemaDataModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
    
}


@end
