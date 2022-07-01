<?php 
error_reporting(1);
include("class.php");

$func = new Functions();
$_method = $_SERVER['REQUEST_METHOD'];

if ($_method == "GET"){
	$func->setHeader(200);
	$func->addHeader();
	
	$profileCode = $_GET["profile_code"];

	$jsonArray = array();
	$db = new Database();
	
	if(strlen($profileCode) == 8) {
		$profileResult = $db->Procedure("call sp_PROFILE_GET($profileCode)");
		$profileId = $profileResult[0]['PROFILE_ID'];

		$phoneResult = $db->Procedure("call sp_PHONE_GET($profileId)");
		$emailResult = $db->Procedure("call sp_EMAIL_GET($profileId)");
		$websiteResult = $db->Procedure("call sp_WEBSITE_GET($profileId)");
		$addressResult = $db->Procedure("call sp_ADDRESS_GET($profileId)");

		$jsonArray["status"] = "success";
		$jsonArray["profile"] = $profileResult[0];
		$jsonArray["phones"] = $phoneResult;
		$jsonArray["emails"] = $emailResult;
		$jsonArray["websites"] = $websiteResult;
		$jsonArray["addresses"] = $addressResult;

	}
	else {
		$jsonArray["status"] = "invalid-code";
		$jsonArray["message"] = "Gerçersiz profil kodu!";
	}

	echo $func->json($jsonArray);

}   
else{
	$func->setHeader(400);
}

 ?>