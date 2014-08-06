//
//  HRLLoginViewController.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLBaseViewController.h"

@class HRLUserDataModel;

typedef void (^LoginSuccessBlock)(HRLUserDataModel *userDataModel, BOOL isLogin);

@interface HRLLoginViewController : HRLBaseViewController

- (void)attachLoginSuccessBlock:(LoginSuccessBlock)loginSuccessBlock;

@end
