<?php
header ( "Content-Type: text/html;charset=gbk" );

require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/ConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Business/UserMngr.php';
class SocketServer {
	private $serverSocket;
	private $clientSocket;
	private $clientUid;
	/**
	 * 开启socket服务
	 */
	function startServer() {
		set_time_limit ( 0 );
		
		// 开启套接字监听过程
		$this->serverSocket = socket_create ( AF_INET, SOCK_STREAM, SOL_TCP ) or die ( "Could not create socket\n" );
		socket_bind ( $this->serverSocket, SOCKET_HOST, SOCKET_PORT ) or die ( "Could not bind to socket\n" );
		socket_listen ( $this->serverSocket, 1 ) or die ( "Could not set up socket listener\n" );
		
		$connectCount = 0;
		
		// 开启连接请求接受过程
		while ( TRUE && $connectCount ++ < 2 ) {
			// 等待连接
			$this->clientSocket = socket_accept ( $this->serverSocket ) or die ( "Could not accept incoming connection\n" );
			// 连接成功后，会读取客户端信息
			while ( $this->clientSocket ) {
				$msg = socket_read ( $this->clientSocket, 65535 );
				$msg = json_decode ( $msg, true );
				$this->operation ( $msg );
			}
		}
	}
	/**
	 * 关闭socket服务
	 */
	function stopServer() {
		$this->closeClient ();
		socket_close ( $this->serverSocket );
		unset ( $this->serverSocket );
	}
	/**
	 * 断开客户端socket连接
	 */
	function closeClient() {
		socket_close ( $this->clientSocket );
		unset ( $this->clientSocket );
		unset ( $this->clientUid );
	}
	/**
	 * 消息处理
	 *
	 * @param array $msg        	
	 */
	function operation($msg) {
		// 消息格式{operation:xx,...}
		// operation
		$operation = $msg [SOCKET_PROTOCOL_OPERATION];
		switch ($operation) {
			case SOCKET_PROTOCOL_LOGIN :
				{
					// 登陆
					$this->operation_login ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_LOGOUT :
				{
					// 登出
					$this->operation_logout ();
					break;
				}
			case SOCKET_PROTOCOL_QUERY_USER_LOGIN_STATE :
				{
					// 登陆状态
					$this->operation_query_user_login_state ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_SEND_MSG :
				{
					// 发送消息
					$this->operation_send_msg ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_QUERY_UNREAD_MSG_COUNT :
				{
					// 未读消息数
					$this->operation_query_unread_msg_count ( $msg );
					break;
				}
			case SOCKET_PROTOCOL_QUERY_UNREAD_MSG :
				{
					// 未读消息
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
	 * 登陆处理
	 *
	 * @param array $msg        	
	 */
	function operation_login($msg) {
		$from_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
		$password = $msg [SOCKET_PROTOCOL_USER_PASSWORD];
		
		// check has user
		if (UserMngr::hasUser ( $from_uid )) {
			echo '登录成功，欢迎!';
			$this->clientUid = $from_uid;
			$sendMsg [] = socket_write ( $this->clientSocket, '登录成功，欢迎!' );
		} else {
			// logout
			echo '登录失败!';
			
			$this->operation_logout ();
		}
	}
	/**
	 * 登出处理
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
	 * 查询未读消息数处理
	 *
	 * @param array $msg        	
	 */
	function operation_query_unread_msg_count($msg) {
		$from_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
	}
	/**
	 * 查询未读消息处理
	 *
	 * @param array $msg        	
	 */
	function operation_query_unread_msg($msg) {
		$from_uid = $msg [SOCKET_PROTOCOL_FROM_USER_ID];
		
		// check has user
		if ($from_uid == $this->clientUid) {
			// 查询未读消息
		} else {
			// logout
			$this->operation_logout ();
		}
	}
	/**
	 * 发送消息处理
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