<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/RemoteDBMngr/WLRemoteDBMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUtil.php';
class WLUserMngr {
	/**
	 * ����Ƿ����û�uid���ڲ��ӿڣ��ⲿ����ֱ�ӷ��ʣ�Ҫʵ����ͬ��������д�ӿڣ����ô˽ӿڣ�
	 *
	 * @param $uid �û�id������ΪNULL        	
	 * @return �Ƿ��и��û�
	 */
	public static function hasUser($uid) {
		$result = NULL;
		
		if ($uid) {
			$sql = 'select * from ' . TABLE_USER . ' where ' . TABLE_USER_UID . ' = ' . $uid;
			$result = WLRemoteDBMngr::shareInstance ()->query ( $sql );
		}
		
		return $result;
	}
	/**
	 * �û���½����
	 *
	 * @param �û�id $uid        	
	 * @param �û����� $password        	
	 * @throws Exception
	 */
	public static function login($uid, $password) {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			$sql = sprintf ( "select * from %s where %s=%d and %s='%s'", TABLE_USER, TABLE_USER_UID, $uid, TABLE_USER_PASSWORD, $password );
			$data = WLRemoteDBMngr::shareInstance ()->query ( $sql );
			
			if ($data) {
			} else {
				throw new Exception ( ERROR_MSG_REQUEST_LOGIN_ERROR, ERROR_CODE_REQUEST_LOGIN_ERROR );
			}
		} catch ( Exception $e ) {
			$errorCode = $e->getCode ();
			$errorMsg = $e->getMessage ();
		}
		
		$result [JSON_DATA] = $data;
		$result [ERROR_CODE] = $errorCode;
		$result [ERROR_MSG] = $errorMsg;
		
		$result = encode_json ( $result );
		
		return $result;
	}
}
?>