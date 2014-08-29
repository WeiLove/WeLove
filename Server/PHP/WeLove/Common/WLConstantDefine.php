<?php

/**
 * *****************************************************************************
 */
/* 数据库 */
/**
 * *****************************************************************************
 */
// 通用字段定义
define ( 'TABLE_COLUMN_CREATE_TIME', 'create_time' );
define ( 'TABLE_COLUMN_MODIFY_TIME', 'modify_time' );
define ( 'TABLE_SERVER_CREATE_IP', 'create_ip' );
define ( 'TABLE_COLUMN_REMOTE_IP', 'remote_ip' );
define ( 'TABLE_SERVER_COLUMN_STATE_ID', 'state_id' );

// 扩展字段定义
define ( 'TABLE_COLUMN_EXT_TEXT1', 'extColumn1' );
define ( 'TABLE_COLUMN_EXT_TEXT2', 'extColumn2' );
define ( 'TABLE_COLUMN_EXT_TEXT3', 'extColumn3' );
define ( 'TABLE_COLUMN_EXT_TEXT4', 'extColumn4' );
define ( 'TABLE_COLUMN_EXT_TEXT5', 'extColumn5' );
define ( 'TABLE_COLUMN_EXT_TEXT6', 'extColumn6' );
define ( 'TABLE_COLUMN_EXT_TEXT7', 'extColumn7' );
define ( 'TABLE_COLUMN_EXT_TEXT8', 'extColumn8' );
define ( 'TABLE_COLUMN_EXT_TEXT9', 'extColumn9' );
define ( 'TABLE_COLUMN_EXT_TEXT10', 'extColumn10' );
define ( 'TABLE_COLUMN_EXT_TEXT11', 'extColumn11' );
define ( 'TABLE_COLUMN_EXT_TEXT12', 'extColumn12' );
define ( 'TABLE_COLUMN_EXT_TEXT13', 'extColumn13' );
define ( 'TABLE_COLUMN_EXT_TEXT14', 'extColumn14' );
define ( 'TABLE_COLUMN_EXT_TEXT15', 'extColumn15' );
define ( 'TABLE_COLUMN_EXT_TEXT16', 'extColumn16' );
define ( 'TABLE_COLUMN_EXT_TEXT17', 'extColumn17' );
define ( 'TABLE_COLUMN_EXT_TEXT18', 'extColumn18' );
define ( 'TABLE_COLUMN_EXT_TEXT19', 'extColumn19' );
define ( 'TABLE_COLUMN_EXT_TEXT20', 'extColumn20' );
define ( 'TABLE_COLUMN_EXT_BLOB21', 'extColumn21' );
define ( 'TABLE_COLUMN_EXT_BLOB22', 'extColumn22' );
define ( 'TABLE_COLUMN_EXT_BLOB23', 'extColumn23' );
define ( 'TABLE_COLUMN_EXT_BLOB24', 'extColumn24' );
define ( 'TABLE_COLUMN_EXT_BLOB25', 'extColumn25' );

// 声明远程数据库信息
// define ( 'DB_SERVER_NAME', '103.27.208.222' );
// define ( 'DB_NAME', 'db56233' );
// define ( 'DB_USER_NAME', 'db56233' );
// define ( 'DB_USER_PASSWORD', 'CWHcwh123' );
define ( 'DB_SERVER_NAME', '127.0.0.1' );
define ( 'DB_NAME', 'db56233' );
define ( 'DB_USER_NAME', 'root' );
define ( 'DB_USER_PASSWORD', 'root' );

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
define ( 'TABLE_SERVER', 'server' );
define ( 'TABLE_SERVER_SERVER_NAME', 'server_name' );
define ( 'TABLE_SERVER_PORT', 'port' );
define ( 'TABLE_SERVER_DB_SERVER_IP', 'db_server_ip' );
define ( 'TABLE_SERVER_DB_NAME', 'db_name' );
define ( 'TABLE_SERVER_DB_USER_NAME', 'db_user_name' );
define ( 'TABLE_SERVER_DB_USER_PASSWORD', 'db_user_password' );

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