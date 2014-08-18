//
//  WLUserStateDataModel.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-22.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLUserStateDataModel.h"

@implementation WLUserStateDataModel

- (void)parse:(NSDictionary *)dict
{
    [super parse:dict];
    
    NSDictionary *data = [dict dictionaryValueForKey:@"data" defaultValue:nil];
    
    self.sid = [data stringValueForKey:@"sid"
                          defaultValue:@""
                             operation:NSStringOperationTypeTrim];
    self.uid = [data stringValueForKey:@"uid"
                          defaultValue:@""
                             operation:NSStringOperationTypeTrim];
    self.user_state = [data stringValueForKey:@"user_state"
                                 defaultValue:@""
                                    operation:NSStringOperationTypeTrim];
    self.create_date = [data stringValueForKey:@"create_date"
                                  defaultValue:@""
                                     operation:NSStringOperationTypeTrim];
    self.read_date = [data stringValueForKey:@"read_date"
                                defaultValue:@""
                                   operation:NSStringOperationTypeTrim];
    self.has_read = [data boolValueForKey:@"has_read"
                                  defaultValue:NO];
    self.extColumn1 = [data stringValueForKey:@"extColumn1"
                                 defaultValue:@""
                                    operation:NSStringOperationTypeTrim];
    self.extColumn2 = [data stringValueForKey:@"extColumn2"
                                      defaultValue:@""
                                         operation:NSStringOperationTypeTrim];
    self.extColumn3 = [data stringValueForKey:@"extColumn3"
                                 defaultValue:@""
                                    operation:NSStringOperationTypeTrim];
}

@end
