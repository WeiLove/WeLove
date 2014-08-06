<?php
// 此接口是获取用户未读消息数信息
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUserMsgMngr.php';

// 获得用户uid
$uid = $_REQUEST [REQUEST_UID];
$result = HRLUserMsgMngr::getUserUnReadMsgCount ( $uid );
echo $result;
