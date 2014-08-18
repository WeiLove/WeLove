//
//  WLLoginViewController.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLBaseViewController.h"

@class WLUserDataModel;

typedef void (^LoginSuccessBlock)(WLUserDataModel *userDataModel, BOOL isLogin);

@interface WLLoginViewController : WLBaseViewController

- (void)attachLoginSuccessBlock:(LoginSuccessBlock)loginSuccessBlock;

@end
