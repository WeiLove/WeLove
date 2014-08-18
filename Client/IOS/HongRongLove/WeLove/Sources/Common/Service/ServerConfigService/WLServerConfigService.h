//
//  WLServerConfigService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WLServerConfigDataModel;

@interface WLServerConfigService : NSObject

/**
 *  @brief 同步获取服务器配置信息
 *
 *  @date 2014-07-25
 *
 *  @return 返回服务器配置信息
 */
+ (WLServerConfigDataModel *)getServerConfigDataModel;

@end
