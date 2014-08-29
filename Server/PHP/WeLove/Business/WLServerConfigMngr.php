<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/RemoteDBMngr/WLRemoteDBMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUtil.php';
class WLServerConfigMngr {
	public static function getServerConfig() {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			$sql = 'select * from ' . TABLE_SERVER;
			$data = WLRemoteDBMngr::shareInstance ()->query ( $sql );
			if (! $data) {
				throw new Exception ( ERROR_MSG_REQUEST_SERVER_CONFIG_ERROR, ERROR_CODE_REQUEST_SERVER_CONFIG_ERROR );
			}
		} catch ( Exception $e ) {
			$errorCode = $e->getCode ();
			$errorMsg = $e->getMessage ();
		}
		
		$result [JSON_DATA] = $data;
		$result [ERROR_CODE] = $errorCode;
		$result [ERROR_MSG] = $errorMsg;
		
		$result = encode_json ( $result, JSON_UNESCAPED_UNICODE );
		
		return $result;
	}
	public static function addDefaultServer() {
		$server_name = 'http://myphp';
		$port = 8000;
		$db_server_ip = '127.0.0.1';
		$db_name = 'db56233';
		$db_user_name = 'root';
		$db_user_password = 'root';
		$create_time = getDatetime ();
		$modify_time = '0';
		$create_ip = '0';
		$remote_ip = '0';
		$state_id = 0;
		
		$keys = array ();
		
		array_push ( $keys, TABLE_SERVER );
		array_push ( $keys, TABLE_SERVER_SERVER_NAME );
		array_push($keys, $var);
		array_push($keys, $var)
		
		$sql = 'insert into ' . TABLE_SERVER . ' (server_name, port, db_server_ip, db_name, db_user_name,
				 db_user_password, create_time, modify_time, create_ip, remote_ip, state_id) values(' . $server_name . ',' . $port . ',' . $db_server_ip . ',' . $db_name . ',' . $db_user_name . ',' . $db_user_password . ',' . $create_time . ',' . $modify_time . ',' . $create_ip . ',' . $remote_ip . ',' . $state_id . ')';
		echo $sql;
		
		try {
			WLRemoteDBMngr::shareInstance ()->execute ( $sql );
		} catch ( Exception $e ) {
		}
	}
}
?>