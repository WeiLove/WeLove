//
//  WLNetWorkService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-22.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLNetWorkService.h"

static WLNetWorkService *instance = nil;

@implementation WLNetWorkService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[WLNetWorkService alloc] init];
        }
    });
    
    return instance;
}

@end
