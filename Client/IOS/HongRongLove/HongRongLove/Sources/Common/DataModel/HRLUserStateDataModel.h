//
//  HRLUserStateDataModel.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-22.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLBaseDataModel.h"

@interface HRLUserStateDataModel : HRLBaseDataModel

@property(nonatomic, strong) NSString *sid; // 状态id
@property(nonatomic, strong) NSString *uid; // 用户id
@property(nonatomic, strong) NSString *user_state; // 状态
@property(nonatomic, strong) NSString *create_date; // 创建日期
@property(nonatomic, strong) NSString *read_date; // 读取日期
@property(nonatomic, assign) BOOL has_read; // 是否已读
@property(nonatomic, strong) NSString *extColumn1; // 扩展字段1，如果是wifi，则返回图片url
@property(nonatomic, strong) NSString *extColumn2; // 扩展字段2
@property(nonatomic, strong) NSString *extColumn3; // 扩展字段3

@end
