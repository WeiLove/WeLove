//
//  HRLSocketLoginDataModel.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLSocketLoginDataModel.h"

@implementation HRLSocketLoginOperationParam

+ (instancetype)loginOperationParam:(NSString *)uid password:(NSString *)password
{
    HRLSocketLoginOperationParam *dataModel = [[HRLSocketLoginOperationParam alloc] init];
    
    dataModel.uid = uid;
    dataModel.password = password;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:kSocketProtocol_Operation_Login forKey:kSocketProtocol_Operation defaultValue:@""];
    [dict setObject:uid forKey:kSocketProtocol_FromUid defaultValue:@""];
    [dict setObject:password forKey:kSocketProtocol_Password defaultValue:@""];
    
    dataModel.data = [NSJSONSerialization dataWithJSONObject:dict
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    return dataModel;
}

@end

@implementation HRLSocketLoginDataModel

@end
