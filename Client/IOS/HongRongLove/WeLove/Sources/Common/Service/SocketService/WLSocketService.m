//
//  WLSocketService.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-25.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "WLSocketService.h"
#import "AsyncSocket.h"
#import "WLSocketLoginDataModel.h"
#import "WLServerConfigService.h"
#import "WLServerConfigDataModel.h"
#import "WLSocketMsgDataModel.h"

static WLSocketService *instance = nil;

@interface WLSocketService()<AsyncSocketDelegate>

@property(nonatomic, strong) AsyncSocket *socket;
@property(nonatomic, strong) WLSocketQueryUnReadMsgParam *queryUnReadMsgParam; // 为了持续读取消息，需要记录发起的请求参数模型

@end

@implementation WLSocketService

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance)
        {
            instance = [[WLSocketService alloc] init];
        }
    });
    
    return instance;
}

#pragma mark - private



#pragma mark ______doing

- (void)loginCallBackData:(NSData *)data
{
    WLSocketLoginDataModel *dataModel = [[WLSocketLoginDataModel alloc] init];
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    [dataModel parse:dict];
    
    if (dataModel.success)
    {
        //登录成功
    }
    else
    {
        //登录失败
    }
}

- (void)logoutCallBack:(NSData *)data
{
    
}

- (void)sendMsgCallBack:(NSData *)data
{
    
}

- (void)readUnReadMsgCallBack:(NSData *)data
{
    NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"msg = %@", msg);
    //在次读取
    [self startQueryUnReadMsg:self.queryUnReadMsgParam];
}

- (void)queryUnReadMsgCountCallBack:(NSData *)data
{
    
}

#pragma mark ______clicked



#pragma mark ______create



#pragma mark ______notif



#pragma mark - DataSource



#pragma mark - Delegates

#pragma mark ______asyncSocket delegate

- (BOOL)onSocketWillConnect:(AsyncSocket *)sock
{
    return YES;
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    
}

- (void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    
}

- (void)onSocket:(AsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    switch (tag)
    {
        case kSocketProtocol_Operation_Tag_Login:
        {
            //登录
            [self loginCallBackData:data];
            break;
        }
        case kSocketProtocol_Operation_Tag_Logout:
        {
            //登出
            [self logoutCallBack:data];
            break;
        }
        case kSocketProtocol_Operation_Tag_SendMsg:
        {
            //发送消息
            break;
        }
        case kSocketProtocol_Operation_Tag_UnreadMsgCount:
        {
            //未读消息数
            [self queryUnReadMsgCountCallBack:data];
            break;
        }
        case kSocketProtocol_Operation_Tag_UnreadMsg:
        {
            //未读消息
            [self readUnReadMsgCallBack:data];
            break;
        }
        case kSocketProtocol_Operation_Tag_UserLoginState:
        {
            //用户登录状态
            break;
        }
        default:
        {
            break;
        }
    }
}

- (void)onSocket:(AsyncSocket *)sock didWritePartialDataOfLength:(NSUInteger)partialLength tag:(long)tag
{
    
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    switch (tag)
    {
        case kSocketProtocol_Operation_Tag_Login:
        {
            //登录
            [self.socket readDataWithTimeout:-1
                                         tag:tag];
            break;
        }
        case kSocketProtocol_Operation_Tag_Logout:
        {
            //登出
            break;
        }
        case kSocketProtocol_Operation_Tag_SendMsg:
        {
            //发送消息
            break;
        }
        case kSocketProtocol_Operation_Tag_UnreadMsgCount:
        {
            //未读消息数
            break;
        }
        case kSocketProtocol_Operation_Tag_UnreadMsg:
        {
            //未读消息
            [self.socket readDataWithTimeout:-1
                                         tag:tag];
            break;
        }
        case kSocketProtocol_Operation_Tag_UserLoginState:
        {
            //用户登录状态
            break;
        }
        default:
        {
            [self.socket readDataWithTimeout:1
                                         tag:tag];
            break;
        }
    }
}

#pragma mark - public

- (BOOL)start
{
    __block BOOL isSuccess = NO;
    
    if (!self.socket.isConnected)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //获取服务器配置信息
            WLServerConfigDataModel *serverConfigDataModel = [WLServerConfigService getServerConfigDataModel];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!self.socket)
                {
                    self.socket = [[AsyncSocket alloc] initWithDelegate:self];
                }
                
                if (!self.socket.isConnected)
                {
                    NSError *error = nil;
                    
                    isSuccess = [self.socket connectToHost:serverConfigDataModel.server_name
                                                    onPort:serverConfigDataModel.port
                                                     error:&error];
                    
                    if (isSuccess)
                    {
                        isSuccess = [self.socket setRunLoopModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
                    }
                }
                else
                {
                    isSuccess = YES;
                }
            });
        });
    }
    else
    {
        isSuccess = YES;
    }
    
    return isSuccess;
}

- (void)stop
{
    [self.socket disconnectAfterReadingAndWriting];
    self.socket = nil;
}

- (void)login:(WLSocketLoginOperationParam *)param
{
    [self.socket writeData:param.data
               withTimeout:-1
                       tag:kSocketProtocol_Operation_Tag_Login];
}

- (void)sendMsg:(WLSocketSendMsgParam *)param
{
    [self.socket writeData:param.data
               withTimeout:-1
                       tag:kSocketProtocol_Operation_Tag_SendMsg];
}

- (void)startQueryUnReadMsg:(WLSocketQueryUnReadMsgParam *)param
{
    self.queryUnReadMsgParam = param;
    [self.socket writeData:self.queryUnReadMsgParam.data
               withTimeout:-1
                       tag:kSocketProtocol_Operation_Tag_UnreadMsg];
}

@end
