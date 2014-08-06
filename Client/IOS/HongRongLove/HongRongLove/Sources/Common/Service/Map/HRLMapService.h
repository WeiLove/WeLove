//
//  HRLMapService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-18.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRLMapService : NSObject

+ (instancetype)shareInstance;

- (NSString *)mapKey;

- (BOOL)start;

- (BOOL)stop;

@end
