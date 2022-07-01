<?php
error_reporting(1);

class Database{
	public static $db;
	function __construct($host="localhost",$db_name="xxxx",$db_username="xxxx",$db_password="yyyyy"){
		try {
			self::$db = new PDO("mysql:host=$host;dbname=$db_name;charset=utf8",$db_username,$db_password);
			self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch (PDOException $hata) {
			echo "Database Connection Failed";
		}
	}

	function Procedure($query){
		$data_array = array();

		$s = self::$db->query($query);
		$s->setFetchMode(PDO::FETCH_ASSOC);

		while ($data = $s->fetch()) {
			array_push($data_array, $data);
		}

		return $data_array;

	}
}

class BarcodeQR{
	const API_CHART_URL = "http://chart.apis.google.com/chart";
	private $_data;

	public function draw($size = 250, $filename = null) {
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, self::API_CHART_URL);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_POSTFIELDS, "chs={$size}x{$size}&cht=qr&chl=" . urlencode($this->_data));
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_TIMEOUT, 30);
		$img = curl_exec($ch);
		curl_close($ch);
		if($img) {
			if($filename) {
				if(!preg_match("#\.png$#i", $filename)) {
					$filename .= ".png";
				}
				
				return file_put_contents($filename, $img);
			} else {
				header("Content-type: image/png");
				print $img;
				return true;
			}
		}
		return false;
	}

	public function addData($data = null) {
		$this->_data = $data;
	}

}

class Functions{
	function HttpStatusCode($code){
		$status = array(
			100 => 'Continue',
			101 => 'Switching Protocols',
			200 => 'OK',
			201 => 'Created',
			202 => 'Accepted',
			203 => 'Non-Authoritative Information',
			204 => 'No Content',
			205 => 'Reset Content',
			206 => 'Partial Content',
			300 => 'Multiple Choices',
			301 => 'Moved Permanently',
			302 => 'Found',
			303 => 'See Other',
			304 => 'Not Modified',
			305 => 'Use Proxy',
			306 => '(Unused)',  
        	307 => 'Temporary Redirect',  
       		400 => 'Bad Request',  
        	401 => 'Unauthorized',  
        	402 => 'Payment Required',  
        	403 => 'Forbidden',  
        	404 => 'Not Found',  
        	405 => 'Method Not Allowed',  
        	406 => 'Not Acceptable',  
        	407 => 'Proxy Authentication Required',  
        	408 => 'Request Timeout',  
        	409 => 'Conflict',  
        	410 => 'Gone',  
        	411 => 'Length Required',  
        	412 => 'Precondition Failed',  
        	413 => 'Request Entity Too Large',  
        	414 => 'Request-URI Too Long',  
        	415 => 'Unsupported Media Type',  
        	416 => 'Requested Range Not Satisfiable',  
        	417 => 'Expectation Failed',  
        	500 => 'Internal Server Error',  
        	501 => 'Not Implemented',  
        	502 => 'Bad Gateway',  
        	503 => 'Service Unavailable',  
        	504 => 'Gateway Timeout',  
        	505 => 'HTTP Version Not Supported');
		return $status[$code] ? $status[$code] : $status[500];
	}

	function addHeader(){
        header("Access-Control-Allow-Origin: *");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Access-Control-Max-Age: 86400');
        header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With, X-Custom-Header');
        $_POST = json_decode(file_get_contents('php://input'), true);
    }

  	function setHeader($code){
		header("HTTP/1.1 ".$code." ".$this->HttpStatusCode($code));
		header("Content-Type: application/json; charset=utf-8");
	}

    function json($array){
		return json_encode($array, JSON_UNESCAPED_UNICODE);
	}

    function PostDataGet($item){
    	$_POST = json_decode(file_get_contents('php://input'), true);
        return $_POST[$item];
    }

    function VerifyCode(){
        $code = rand(10000000, 99999999);
        return $code;
    }
}

?>