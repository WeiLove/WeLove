<?php
// �˽ӿ�������û�״̬��Ϣ
header ( "Content-Type: text/html;charset=gbk" );

require_once dirname ( __DIR__ ) . '/Common/ConstantDefine.php';
require_once dirname ( __DIR__ ) . '/UserStateMngr.php';

// ����û�uid
$uid = $_REQUEST [REQUEST_UID];
$user_state = $_REQUEST [REQUEST_USER_STATE];

$result = UserStateMngr::addUserState ( $uid, $user_state );

echo $result;
?>