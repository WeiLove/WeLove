<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/RemoteDBMngr/WLRemoteDBConnect.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
class WLRemoteDBMngr extends WLRemoteDBConnect {
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
			self::$instance = new WLRemoteDBMngr ();
			self::$instance->connect_db ( DB_SERVER_NAME, DB_USER_NAME, DB_USER_PASSWORD );
			self::$instance->select_db ( DB_NAME );
		}
		
		return self::$instance;
	}
}
?>