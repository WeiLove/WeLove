//
//  WLSocketLoginDataModel.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLSocketLoginDataModel.h"

@implementation WLSocketLoginOperationParam

+ (instancetype)loginOperationParam:(NSString *)uid password:(NSString *)password
{
    WLSocketLoginOperationParam *dataModel = [[WLSocketLoginOperationParam alloc] init];
    
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

@implementation WLSocketLoginDataModel

@end
