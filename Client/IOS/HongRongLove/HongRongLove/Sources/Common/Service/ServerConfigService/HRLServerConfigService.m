//
//  HRLServerConfigService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLServerConfigService.h"
#import "HRLRPCRequest.h"
#import "HRLRPCService.h"
#import "HRLUtil.h"
#import "HRLRPCRequestDefine.h"
#import "HRLServerConfigDataModel.h"

@implementation HRLServerConfigService

+ (HRLServerConfigDataModel *)getServerConfigDataModel
{
    HRLServerConfigDataModel *serverConfigDataModel = nil;
    HRLRPCRequest *request = [[HRLRPCRequest alloc] init];
    
    request.url = [HRLUtil url:kRPCRequestUrl_GetServerConfig params:nil];
    request.parseCls = [HRLServerConfigDataModel class];
    serverConfigDataModel = [request startRequest];
    
    return serverConfigDataModel;
}

@end
