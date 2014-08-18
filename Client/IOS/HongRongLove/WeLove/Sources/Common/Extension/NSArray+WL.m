//
//  NSArray+WL.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "NSArray+WL.h"

@implementation NSArray (WL)

- (id)objectAtIndex:(NSUInteger)index defaultValue:(id)defaultValue
{
    if (self.count > index)
    {
        return [self objectAtIndex:(int)index];
    }
    
    return defaultValue;
}

@end
