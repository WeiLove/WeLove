<?php
// �˽ӿ��ǻ�ȡ�û�״̬��Ϣ
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Business/HRLUserStateMngr.php';
// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$result = UserStateMngr::getUserState ( $uid );
echo $result;
?>
