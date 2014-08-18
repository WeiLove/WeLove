<?php
// 此接口是用户登陆
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUserMsgMngr.php';

$uid = $_POST [REQUEST_UID];
$password = $_POST [REQUEST_USER_PASSWORD];
$result = WLUserMngr::login ( $uid, $password );
echo $result;