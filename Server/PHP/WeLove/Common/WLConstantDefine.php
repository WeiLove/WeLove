<?php

/**
 * *****************************************************************************
 */
/* ���ݿ� */
/**
 * *****************************************************************************
 */
// ͨ���ֶζ���
define ( 'TABLE_COLUMN_CREATE_TIME', 'create_time' );
define ( 'TABLE_COLUMN_MODIFY_TIME', 'modify_time' );
define ( 'TABLE_SERVER_CREATE_IP', 'create_ip' );
define ( 'TABLE_COLUMN_REMOTE_IP', 'remote_ip' );
define ( 'TABLE_SERVER_COLUMN_STATE_ID', 'state_id' );

// ��չ�ֶζ���
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

// ����Զ�����ݿ���Ϣ
// define ( 'DB_SERVER_NAME', '103.27.208.222' );
// define ( 'DB_NAME', 'db56233' );
// define ( 'DB_USER_NAME', 'db56233' );
// define ( 'DB_USER_PASSWORD', 'CWHcwh123' );
define ( 'DB_SERVER_NAME', '127.0.0.1' );
define ( 'DB_NAME', 'db56233' );
define ( 'DB_USER_NAME', 'root' );
define ( 'DB_USER_PASSWORD', 'root' );

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