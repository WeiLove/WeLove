<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/RemoteDBMngr/HRLRemoteDBMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUserMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUtil.php';
class HRLUserMsgMngr {
	public static function getUserUnReadMsgCount($uid) {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			// 检查是否存在uid
			if (HRLUserMngr::hasUser ( $uid )) {
				$sql = 'select count(*) total from ' . TABLE_USER_MSG . ' where ' . TABLE_USER_MSG_HAS_READ . '=0' . ' and ' . TABLE_USER_MSG_UID . '=' . $uid;
				$data = HRLRemoteDBMngr::shareInstance ()->query ( $sql );
			} else {
				throw new Exception ( ERROR_MSG_REQUEST_UID_NOT_FOUND, ERROR_CODE_REQUEST_UID_NOT_FOUND );
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
	public static function getUserUnReadMsgList($uid) {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			// 检查是否存在uid
			if (HRLUserMngr::hasUser ( $uid )) {
				$sql = 'select * from ' . TABLE_USER_MSG . ' where ' . TABLE_USER_MSG_HAS_READ . '=0' . ' and ' . TABLE_USER_MSG_UID . '=' . $uid . ' order by create_date asc limit 5';
				$data = HRLRemoteDBMngr::shareInstance ()->query ( $sql, 1 );
				if ($data) {
					// 标注已读状态
					for($i = 0; $i < count ( $data ); $i ++) {
						$mid = $data [$i] [TABLE_USER_MSG_MID];
						$sql = 'update ' . TABLE_USER_MSG . ' set ' . TABLE_USER_MSG_HAS_READ . ' = 1 where ' . TABLE_USER_MSG_MID . '=' . $mid;
						HRLRemoteDBMngr::shareInstance ()->execute ( $sql );
					}
				} else {
					throw new Exception ( ERROR_MSG_NO_RESULT, ERROR_CODE_NO_RESULT );
				}
			} else {
				throw new Exception ( ERROR_MSG_REQUEST_UID_NOT_FOUND, ERROR_CODE_REQUEST_UID_NOT_FOUND );
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