//
//  WLLocationService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-18.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLNotificationDefine.h"

@class CLLocation;

//notif: kNotification_LocationService_Update
@interface WLLocationService : NSObject

+ (instancetype)shareInstance;

+ (BOOL)isLocationEnabled;

- (void)startUpdatingLocation;

- (CLLocation *)location;

@end
