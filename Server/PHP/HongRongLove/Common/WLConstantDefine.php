<?php

/**
 * *****************************************************************************
 */
/* ���ݿ� */
/**
 * *****************************************************************************
 */
// ����Զ�����ݿ���Ϣ
define ( 'DB_SERVER_NAME', '103.27.208.222' );
define ( 'DB_NAME', 'db56233' );
define ( 'DB_USER_NAME', 'db56233' );
define ( 'DB_USER_PASSWORD', 'CWHcwh123' );

// �û�״̬��
define ( 'TABLE_USER_STATE', 'user_state' ); // �û�״̬��
define ( 'TABLE_USER_STATE_UID', 'uid' ); // �û�id
define ( 'TABLE_USER_STATE_SID', 'sid' ); // ״̬id
define ( 'TABLE_USER_STATE_USER_STATE', 'user_state' ); // ״̬
define ( 'TABLE_USER_STATE_CREATE_DATE', 'create_date' ); // ����ʱ��
define ( 'TABLE_USER_STATE_READ_DATE', 'read_date' ); // ��ȡʱ��
define ( 'TABLE_USER_STATE_HAS_READ', 'has_read' ); // �Ƿ��Ѷ�
                                                    
// �û���
define ( 'TABLE_USER', 'user' ); // �û���
define ( 'TABLE_USER_UID', 'uid' ); // �û�id
                                    
// �û���Ϣ��
define ( 'TABLE_USER_MSG', 'user_msg' );
define ( 'TABLE_USER_MSG_MID', 'mid' ); // ��Ϣid
define ( 'TABLE_USER_MSG_UID', 'uid' ); // �û�id
define ( 'TABLE_USER_PASSWORD', 'user_password' ); // �û�����
define ( 'TABLE_USER_MSG_HAS_READ', 'has_read' ); // �Ƿ��Ѷ�
                                                  
// ���������ñ�
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

// socket Э��
define ( 'SOCKET_PROTOCOL_FROM_USER_ID', 'from_uid' ); // �û�id
define ( 'SOCKET_PROTOCOL_USER_PASSWORD', 'password' ); // �û�����
define ( 'SOCKET_PROTOCOL_TO_USER_ID', 'to_uid' ); // �û�id
                                                   
// ������Ϣ��ʽ
define ( 'SOCKET_PROTOCOL_OPERATION', 'operation' ); // ��������
                                                     
// �����ǲ�������
define ( 'SOCKET_PROTOCOL_LOGIN', 'op_login' ); // ��½
define ( 'SOCKET_PROTOCOL_LOGOUT', 'op_logout' ); // �ǳ�
define ( 'SOCKET_PROTOCOL_SEND_MSG', 'op_send_msg' ); // ������Ϣ
define ( 'SOCKET_PROTOCOL_QUERY_UNREAD_MSG_COUNT', 'op_unread_msg_count' ); // δ����Ϣ��
define ( 'SOCKET_PROTOCOL_QUERY_UNREAD_MSG', 'op_unread_msg' ); // δ����Ϣ
define ( 'SOCKET_PROTOCOL_QUERY_USER_LOGIN_STATE', 'op_user_login_state' ); // �û�״̬�����ߡ����ߵȣ�
                                                                            
// ������
define ( 'SOCKET_PROTOCOL_CODE_LOGIN_SUCCESS', '200' ); // ��½�ɹ�
define ( 'SOCKET_PROTOCOL_CODE_LOGIN_FAIL_UID_NOT_FOUND', '201' ); // ��½ʧ�ܣ��û�������
define ( 'SOCKET_PROTOCOL_CODE_LOGIN_FAIL_PASSWORD_ERROR', '202' ); // ��½ʧ�ܣ��û��������
define ( 'SOCKET_PROTOCOL_CODE_SEND_SUCCESS', '300' ); // ���ͳɹ�
define ( 'SOCKET_PROTOCOL_CODE_SEND_FAIL_UID_NOT_FOUND', '301' ); // ����ʧ�ܣ��Է�������
define ( 'SOCKET_PROTOCOL_CODE_SEND_FAIL_USER_NOT_RESPONSE', '302' ); // ����ʧ�ܣ��Է������������Ϣ

/**
 * *****************************************************************************
 */
/* HTTP����״̬ */
/**
 * *****************************************************************************
 */
define ( 'JSON_DATA', 'data' ); // json���ص�������
define ( 'ERROR_CODE', 'errorCode' ); // ������
define ( 'ERROR_MSG', 'errorMsg' ); // ������Ϣ
                                    
// success
define ( 'ERROR_CODE_SUCCESS', '200' ); // ����ɹ�
define ( 'ERROR_MSG_SUCCESS', '' );
define ( 'ERROR_CODE_SUCCESS_CACHE', '201' ); // ����ɹ������ͻ����л���
define ( 'ERROR_MSG_SUCCESS_CACHE', 'CACHE' );

// error
define ( 'ERROR_CODE_REQUEST_PARAM_ERROR', '400' ); // �����������
define ( 'ERROR_MSG_REQUEST_PARAM_ERROR', '�����������' );
define ( 'ERROR_CODE_REQUEST_UID_NOT_FOUND', '401' ); // uid������
define ( 'ERROR_MSG_REQUEST_UID_NOT_FOUND', 'uid������' );
define ( 'ERROR_CODE_REQUEST_LOGIN_ERROR', '402' ); // ��½����
define ( 'ERROR_MSG_REQUEST_LOGIN_ERROR', '�˺Ż��������' );
define ( 'ERROR_CODE_REQUEST_SERVER_CONFIG_ERROR', '410' ); // ��������ô���
define ( 'ERROR_MSG_REQUEST_SERVER_CONFIG_ERROR', '��������ô���' );
define ( 'ERROR_CODE_NO_RESULT', '510' ); // û�н��
define ( 'ERROR_MSG_NO_RESULT', 'û�н��' );
/**
 * *****************************************************************************
 */
/* ����������� */
/**
 * *****************************************************************************
 */
define ( 'REQUEST_UID', 'uid' ); // ������û�id
define ( 'REQUEST_USER_PASSWORD', 'user_password' ); // ������û�����
define ( 'REQUEST_USER_STATE', 'user_state' ); // ������û�״̬
?>