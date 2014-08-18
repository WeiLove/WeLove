//
//  WLRPCService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-6.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLRPCService.h"

@implementation WLRPCService

+ (void)asyncRPCBlock:(void (^)(void))block completion:(void (^)(void))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        block();
        dispatch_async(dispatch_get_main_queue(), ^{
            completion();
        });
    });
}

@end
