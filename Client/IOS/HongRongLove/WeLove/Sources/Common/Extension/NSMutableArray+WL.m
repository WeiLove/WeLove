//
//  NSMutableArray+WL.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "NSMutableArray+WL.h"

@implementation NSMutableArray (WL)

- (void)addObject:(id)anObject defaultValue:(id)defaultValue
{
    if (anObject)
    {
        [self addObject:anObject];
    }
    else
    {
        if (defaultValue)
        {
            [self addObject:defaultValue];
        }
    }
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index detaultValue:(id)defaultValue
{
    if (self.count >= index)
    {
        if (anObject)
        {
            [self insertObject:anObject atIndex:index];
        }
        else
        {
            if (defaultValue)
            {
                [self insertObject:defaultValue atIndex:index];
            }
        }
    }
}

@end
