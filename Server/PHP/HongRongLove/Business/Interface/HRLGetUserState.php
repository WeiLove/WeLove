<?php
// �˽ӿ��ǻ�ȡ�û�״̬��Ϣ
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUserStateMngr.php';
// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$result = HRLUserStateMngr::getUserState ( $uid );
echo $result;
?>
