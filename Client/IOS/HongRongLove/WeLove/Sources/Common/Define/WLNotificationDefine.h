//
//  WLNotificationDefine.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-18.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

//消息定义

/**
 * 定位服务：定位更新消息
 * object：字典类型；(success:NSNumber（的布尔值）,newLocation:CLLocation,oldLocation:CLLocation)
 */
#define kNotification_LocationService_Update                    @"kNotification_LocationService_Update"
    #define kNotification_LocationService_UpdateKey_Success         @"success"
    #define kNotification_LocationService_UpdateKey_NewLocation     @"newLocation"
    #define kNotification_LocationService_UpdateKey_OldLocation     @"oldLocation"

