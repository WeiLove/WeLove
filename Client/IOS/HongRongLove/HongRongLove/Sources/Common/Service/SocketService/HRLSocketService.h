//
//  HRLSocketService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HRLSocketLoginOperationParam;
@class HRLSocketSendMsgParam;
@class HRLSocketQueryUnReadMsgParam;

@interface HRLSocketService : NSObject

+ (instancetype)shareInstance;

- (BOOL)start;

- (void)stop;

- (void)login:(HRLSocketLoginOperationParam *)param;

- (void)sendMsg:(HRLSocketSendMsgParam *)param;

- (void)startQueryUnReadMsg:(HRLSocketQueryUnReadMsgParam *)param;

@end
