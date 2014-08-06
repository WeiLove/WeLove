//
//  HRLServerConfigDataModel.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLBaseDataModel.h"

@interface HRLServerConfigDataModel : HRLBaseDataModel

@property(nonatomic, strong) NSString *server_name;
@property(nonatomic, assign) NSInteger port;

@end
