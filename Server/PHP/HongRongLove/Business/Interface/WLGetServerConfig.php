<?php
// 此接口是获取服务器地址、端口信息
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLServerConfigMngr.php';

$result = WLServerConfigMngr::getServerConfig ();
echo $result;
?>
