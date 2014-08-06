<?php
// 此接口是获取服务器地址、端口信息
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Business/HRLServerConfigMngr.php';

$result = ServerConfigMngr::getServerConfig ();

echo $result;
?>
