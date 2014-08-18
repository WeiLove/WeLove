//
//  WLMapService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-18.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLMapService.h"
#import "BMapKit.h"

static WLMapService *instance = nil;

@interface WLMapService()<BMKGeneralDelegate>

@property(nonatomic, strong) BMKMapManager *mapManager;

@end

@implementation WLMapService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[WLMapService alloc] init];
        }
    });
    
    return instance;
}


#pragma mark - private



#pragma mark ______doing



#pragma mark ______clicked



#pragma mark ______create



#pragma mark ______notif



#pragma mark - DataSource



#pragma mark - Delegates

#pragma mark ______Map Manager

- (void)onGetNetworkState:(int)iError
{
    if (0 != iError && self.mapManager)
    {
        self.mapManager = nil;
    }
}

- (void)onGetPermissionState:(int)iError
{
    if (0 != iError && self.mapManager)
    {
        self.mapManager = nil;
    }
}

#pragma mark - public

- (NSString *)mapKey
{
    return @"F9e4791fab346a40f55c9df793e4cb09";
}

- (BOOL)start
{
    BOOL success = NO;
    
    if (!self.mapManager)
    {
        self.mapManager = [[BMKMapManager alloc] init];
    }
    
    success = [self.mapManager start:[self mapKey] generalDelegate:self];
    
    return success;
}

- (BOOL)stop
{
    BOOL success = YES;
    
    if (self.mapManager)
    {
        success = [self.mapManager stop];
    }
    
    return success;
}

@end
