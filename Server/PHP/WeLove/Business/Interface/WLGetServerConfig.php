<?php
// �˽ӿ��ǻ�ȡ��������ַ���˿���Ϣ
header ( "Content-Type: text/html;charset=gbk" );
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Common/WLConstantDefine.php';
require_once $_SERVER ['DOCUMENT_ROOT'] . '/WeLove' . '/Business/WLServerConfigMngr.php';

$result = WLServerConfigMngr::getServerConfig ();
echo $result;
?>
