//
//  NSMutableDictionary+WL.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (WL)

/**
 *  @brief 将对象anObject加入字典，如果对象为空，则加入defaultValue（nil不插入）
 *
 *  @date 2014-07-01
 *
 *  @param anObject     要加入的对象
 *  @param key          键
 *  @param defaultValue 默认值
 *
 *  @return 无
 */
- (void)setObject:(id)anObject forKey:(NSString *)key defaultValue:(id)defaultValue;

/**
 *  @brief 将对象value加入字典，如果对象为空，则加入defaultValue
 *
 *  @date 2014-07-01
 *
 *  @param value        要加入的对象
 *  @param key          键
 *  @param defaultValue 默认值
 *
 *  @return 无
 */
- (void)setValue:(id)value forKey:(NSString *)key defaultValue:(id)defaultValue;


@end
