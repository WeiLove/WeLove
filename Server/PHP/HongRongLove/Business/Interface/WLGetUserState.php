<?php
// �˽ӿ��ǻ�ȡ�û�״̬��Ϣ
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUserStateMngr.php';
// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$result = WLUserStateMngr::getUserState ( $uid );
echo $result;
?>
