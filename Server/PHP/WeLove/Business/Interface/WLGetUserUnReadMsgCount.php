<?php
// �˽ӿ��ǻ�ȡ�û�δ����Ϣ����Ϣ
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUserMsgMngr.php';

// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$result = WLUserMsgMngr::getUserUnReadMsgCount ( $uid );
echo $result;
