<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/RemoteDBMngr/RemoteDBConnect.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/ConstantDefine.php';
class RemoteDBMngr extends RemoteDBConnect {
	private static $instance = NULL;
	
	/**
	 * ˽�л����캯������֤����޷�ֱ��ʵ����
	 */
	private function __construct() {
	}
	
	/**
	 * ˽�л�����ֹ�û���¡ʵ��
	 */
	private function __clone() {
	}
	
	/**
	 * ��̬���������ش����Ψһʵ��
	 */
	public static function shareInstance() {
		if (is_null ( self::$instance )) {
			self::$instance = new RemoteDBMngr ();
			self::$instance->connect_db ( DB_SERVER_NAME, DB_USER_NAME, DB_USER_PASSWORD );
			self::$instance->select_db ( DB_NAME );
		}
		
		return self::$instance;
	}
}
?>