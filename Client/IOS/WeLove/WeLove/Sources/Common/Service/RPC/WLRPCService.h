//
//  WLRPCService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-6.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLRPCRequest.h"

#define RPCBlock        void (^)(void)

//只负责运行rpc block
@interface WLRPCService : NSObject

+ (void)asyncRPCBlock:(RPCBlock)block completion:(RPCBlock)completion;

@end
