<?php
// �˽ӿ��ǻ�ȡ�û�δ����Ϣ����Ϣ
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUserMsgMngr.php';

// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$result = HRLUserMsgMngr::getUserUnReadMsgCount ( $uid );
echo $result;
