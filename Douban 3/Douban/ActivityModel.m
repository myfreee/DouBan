//
//  ActivityModel.m
//  
//
//  Created by lanou3g on 16/6/27.
//
//

#import "ActivityModel.h"
#import "OwnerModel.h"
@implementation ActivityModel

- (NSString *)description {
    
    return [NSString stringWithFormat:@"ID = %@, user = %@",self.ID,self.user];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
        
    }else if ([key isEqualToString:@"owner"]){
       
        OwnerModel *model = [[OwnerModel alloc]init];
        
        [model setValuesForKeysWithDictionary:value];
        _user = model;
        
    }
    
}



@end
