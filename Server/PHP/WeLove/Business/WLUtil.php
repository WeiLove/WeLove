<?php
function url_encode($param) {
	if (is_array ( $param )) {
		foreach ( $param as $key => $value ) {
			$param [urlencode ( $key )] = url_encode ( $value );
		}
	} else {
		$param = urlencode ( $param );
	}
	
	return $param;
}
function encode_json($param) {
	return urldecode ( json_encode ( url_encode ( $param ), JSON_UNESCAPED_UNICODE ) );
}
function getDatetime($now = NULL) {
	date_default_timezone_set ( "Etc/GMT-8" );
	
	$format = 'Y-m-d H:i:s';
	$datetime = NULL;
	
	if ($now) {
		$datetime = date ( $format, $now );
	} else {
		$datetime = date ( $format );
	}
	
	return $datetime;
}
function sql($sql, $keys, $values) {
	$pattern = '/\?/';
	
	foreach ( $keys as $key => $value ) {
		$sql = preg_replace ( $pattern, $value, $sql, 1 );
	}
	
	foreach ( $values as $key => $value ) {
		if (is_null ( $value )) {
			$value = 'NULL';
		} else {
			$value = "'$value'";
		}
		$sql = preg_replace ( $pattern, $value, $sql, 1 );
	}
	
	return $sql;
}