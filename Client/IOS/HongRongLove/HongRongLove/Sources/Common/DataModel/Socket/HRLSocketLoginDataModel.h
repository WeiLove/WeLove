//
//  HRLSocketLoginDataModel.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HRLBaseDataModel.h"

@interface HRLSocketLoginOperationParam : NSObject

@property(nonatomic, strong) NSString *uid;
@property(nonatomic, strong) NSString *password;
@property(nonatomic, strong) NSData *data;

+ (instancetype)loginOperationParam:(NSString *)uid password:(NSString *)password;

@end

@interface HRLSocketLoginDataModel : HRLBaseDataModel

@end
