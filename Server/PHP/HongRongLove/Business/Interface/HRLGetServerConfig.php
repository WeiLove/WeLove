<?php
// �˽ӿ��ǻ�ȡ��������ַ���˿���Ϣ
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Common/HRLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/RemoteDBMngr' . '/Business/HRLServerConfigMngr.php';

$result = ServerConfigMngr::getServerConfig ();

echo $result;
?>
