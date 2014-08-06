//
//  HRLUserDefaultService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-31.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLUserDefaultService.h"

static HRLUserDefaultService *instance = nil;

@interface HRLUserDefaultService()

@property(nonatomic, strong) NSUserDefaults *userDefault;

@end

@implementation HRLUserDefaultService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[HRLUserDefaultService alloc] init];
        }
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.userDefault = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

- (void)storeValue:(NSString *)value forKey:(NSString *)key
{
    if (value && key)
    {
        [self.userDefault setObject:value forKey:key];
        [self.userDefault synchronize];
    }
}

- (NSString *)valueForKey:(NSString *)key
{
    NSString *value = nil;
    
    if (key)
    {
        value = [[self userDefault] stringForKey:key];
    }
    
    return value;
}

@end
