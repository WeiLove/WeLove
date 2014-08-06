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