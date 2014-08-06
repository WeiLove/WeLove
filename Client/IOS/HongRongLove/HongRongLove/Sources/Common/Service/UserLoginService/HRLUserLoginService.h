//
//  HRLUserLoginService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HRLUserDataModel;

@interface HRLUserLoginService : NSObject

+ (instancetype)shareInstance;

- (void)login;

- (BOOL)isLogin;

- (HRLUserDataModel *)userDataModel;

@end
