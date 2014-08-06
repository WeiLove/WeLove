//
//  HRLUserLoginService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLUserLoginService.h"
#import "HRLUserDataModel.h"
#import "HRLLoginViewController.h"

static HRLUserLoginService *instance = nil;

@interface HRLUserLoginService()

@property(nonatomic, strong) HRLUserDataModel *userDataModel;
@property(nonatomic, assign) BOOL isLogin;

@end

@implementation HRLUserLoginService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[HRLUserLoginService alloc] init];
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
        
        HRLLoginViewController *vc = [[HRLLoginViewController alloc] init];
        
        [vc attachLoginSuccessBlock:^(HRLUserDataModel *userDataModel, BOOL isLogin) {
            weakSelf.userDataModel = userDataModel;
            weakSelf.isLogin = isLogin;
        }];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc
                                                                                     animated:YES
                                                                                   completion:NULL];
    }
}

- (HRLUserDataModel *)userDataModel
{
    return _userDataModel;
}

@end
