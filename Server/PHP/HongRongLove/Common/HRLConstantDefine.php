<?php

/**
 * *****************************************************************************
 */
/* 数据库 */
/**
 * *****************************************************************************
 */
// 声明远程数据库信息
define ( 'DB_SERVER_NAME', '103.27.208.222' );
define ( 'DB_NAME', 'db56233' );
define ( 'DB_USER_NAME', 'db56233' );
define ( 'DB_USER_PASSWORD', 'CWHcwh123' );

// 用户状态表
define ( 'TABLE_USER_STATE', 'user_state' ); // 用户状态表
define ( 'TABLE_USER_STATE_UID', 'uid' ); // 用户id
define ( 'TABLE_USER_STATE_SID', 'sid' ); // 状态id
define ( 'TABLE_USER_STATE_USER_STATE', 'user_state' ); // 状态
define ( 'TABLE_USER_STATE_CREATE_DATE', 'create_date' ); // 创建时间
define ( 'TABLE_USER_STATE_READ_DATE', 'read_date' ); // 读取时间
define ( 'TABLE_USER_STATE_HAS_READ', 'has_read' ); // 是否已读
                                                    
// 用户表
define ( 'TABLE_USER', 'user' ); // 用户表
define ( 'TABLE_USER_UID', 'uid' ); // 用户id
                                    
// 用户消息表
define ( 'TABLE_USER_MSG', 'user_msg' );
define ( 'TABLE_USER_MSG_MID', 'mid' ); // 消息id
define ( 'TABLE_USER_MSG_UID', 'uid' ); // 用户id
define ( 'TABLE_USER_PASSWORD', 'user_password' ); // 用户密码
define ( 'TABLE_USER_MSG_HAS_READ', 'has_read' ); // 是否已读
                                                  
// 服务器配置表
define ( 'TABLE_SERVER_CONFIG', 'msg_server_config' );
define ( 'TABLE_SERVER_CONFIG_SERVER_NAME', 'server_name' );
define ( 'TABLE_SERVER_CONFIG_PORT', 'port' );

/**
 * *****************************************************************************
 */
/* Socket */
/**
 * *****************************************************************************
 */
define ( 'SOCKET_HOST', '127.0.0.1' );
define ( 'SOCKET_PORT', '9537' );

// socket 协议
define ( 'SOCKET_PROTOCOL_FROM_USER_ID', 'from_uid' ); // 用户id
define ( 'SOCKET_PROTOCOL_USER_PASSWORD', 'password' ); // 用户密码
define ( 'SOCKET_PROTOCOL_TO_USER_ID', 'to_uid' ); // 用户id
                                                   
// 接收消息格式
define ( 'SOCKET_PROTOCOL_OPERATION', 'operation' ); // 操作类型
                                                     
// 以下是操作类型
define ( 'SOCKET_PROTOCOL_LOGIN', 'op_login' ); // 登陆
define ( 'SOCKET_PROTOCOL_LOGOUT', 'op_logout' ); // 登出
define ( 'SOCKET_PROTOCOL_SEND_MSG', 'op_send_msg' ); // 发送消息
define ( 'SOCKET_PROTOCOL_QUERY_UNREAD_MSG_COUNT', 'op_unread_msg_count' ); // 未读消息数
define ( 'SOCKET_PROTOCOL_QUERY_UNREAD_MSG', 'op_unread_msg' ); // 未读消息
define ( 'SOCKET_PROTOCOL_QUERY_USER_LOGIN_STATE', 'op_user_login_state' ); // 用户状态（上线、离线等）
                                                                            
// 错误码
define ( 'SOCKET_PROTOCOL_CODE_LOGIN_SUCCESS', '200' ); // 登陆成功
define ( 'SOCKET_PROTOCOL_CODE_LOGIN_FAIL_UID_NOT_FOUND', '201' ); // 登陆失败，用户不存在
define ( 'SOCKET_PROTOCOL_CODE_LOGIN_FAIL_PASSWORD_ERROR', '202' ); // 登陆失败，用户密码错误
define ( 'SOCKET_PROTOCOL_CODE_SEND_SUCCESS', '300' ); // 发送成功
define ( 'SOCKET_PROTOCOL_CODE_SEND_FAIL_UID_NOT_FOUND', '301' ); // 发送失败，对方不存在
define ( 'SOCKET_PROTOCOL_CODE_SEND_FAIL_USER_NOT_RESPONSE', '302' ); // 发送失败，对方不接收你的消息

/**
 * *****************************************************************************
 */
/* HTTP请求状态 */
/**
 * *****************************************************************************
 */
define ( 'JSON_DATA', 'data' ); // json返回的数据体
define ( 'ERROR_CODE', 'errorCode' ); // 错误码
define ( 'ERROR_MSG', 'errorMsg' ); // 错误信息
                                    
// success
define ( 'ERROR_CODE_SUCCESS', '200' ); // 请求成功
define ( 'ERROR_MSG_SUCCESS', '' );
define ( 'ERROR_CODE_SUCCESS_CACHE', '201' ); // 请求成功，但客户端有缓存
define ( 'ERROR_MSG_SUCCESS_CACHE', 'CACHE' );

// error
define ( 'ERROR_CODE_REQUEST_PARAM_ERROR', '400' ); // 请求参数错误
define ( 'ERROR_MSG_REQUEST_PARAM_ERROR', '请求参数错误' );
define ( 'ERROR_CODE_REQUEST_UID_NOT_FOUND', '401' ); // uid不存在
define ( 'ERROR_MSG_REQUEST_UID_NOT_FOUND', 'uid不存在' );
define ( 'ERROR_CODE_REQUEST_LOGIN_ERROR', '402' ); // 登陆错误
define ( 'ERROR_MSG_REQUEST_LOGIN_ERROR', '账号或密码出错' );
define ( 'ERROR_CODE_REQUEST_SERVER_CONFIG_ERROR', '410' ); // 服务端配置错误
define ( 'ERROR_MSG_REQUEST_SERVER_CONFIG_ERROR', '服务端配置错误' );
define ( 'ERROR_CODE_NO_RESULT', '510' ); // 没有结果
define ( 'ERROR_MSG_NO_RESULT', '没有结果' );
/**
 * *****************************************************************************
 */
/* 请求参数定义 */
/**
 * *****************************************************************************
 */
define ( 'REQUEST_UID', 'uid' ); // 请求的用户id
define ( 'REQUEST_USER_PASSWORD', 'user_password' ); // 请求的用户密码
define ( 'REQUEST_USER_STATE', 'user_state' ); // 请求的用户状态
?>