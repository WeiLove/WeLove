//
//  NSMutableDictionary+WL.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "NSMutableDictionary+WL.h"

@implementation NSMutableDictionary (WL)

- (void)setObject:(id)anObject forKey:(NSString *)key defaultValue:(id)defaultValue
{
    if (key != nil && key.length > 0)
    {
        if (anObject)
        {
            [self setObject:anObject forKey:key];
        }
        else
        {
            if (defaultValue)
            {
                [self setObject:defaultValue forKey:key];
            }
        }
    }
}

- (void)setValue:(id)value forKey:(NSString *)key defaultValue:(id)defaultValue
{
    if (key != nil && key.length > 0)
    {
        if (value)
        {
            [self setValue:value forKey:key];
        }
        else
        {
            if (defaultValue)
            {
                [self setValue:defaultValue forKey:key];
            }
        }
    }
}

@end
