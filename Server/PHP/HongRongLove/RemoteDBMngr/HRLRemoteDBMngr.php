<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/RemoteDBMngr/HRLRemoteDBConnect.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
class HRLRemoteDBMngr extends HRLRemoteDBConnect {
	private static $instance = NULL;
	
	/**
	 * 私有化构造函数，保证外界无法直接实例化
	 */
	private function __construct() {
	}
	
	/**
	 * 私有化，防止用户克隆实例
	 */
	private function __clone() {
	}
	
	/**
	 * 静态方法，返回此类的唯一实例
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