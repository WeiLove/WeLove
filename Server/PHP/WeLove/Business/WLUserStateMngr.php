<?php
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/RemoteDBMngr/WLRemoteDBMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUserMngr.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUtil.php';
class WLUserStateMngr {
	
	/**
	 * ��ȡ�û�״̬
	 *
	 * @param $uid �û�id������ΪNULL        	
	 * @throws Exception
	 * @return {data:{}, errorCode:, errorMsg:}
	 */
	public static function getUserState($uid) {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			// �Ȳ��Ƿ������uid
			if (WLUserMngr::hasUser ( $uid )) {
				
				// ȡһ��״̬��ʱ�������
				$sql = sprintf ( "select * from %s where %s=%d and %s=%d order by %s asc limit 1", TABLE_USER_STATE, TABLE_USER_STATE_UID, $uid, TABLE_USER_STATE_HAS_READ, 0, TABLE_USER_STATE_CREATE_DATE );
				$data = WLRemoteDBMngr::shareInstance ()->query ( $sql );
				
				if ($data) {
					// ��δ��״̬����עΪ�Ѷ���
					$sid = $data [TABLE_USER_STATE_SID];
					$read_date = getDatetime();
					$sql = sprintf ( "update %s set %s='%s',%s=%d where %s=%d", TABLE_USER_STATE, TABLE_USER_STATE_READ_DATE, $read_date, TABLE_USER_STATE_HAS_READ, 1, TABLE_USER_STATE_SID, $sid );
					WLRemoteDBMngr::shareInstance ()->execute ( $sql );
				} else {
					// û��δ����״̬�ˣ���û��sid���������µ�һ���Ѷ�״̬
					$sid = $_REQUEST [TABLE_USER_STATE_SID];
					$sql = sprintf ( "select * from %s where %s=%d and %s=%d order by %s desc limit 1", TABLE_USER_STATE, TABLE_USER_STATE_UID, $uid, TABLE_USER_STATE_HAS_READ, 1, TABLE_USER_STATE_CREATE_DATE );
					$data = WLRemoteDBMngr::shareInstance ()->query ( $sql );
					
					if ($sid == $data [TABLE_USER_STATE_SID]) {
						// ���sidһ����˵���ͻ����Ѿ��л����ˣ�����Ҫ����ȥ
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
	 * �����û���ǰ״̬
	 *
	 * @param $uid �û�id������ΪNULL        	
	 * @param $user_state �û�״̬������ΪNULL        	
	 * @throws Exception
	 * @return {errorCode:, errorMsg:}
	 */
	public static function addUserState($uid, $user_state) {
		$result = NULL;
		$data = NULL;
		$errorMsg = ERROR_MSG_SUCCESS;
		$errorCode = ERROR_CODE_SUCCESS;
		
		try {
			// �Ȳ��Ƿ������uid
			if ($user_state && WLUserMngr::hasUser ( $uid )) {
				$create_date = getDatetime();
				$sql = 'insert into ' . TABLE_USER_STATE . '(' . TABLE_USER_STATE_UID . ', ' . TABLE_USER_STATE_USER_STATE . ', ' . TABLE_USER_STATE_CREATE_DATE . ') 
				values ( $uid, $user_state, $create_date )';
				$data = WLRemoteDBMngr::shareInstance ()->execute ( $sql );
				
				if ($data) {
					// ���״̬�ɹ�
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