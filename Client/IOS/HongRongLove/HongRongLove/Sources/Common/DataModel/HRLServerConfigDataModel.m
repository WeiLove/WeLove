//
//  HRLServerConfigDataModel.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLServerConfigDataModel.h"

@implementation HRLServerConfigDataModel

- (void)parse:(NSDictionary *)dict
{
    [super parse:dict];
    
    NSDictionary *data = [dict dictionaryValueForKey:@"data"
                                        defaultValue:nil];
    
    self.server_name = [data stringValueForKey:@"server_name"
                                  defaultValue:@""
                                     operation:NSStringOperationTypeTrim];
    self.port = [data intValueForKey:@"port"
                        defaultValue:0];
}

@end
