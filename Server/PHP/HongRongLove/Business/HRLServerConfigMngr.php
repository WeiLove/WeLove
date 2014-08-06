<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/RemoteDBMngr/HRLRemoteDBMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUtil.php';

class HRLServerConfigMngr {
	public static function getServerConfig() {
		
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			$sql = 'select * from ' . TABLE_SERVER_CONFIG;
			$data = HRLRemoteDBMngr::shareInstance ()->query ( $sql );
			
			if (! $data) {
				throw new Exception ( ERROR_CODE_REQUEST_SERVER_CONFIG_ERROR, ERROR_MSG_REQUEST_SERVER_CONFIG_ERROR );
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
}
?>