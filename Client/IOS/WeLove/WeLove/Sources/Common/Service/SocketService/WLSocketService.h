//
//  WLSocketService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WLSocketLoginOperationParam;
@class WLSocketSendMsgParam;
@class WLSocketQueryUnReadMsgParam;

@interface WLSocketService : NSObject

+ (instancetype)shareInstance;

- (BOOL)start;

- (void)stop;

- (void)login:(WLSocketLoginOperationParam *)param;

- (void)sendMsg:(WLSocketSendMsgParam *)param;

- (void)startQueryUnReadMsg:(WLSocketQueryUnReadMsgParam *)param;

@end
