<?php 
error_reporting(0);
include("class.php");

$func = new Functions();
$_method = $_SERVER['REQUEST_METHOD'];

if ($_method == "POST"){
	
	$func->setHeader(200);
	$func->addHeader();

	$jsonArray = array();
	$db = new Database();

	$profileCode = $func->PostDataGet("profile_code");
	$email = $func->PostDataGet("email");
	$password = md5($func->PostDataGet("password"));

	if($profileCode != '' && $email != '' && $password != '') {
		$authCheckResult = $db->Procedure("call sp_AUTH_CHECK('$profileCode', '$email', '$password')");

		if($authCheckResult[0]['STATUS'] == 'success') {
			unlink('../photo/'.$profileCode.'.blob');
			
			$jsonArray["status"] = "success";
			$jsonArray["message"] = "Profil fotoğrafı kaldırıldı!";
		}
		else {
			$jsonArray["status"] = "error";
			$jsonArray["message"] = "E-posta adresi veya şifre yanlış!";
		}

	}
	else {	
		$jsonArray["status"] = "error";
		$jsonArray["message"] = "Profil kodu geçersiz!";
	}

	
echo $func->json($jsonArray);

}
else {
	$func->setHeader(400);
}

?>