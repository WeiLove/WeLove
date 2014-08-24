//
//  WLServerConfigService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLServerConfigService.h"
#import "WLRPCRequest.h"
#import "WLRPCService.h"
#import "WLUtil.h"
#import "WLRPCRequestDefine.h"
#import "WLServerConfigDataModel.h"

@implementation WLServerConfigService

+ (WLServerConfigDataModel *)getServerConfigDataModel
{
    WLServerConfigDataModel *serverConfigDataModel = nil;
    WLRPCRequest *request = [[WLRPCRequest alloc] init];
    
    request.url = [WLUtil url:kRPCRequestUrl_GetServerConfig params:nil];
    request.parseCls = [WLServerConfigDataModel class];
    serverConfigDataModel = [request startRequest];
    
    return serverConfigDataModel;
}

@end
