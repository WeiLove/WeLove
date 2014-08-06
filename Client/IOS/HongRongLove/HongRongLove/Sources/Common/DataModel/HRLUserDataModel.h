//
//  HRLUserDataModel.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-30.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLBaseDataModel.h"

@interface HRLUserDataModel : HRLBaseDataModel

@property(nonatomic, strong) NSString *uid;
@property(nonatomic, strong) NSString *user_password;
@property(nonatomic, strong) NSString *user_name;
@property(nonatomic, strong) NSString *user_sex;
@property(nonatomic, strong) NSString *user_role;

@end
