<?php 
error_reporting(1);
include("class.php");

$func = new Functions();
$_method = $_SERVER['REQUEST_METHOD'];

if ($_method == "POST"){
	$func->addHeader();
	$func->setHeader(200);
	
	$profile = $func->PostDataGet("profile");

	$phones = $func->PostDataGet("phones");
	$emails = $func->PostDataGet("emails");
	$websites = $func->PostDataGet("websites");
	$addresses = $func->PostDataGet("addresses");

	$jsonArray = array();
	$db = new Database();
	
	/*------------- Profile Create -------------*/
	$code = rand(10000000, 99999999);
	$cardName = $profile['card_name'];
	$accountEmail = $profile['email'];
	$passwordHash = md5($profile['password']);
	$firstname = $profile['firstname'];
	$lastname = $profile['lastname'];
	$birthday = $profile['birthday'];
	$orgName = $profile['org_name'];
	$position = $profile['position_title'];
	$note = $profile['note'];

	$profileResult = $db->Procedure("call sp_PROFILE_ADD($code, '$cardName', '$accountEmail', '$passwordHash', '$firstname', '$lastname', '$birthday', '$orgName', '$position', '$note')");
	/*------------------------------------------*/

	if($profileResult[0]['STATUS'] == "success") {
		$QRCode = new BarcodeQR();
		$QRCode->addData("https://card.mcdeyiz.com/p/".$code);
		//$QRCode->draw();
		$QRCode->draw(320, '../qr/'.$code.".png");

		$profileId = $profileResult[0]['PROFILE_ID'];

		/*------------- Phones Add -------------*/
		foreach ($phones as $ph) {
			$phoneType = $ph['phone_type'];
			$phone = $ph['phone'];

			$phoneResult = $db->Procedure("call sp_PHONE_ADD($profileId, $phoneType, '$phone')");
		}
		/*--------------------------------------*/

		/*------------- Emails Add -------------*/
		foreach ($emails as $em) {
			$emailType = $em['email_type'];
			$email = $em['email'];

			$emailResult = $db->Procedure("call sp_EMAIL_ADD($profileId, $emailType, '$email')");
		}
		/*--------------------------------------*/

		/*------------- Websites Add -------------*/
		foreach ($websites as $wb) {
			$websiteType = $wb['website_type'];
			$website = $wb['website'];

			$websiteResult = $db->Procedure("call sp_WEBSITE_ADD($profileId, $websiteType, '$website')");
		}
		/*----------------------------------------*/

		/*------------- Websites Add -------------*/
		foreach ($addresses as $ad) {
			$addressType = $ad['address_type'];
			$addressName = $ad['address_name'];
			$addressContent = $ad['address_content'];
			$city = $ad['city'];
			$town = $ad['town'];
			$country = $ad['country'];
			$zipCode = $ad['zip_code'];

			$addressResult = $db->Procedure("call sp_ADDRESS_ADD($profileId, $addressType, '$addressName', '$addressContent', '$city', '$town', '$country', '$zipCode')");
		}
		/*----------------------------------------*/

		$jsonArray["status"] = "success";
		$jsonArray["message"] = "Kartvizit oluşturuldu!";
		$jsonArray["profile_code"] = $code;

	}
	else {
		$jsonArray["status"] = "error";
		$jsonArray["message"] = "Kartvizit oluşturulamadı!";
		
	}

	echo $func->json($jsonArray);

}   
else{
	$func->setHeader(400);
}

 ?>