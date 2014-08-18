//
//  WLUserDataModel.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLUserDataModel.h"

@implementation WLUserDataModel

- (void)parse:(NSDictionary *)dict
{
    [super parse:dict];
    
    NSDictionary *data = [dict dictionaryValueForKey:@"data" defaultValue:nil];
    
    self.uid = [data stringValueForKey:@"uid"
                          defaultValue:@""
                             operation:NSStringOperationTypeTrim];
    self.user_password = [data stringValueForKey:@"user_password"
                                    defaultValue:@""
                                       operation:NSStringOperationTypeTrim];
    self.user_name = [data stringValueForKey:@"user_name"
                                defaultValue:@""
                                   operation:NSStringOperationTypeTrim];
    self.user_sex = [data stringValueForKey:@"user_sex"
                               defaultValue:@""
                                  operation:NSStringOperationTypeTrim];
    self.user_role = [data stringValueForKey:@"user_role"
                                defaultValue:@""
                                   operation:NSStringOperationTypeTrim];
}

@end
