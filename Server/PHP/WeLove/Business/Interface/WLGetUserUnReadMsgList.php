<?php
// �˽ӿ��ǻ�ȡ�û�δ����Ϣ�б����5����
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUserMsgMngr.php';

// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$result = WLUserMsgMngr::getUserUnReadMsgList ( $uid );
echo $result;
