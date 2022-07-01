<?php 
error_reporting(0);
include("class.php");

function fileUpload($profileCode, $path = '../photo/'){
	$fileInfo = array();

	$fileName = basename($_FILES['photo']['name']);
	$fileExt = "blob";

	if(move_uploaded_file($_FILES['photo']['tmp_name'], $path.$profileCode.'.'.$fileExt)){
		$fileInfo = array(
			'FILE_NAME' => $profileCode.'.'.$fileExt
		);
	}
	
	return $fileInfo;
}

$func = new Functions();
$_method = $_SERVER['REQUEST_METHOD'];

if ($_method == "POST"){
	$func->setHeader(200);
	$jsonArray = array();

	$profileCode = $_POST['profile_code'];

	if($profileCode != '') {
		$fileInfo = fileUpload($profileCode);
		$fileName = $fileInfo['FILE_NAME'];
		
		if($fileName != '') {
			$jsonArray["status"] = "success";
			$jsonArray["message"] = "Profil fotoğrafı yüklendi!";
		}
		else {
			$jsonArray["status"] = "error";
			$jsonArray["message"] = "Profil fotoğrafı yüklenemedi!";
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