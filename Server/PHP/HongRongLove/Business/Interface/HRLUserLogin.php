<?php
// 此接口是用户登陆
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLUserMsgMngr.php';

$uid = $_POST [REQUEST_UID];
$password = $_POST [REQUEST_USER_PASSWORD];
$result = HRLUserMngr::login ( $uid, $password );
echo $result;