//
//  NSArray+WL.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WL)

/**
 *  @brief 返回下标是index的对象，如果index不合法，则返回defaultValue
 *
 *  @date 2014-07-01
 *
 *  @param index        下标
 *  @param defaultValue 默认值
 *
 *  @return 返回对象
 */
- (id)objectAtIndex:(NSUInteger)index defaultValue:(id)defaultValue;

@end
