//
//  HRLSocketProtocolDefine.h
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

//host port
#define kSocket_Host                                @"127.0.0.1"
#define kSocket_Port                                9537

//通信协议

//操作
#define kSocketProtocol_Operation                       @"operation"

#define kSocketProtocol_Operation_Login                 @"op_login"
#define kSocketProtocol_Operation_Tag_Login             10000
#define kSocketProtocol_Operation_Logout                @"op_logout"
#define kSocketProtocol_Operation_Tag_Logout            10001
#define kSocketProtocol_Operation_SendMsg               @"op_send_msg"
#define kSocketProtocol_Operation_Tag_SendMsg           10002
#define kSocketProtocol_Operation_UnreadMsgCount        @"op_unread_msg_count"
#define kSocketProtocol_Operation_Tag_UnreadMsgCount    10003
#define kSocketProtocol_Operation_UnreadMsg             @"op_unread_msg"
#define kSocketProtocol_Operation_Tag_UnreadMsg         10004
#define kSocketProtocol_Operation_UserLoginState        @"op_user_login_state"
#define kSocketProtocol_Operation_Tag_UserLoginState    10005


//消息格式{operation:xx, key:value, ...}
#define kSocketProtocol_Msg_Operation               @"operation"

#define kSocketProtocol_FromUid                     @"from_uid"
#define kSocketProtocol_Password                    @"password"
#define kSocketProtocol_ToUid                       @"to_uid"
#define kSocketProtocol_Msg                         @"msg"
#define kSocketProtocol_MsgType                     @"msg_type"

//消息类型
#define kSocketProtocol_MsgType_Text                @"text"
#define kSocketProtocol_MsgType_Image               @"image"
#define kSocketProtocol_MsgType_Url                 @"url"

