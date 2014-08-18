//
//  WLUserLoginService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WLUserDataModel;

@interface WLUserLoginService : NSObject

+ (instancetype)shareInstance;

- (void)login;

- (BOOL)isLogin;

- (WLUserDataModel *)userDataModel;

@end
