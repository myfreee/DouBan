//
//  MovieModel.m
//  
//
//  Created by lanou3g on 16/6/27.
//
//

#import "MovieModel.h"

@implementation MovieModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}



@end
