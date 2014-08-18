//
//  WLSocketMsgDataModel.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLSocketMsgDataModel.h"

@implementation WLSocketSendMsgParam

+ (instancetype)sendMsgParam:(NSString *)from_uid
                       toUid:(NSString *)to_uid
                         msg:(NSString *)msg
                     msgType:(NSString *)msg_type
{
    WLSocketSendMsgParam *dataModel = [[WLSocketSendMsgParam alloc] init];
    
    dataModel.from_uid = from_uid;
    dataModel.to_uid = to_uid;
    dataModel.msg = msg;
    dataModel.msg_type = msg_type;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:kSocketProtocol_Operation_SendMsg
             forKey:kSocketProtocol_Operation
       defaultValue:@""];
    [dict setObject:from_uid
             forKey:kSocketProtocol_FromUid
       defaultValue:@""];
    [dict setObject:to_uid
             forKey:kSocketProtocol_ToUid
       defaultValue:@""];
    [dict setObject:msg
             forKey:kSocketProtocol_Msg
       defaultValue:@""];
    [dict setObject:msg_type
             forKey:kSocketProtocol_MsgType
       defaultValue:@""];
    
    dataModel.data = [NSJSONSerialization dataWithJSONObject:dict
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    return dataModel;
}

@end


@implementation WLSocketQueryUnReadMsgParam

+ (instancetype)queryUnReadMsgParam:(NSString *)from_uid
{
    WLSocketQueryUnReadMsgParam *dataModel = [[WLSocketQueryUnReadMsgParam alloc] init];
    
    dataModel.from_uid = from_uid;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:kSocketProtocol_Operation_UnreadMsg
             forKey:kSocketProtocol_Operation
       defaultValue:@""];
    [dict setObject:from_uid
             forKey:kSocketProtocol_FromUid
       defaultValue:@""];
    
    dataModel.data = [NSJSONSerialization dataWithJSONObject:dict
                                                     options:NSJSONWritingPrettyPrinted
                                                       error:NULL];
    
    return dataModel;
}

@end

@implementation WLSocketMsgDataModel

@end
