<?php
// �˽ӿ��ǻ�ȡ�û�δ����Ϣ�б����5����
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUserMsgMngr.php';

// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$result = HRLUserMsgMngr::getUserUnReadMsgList ( $uid );
echo $result;
