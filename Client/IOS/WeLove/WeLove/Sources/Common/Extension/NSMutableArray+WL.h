//
//  NSMutableArray+WL.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (WL)

/**
 *  @brief 添加一个对象到数组，如果对象为空，添加defaultValue到数组中（nil不插入）
 *
 *  @date 2014-07-01
 *
 *  @param anObject     对象
 *  @param defaultValue 默认值
 *
 *  @return 无
 */
- (void)addObject:(id)anObject defaultValue:(id)defaultValue;

/**
 *  @brief 将一个对象插入到下标为index，如果对象为空，则插入defaultValue（nil不插入）
 *
 *  @date 2014-07-01
 *
 *  @param anObject     对象
 *  @param index        下标
 *  @param defaultValue 默认值
 *
 *  @return 无
 */
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index detaultValue:(id)defaultValue;


@end
