//
//  WLSocketMsgDataModel.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLBaseDataModel.h"

@interface WLSocketSendMsgParam : NSObject

@property(nonatomic, strong) NSString *from_uid;
@property(nonatomic, strong) NSString *to_uid;
@property(nonatomic, strong) NSString *msg;
@property(nonatomic, assign) NSString *msg_type;
@property(nonatomic, strong) NSData *data;

+ (instancetype)sendMsgParam:(NSString *)from_uid
                       toUid:(NSString *)to_uid
                         msg:(NSString *)msg
                     msgType:(NSString *)msg_type;

@end

@interface WLSocketQueryUnReadMsgParam : NSObject

@property(nonatomic, strong) NSString *from_uid;
@property(nonatomic, strong) NSData *data;

+ (instancetype)queryUnReadMsgParam:(NSString *)from_uid;

@end

@interface WLSocketMsgDataModel : WLBaseDataModel

@end
