//
//  NSString+WL.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WL)

+ (BOOL)stringIsNullOrEmpty:(NSString *)str;

- (NSString *)encodeStr;

- (NSString *)decodeStr;

// 去除尾部space, /n, /t
- (NSString*)trim;

// 解出汉字
- (NSString*)decodeUnicode;

@end
