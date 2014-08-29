<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/RemoteDBMngr/WLRemoteDBMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUserMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUtil.php';
class WLUserStateMngr {
	
	/**
	 * 获取用户状态
	 *
	 * @param $uid 用户id，不能为NULL        	
	 * @throws Exception
	 * @return {data:{}, errorCode:, errorMsg:}
	 */
	public static function getUserState($uid) {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			// 先查是否有这个uid
			if (WLUserMngr::hasUser ( $uid )) {
				
				// 取一条状态，时间最早的
				$sql = sprintf ( "select * from %s where %s=%d and %s=%d order by %s asc limit 1", TABLE_USER_STATE, TABLE_USER_STATE_UID, $uid, TABLE_USER_STATE_HAS_READ, 0, TABLE_USER_STATE_CREATE_DATE );
				$data = WLRemoteDBMngr::shareInstance ()->query ( $sql );
				
				if ($data) {
					// 有未读状态，标注为已读啦
					$sid = $data [TABLE_USER_STATE_SID];
					$read_date = getDatetime();
					$sql = sprintf ( "update %s set %s='%s',%s=%d where %s=%d", TABLE_USER_STATE, TABLE_USER_STATE_READ_DATE, $read_date, TABLE_USER_STATE_HAS_READ, 1, TABLE_USER_STATE_SID, $sid );
					WLRemoteDBMngr::shareInstance ()->execute ( $sql );
				} else {
					// 没有未读的状态了，且没有sid，返回最新的一条已读状态
					$sid = $_REQUEST [TABLE_USER_STATE_SID];
					$sql = sprintf ( "select * from %s where %s=%d and %s=%d order by %s desc limit 1", TABLE_USER_STATE, TABLE_USER_STATE_UID, $uid, TABLE_USER_STATE_HAS_READ, 1, TABLE_USER_STATE_CREATE_DATE );
					$data = WLRemoteDBMngr::shareInstance ()->query ( $sql );
					
					if ($sid == $data [TABLE_USER_STATE_SID]) {
						// 如果sid一样，说明客户端已经有缓存了，不需要传回去
						$data = NULL;
						$errorCode = ERROR_CODE_SUCCESS_CACHE;
						$errorMsg = ERROR_MSG_SUCCESS_CACHE;
					}
				}
			} else {
				throw new Exception ( ERROR_MSG_REQUEST_UID_NOT_FOUND, ERROR_CODE_REQUEST_UID_NOT_FOUND );
			}
		} catch ( Exception $e ) {
			$errorMsg = $e->getMessage ();
			$errorCode = $e->getCode ();
		}
		
		$result [JSON_DATA] = $data;
		$result [ERROR_CODE] = $errorCode;
		$result [ERROR_MSG] = $errorMsg;
		
		$result = encode_json ( $result );
		
		return $result;
	}
	
	/**
	 * 设置用户当前状态
	 *
	 * @param $uid 用户id，不能为NULL        	
	 * @param $user_state 用户状态，不能为NULL        	
	 * @throws Exception
	 * @return {errorCode:, errorMsg:}
	 */
	public static function addUserState($uid, $user_state) {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			// 先查是否有这个uid
			if ($user_state && WLUserMngr::hasUser ( $uid )) {
				$create_date = getDatetime();
				$sql = 'insert into ' . TABLE_USER_STATE . '(' . TABLE_USER_STATE_UID . ', ' . TABLE_USER_STATE_USER_STATE . ', ' . TABLE_USER_STATE_CREATE_DATE . ') 
				values ( $uid, $user_state, $create_date )';
				$data = WLRemoteDBMngr::shareInstance ()->execute ( $sql );
				
				if ($data) {
					// 添加状态成功
				} else {
					throw new Exception ( ERROR_MSG_REQUEST_PARAM_ERROR, ERROR_CODE_REQUEST_PARAM_ERROR );
				}
			} else {
				throw new Exception ( ERROR_MSG_REQUEST_UID_NOT_FOUND, ERROR_CODE_REQUEST_UID_NOT_FOUND );
			}
		} catch ( Exception $e ) {
			$errorMsg = $e->getMessage ();
			$errorCode = $e->getCode ();
		}
		
		$result [ERROR_CODE] = $errorCode;
		$result [ERROR_MSG] = $errorMsg;
		
		$result = encode_json ( $result, JSON_UNESCAPED_UNICODE );
		
		return $result;
	}
}
?>