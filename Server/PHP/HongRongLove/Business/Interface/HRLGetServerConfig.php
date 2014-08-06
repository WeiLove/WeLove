<?php
// 此接口是获取服务器地址、端口信息
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/HongRongLove' . '/Business/HRLServerConfigMngr.php';

$result = HRLServerConfigMngr::getServerConfig ();
echo $result;
?>
