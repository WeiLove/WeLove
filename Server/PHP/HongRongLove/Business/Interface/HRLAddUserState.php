<?php
// 此接口是添加用户状态信息
header ( "Content-Type: text/html;charset=gbk" );

require_once dirname ( __DIR__ ) . '/Common/ConstantDefine.php';
require_once dirname ( __DIR__ ) . '/UserStateMngr.php';

// 获得用户uid
$uid = $_REQUEST [REQUEST_UID];
$user_state = $_REQUEST [REQUEST_USER_STATE];

$result = UserStateMngr::addUserState ( $uid, $user_state );

echo $result;
?>