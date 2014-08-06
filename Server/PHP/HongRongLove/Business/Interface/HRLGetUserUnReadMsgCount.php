<?php
// 此接口是获取用户未读消息数信息
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Business/HRLUserMsgMngr.php';

// 获得用户uid
$uid = $_REQUEST [REQUEST_UID];
$result = UserMsgMngr::getUserUnReadMsgCount ( $uid );
echo $result;
