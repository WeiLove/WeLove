//
//  HRLNetWorkService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-22.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLNetWorkService.h"

static HRLNetWorkService *instance = nil;

@implementation HRLNetWorkService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[HRLNetWorkService alloc] init];
        }
    });
    
    return instance;
}

@end
