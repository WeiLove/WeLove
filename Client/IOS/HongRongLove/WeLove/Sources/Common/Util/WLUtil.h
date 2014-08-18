//
//  WLUtil.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-20.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLUtil : NSObject

/**
 *  @brief 拨打电话
 *
 *  @date 2014-05-26
 *
 *  @param phoneUrl 打电话的url
 *
 *  @param containerView 添加打电话请求的webView的容器view
 *
 *  @return 无
 */
+ (void)callPhoneWithPhoneNumberStr:(NSString *)phoneNumberStr withContainerView:(UIView *)containerView;

/**
 *  @brief 与当前时间距离的时间差
 *
 *  @date 2014-07-22
 *
 *  @param compareDate 要比较的时间
 *
 *  @return 返回时间差
 */
+ (NSString *)compareCurrentTime:(NSDate*)compareDate;

/**
 *  @brief 返回url，拼接参数
 *
 *  @date 2014-07-25
 *
 *  @param baseUrl url
 *  @param params  参数dict
 *
 *  @return 返回拼接后的url
 */
+ (NSString *)url:(NSString *)baseUrl params:(NSDictionary *)params;

@end
