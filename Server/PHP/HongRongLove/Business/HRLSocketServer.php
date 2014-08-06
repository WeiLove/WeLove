<?php
header ( "Content-Type: text/html;charset=gbk" );

require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/ConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Business/UserMngr.php';
class SocketServer {
	private $serverSocket;
	private $clientSocket;
	private $clientUid;
	/**
	 * ����socket����
	 */
	function startServer() {
		set_time_limit ( 0 );
		
		// �����׽��ּ�������
		$this->serverSocket = socket_create ( AF_INET, SOCK_STREAM, SOL_TCP ) or die ( "Could not create socket\n" );
		socket_bind ( $this->serverSocket, SOCKET_HOST, SOCKET_PORT ) or die ( "Could not bind to socket\n" );
		socket_listen ( $this->serverSocket, 1 ) or die ( "Could not set up socket listener\n" );
		
		$connectCount = 0;
		
		// ��������������ܹ���
		while ( TRUE && $connectCount ++ < 2 ) {
			// �ȴ�����
			$this->clientSocket = socket_accept ( $this->serverSocket ) or die ( "Could not accept incoming connection\n" );
			// ���ӳɹ��󣬻��ȡ�ͻ�����Ϣ
			while ( $this->clientSocket ) {
				$msg = socket_read ( $this->clientSocket, 65535 );
				$msg = json_decode ( $msg, true );
				$this->operation ( $msg );
			}
		}
	}
	/**
	 * �ر�socket����
	 */
	function stopServer() {
		$this->closeClient ();
		socket_close ( $this->serverSocket );
		unset ( $this->serverSocket );
	}
	/**
	 * �Ͽ��ͻ���socket����
	 */
	function closeClient() {
		socket_close ( $this->clientSocket );
		unset ( $this->clientSocket );
		unset ( $this->clientUid );
	}
	/**
	 * ��Ϣ����
	 *
	 * @param array $msg        	
	 */
	function operation($msg) {
		// ��Ϣ��ʽ{operation:xx,...}
		// operation
		$operation = $msg [SOCKET_PROTOCOL_OPERATION];
		switch ($operation) {
			case SOCKET_PROTOCOL_LOGIN :
				{
					// ��½
					$this->operation_login ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_LOGOUT :
				{
					// �ǳ�
					$this->operation_logout ();
					break;
				}
			case SOCKET_PROTOCOL_QUERY_USER_LOGIN_STATE :
				{
					// ��½״̬
					$this->operation_query_user_login_state ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_SEND_MSG :
				{
					// ������Ϣ
					$this->operation_send_msg ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_QUERY_UNREAD_MSG_COUNT :
				{
					// δ����Ϣ��
					$this->operation_query_unread_msg_count ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_QUERY_UNREAD_MSG :
				{
					// δ����Ϣ
					$this->operation_query_unread_msg ( $msg );
					break;
				}
			default :
				{
					// bad request or client disconnect close socket
					socket_write ( $this->clientSocket, 'forbidden!' );
					$this->closeClient ();
					break;
				}
		}
	}
	/**
	 * ��½����
	 *
	 * @param array $msg        	
	 */
	function operation_login($msg) {
		$from_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
		$password = $msg [SOCKET_PROTOCOL_USER_PASSWORD];
		
		// check has user
		if (UserMngr::hasUser ( $from_uid )) {
			echo '��¼�ɹ�����ӭ!';
			$this->clientUid = $from_uid;
			$sendMsg [] = socket_write ( $this->clientSocket, '��¼�ɹ�����ӭ!' );
		} else {
			// logout
			echo '��¼ʧ��!';
			
			$this->operation_logout ();
		}
	}
	/**
	 * �ǳ�����
	 *
	 * @param array $msg        	
	 */
	function operation_logout() {
		socket_write ( $this->clientSocket, 'quit' );
		$this->closeClient ();
	}
	function operation_query_user_login_state($msg) {
		;
	}
	/**
	 * ��ѯδ����Ϣ������
	 *
	 * @param array $msg        	
	 */
	function operation_query_unread_msg_count($msg) {
		$from_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
	}
	/**
	 * ��ѯδ����Ϣ����
	 *
	 * @param array $msg        	
	 */
	function operation_query_unread_msg($msg) {
		$from_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
		
		// check has user
		if ($from_uid == $this->clientUid) {
			// ��ѯδ����Ϣ
		} else {
			// logout
			$this->operation_logout ();
		}
	}
	/**
	 * ������Ϣ����
	 *
	 * @param unknown $msg        	
	 */
	function operation_send_msg($msg) {
		$from_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
		$to_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
		
		// chech has user
		if ($from_uid == $this->clientUid) {
		} else {
		}
	}
}

$socketServer = new SocketServer ();

$socketServer->startServer ();
$socketServer->stopServer ();