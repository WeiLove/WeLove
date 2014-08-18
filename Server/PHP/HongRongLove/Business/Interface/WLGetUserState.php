<?php
// 此接口是获取用户状态信息
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLUserStateMngr.php';
// 获得用户uid
$uid = $_REQUEST [REQUEST_UID];
$result = WLUserStateMngr::getUserState ( $uid );
echo $result;
?>
