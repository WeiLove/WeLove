//
//  HRLUserDefaultService.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-31.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HRLUserDefaultDefine.h"

@interface HRLUserDefaultService : NSObject

+ (instancetype)shareInstance;

- (void)storeValue:(NSString *)value forKey:(NSString *)key;

- (NSString *)valueForKey:(NSString *)key;

@end
