<?php
interface HRLDBOperationInterface {
	function connect_db($serverName, $userName, $password); // �������ݿ�
	function disconnect_db(); // �Ͽ�����
	function select_db($dbName); // ѡ�����ݿ�
	function query($sql); // ��ѯsql
	function execute($sql); // ִ��sql
}
class HRLRemoteDBConnect implements HRLDBOperationInterface {
	private $serverName;
	private $dbName;
	private $userName;
	private $password;
	private $connect;
	function connect_db($serverName, $userName, $password) {
		$this->serverName = $serverName;
		$this->userName = $userName;
		$this->password = $password;
		
		$this->connect = mysql_connect ( $serverName, $userName, $password );
	}
	function select_db($dbName) {
		$this->dbName = $dbName;
		
		mysql_select_db ( $dbName );
	}
	function query($sql, $isReturnArray = 0) {
		mysql_query("set names gbk");
		$result = mysql_query ( $sql );
		$array = NULL;
		
		if (1 == $isReturnArray) {
			$array = array ();
			
			while ( $row = mysql_fetch_assoc ( $result ) ) {
				array_push ( $array, $row );
			}
		} else {
			$array = mysql_fetch_assoc ( $result );
		}
		
		return $array;
	}
	function disconnect_db() {
		mysql_close ( $this->connect );
	}
	function execute($sql) {
		$result = mysql_query ( $sql );
		
		return $result;
	}
}
?>