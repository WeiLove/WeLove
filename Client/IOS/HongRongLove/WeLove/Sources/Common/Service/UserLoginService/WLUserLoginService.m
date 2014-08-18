//
//  WLUserLoginService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLUserLoginService.h"
#import "WLUserDataModel.h"
#import "WLLoginViewController.h"

static WLUserLoginService *instance = nil;

@interface WLUserLoginService()

@property(nonatomic, strong) WLUserDataModel *userDataModel;
@property(nonatomic, assign) BOOL isLogin;

@end

@implementation WLUserLoginService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[WLUserLoginService alloc] init];
        }
    });
    
    return instance;
}

- (BOOL)isLogin
{
    return _isLogin;
}

- (void)login
{
    if (!self.isLogin)
    {
        __weak typeof(self) weakSelf = self;
        
        WLLoginViewController *vc = [[WLLoginViewController alloc] init];
        
        [vc attachLoginSuccessBlock:^(WLUserDataModel *userDataModel, BOOL isLogin) {
            weakSelf.userDataModel = userDataModel;
            weakSelf.isLogin = isLogin;
        }];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc
                                                                                     animated:YES
                                                                                   completion:NULL];
    }
}

- (WLUserDataModel *)userDataModel
{
    return _userDataModel;
}

@end
