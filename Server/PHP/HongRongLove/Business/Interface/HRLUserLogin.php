<?php
// 此接口是用户登陆
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/ConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Business/UserMsgMngr.php';

$uid = $_POST [REQUEST_UID];
$password = $_POST [REQUEST_USER_PASSWORD];
$result = UserMngr::login ( $uid, $password );
echo $result;