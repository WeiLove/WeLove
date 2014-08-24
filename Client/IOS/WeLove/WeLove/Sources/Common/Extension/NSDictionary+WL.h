//
//  NSDictionary+WL.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	NSStringOperationTypeTrim = 0,          // 去空
	NSStringOperationTypeDecodeUnicode, // 解汉字
	NSStringOperationTypeNone,          // 无需额外操作
} NSStringOperationType;

@interface NSDictionary (WL)

// 从 NSDictionary 中获取 key 对应的 字典型value; 若无，则返回 defaultValue
- (NSDictionary*)dictionaryValueForKey:(NSString*)key defaultValue:(NSDictionary*)defaultValue;

// 从 NSDictionary 中获取 key 对应的 数组型value; 若无，则返回 defaultValue
- (NSArray*)arrayValueForKey:(NSString*)key defaultValue:(NSArray*)defaultValue;

// 从 NSDictionary 中获取 key 对应的 NSString型value, 并进行特殊处理; 若无，则返回 defaultValue
- (NSString*)stringValueForKey:(NSString*)key defaultValue:(NSString*)defaultValue operation:(NSStringOperationType)type;

- (NSDate*)dateValueForKey:(NSString*)key
              defaultValue:(NSDate*)defaultValue;
- (NSString*)dateStringForKey:(NSString*)key
                 defaultValue:(NSString*)defaultValue
                 formatString:(NSString*)formatString;//yyyy.MM.dd yyyy-MM-dd

// 从 NSDictionary 中获取 key 对应的 int 型value; 若无，则返回 defaultValue
- (int)intValueForKey:(NSString*)key defaultValue:(int)defaultValue;

- (int)intValueForKey:(NSString*)key defaultValue:(int)defaultValue minValue:(int)minValue;

// 从 NSDictionary 中获取 key 对应的 uint64_t 型value; 若无，则返回 defaultValue
- (uint64_t)longLongValueForKey:(NSString*)key defaultValue:(uint64_t)defaultValue;

- (uint64_t)longLongValueForKey:(NSString*)key defaultValue:(uint64_t)defaultValue minValue:(uint64_t)minValue;

// 从 NSDictionary 中获取 key 对应的 double 型value; 若无，则返回 defaultValue
- (double)doubleValueForKey:(NSString*)key defaultValue:(double)defaultValue;

- (double)doubleValueForKey:(NSString*)key defaultValue:(double)defaultValue minValue:(double)minValue;

// 从 NSDictionary 中获取 key 对应的 float 型value; 若无，则返回 defaultValue
- (float)floatValueForKey:(NSString*)key defaultValue:(float)defaultValue;

- (float)floatValueForKey:(NSString*)key defaultValue:(float)defaultValue minValue:(float)minValue;

// 从 NSDictionary 中获取 key 对应的 bool 型value; 若无，则返回 defaultValue
- (BOOL)boolValueForKey:(NSString*)key defaultValue:(BOOL)defaultValue;

// 从 NSDictionary 中获取 key 对应的value; 若无，则返回 defaultValue
- (id)objectForKey:(id)key defaultValue:(id)defaultValue;


@end
