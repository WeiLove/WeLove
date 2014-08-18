//
//  WLNetWorkService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-22.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLNetWorkService : NSObject

@property(nonatomic, assign) BOOL isReachable;
@property(nonatomic, assign) BOOL isWifi;
@property(nonatomic, assign) BOOL is3G;

+ (instancetype)shareInstance;

@end
