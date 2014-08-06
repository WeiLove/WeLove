<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/RemoteDBMngr/HRLRemoteDBConnect.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
class HRLRemoteDBMngr extends HRLRemoteDBConnect {
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
			self::$instance = new HRLRemoteDBMngr ();
			self::$instance->connect_db ( DB_SERVER_NAME, DB_USER_NAME, DB_USER_PASSWORD );
			self::$instance->select_db ( DB_NAME );
		}
		
		return self::$instance;
	}
}
?>