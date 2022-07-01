<?php 
error_reporting(1);
include("class.php");

$func = new Functions();
$_method = $_SERVER['REQUEST_METHOD'];

if ($_method == "POST"){
	$func->addHeader();
	$func->setHeader(200);
	
	$profileCode = $func->PostDataGet("profile_code");
	$profile = $func->PostDataGet("profile");

	$phones = $func->PostDataGet("phones");
	$emails = $func->PostDataGet("emails");
	$websites = $func->PostDataGet("websites");
	$addresses = $func->PostDataGet("addresses");
	$deleted = $func->PostDataGet("deleted");

	$jsonArray = array();
	$db = new Database();

	/*------------- Profile -------------*/
	$profileId = $profile['profileId'];
	$cardName = $profile['cardName'];
	$accountEmail = $profile['email'];
	$passwordHash = md5($profile['password']);
	$firstname = $profile['firstname'];
	$lastname = $profile['lastname'];
	$birthday = $profile['birthday'];
	$orgName = $profile['orgName'];
	$position = $profile['position'];
	$note = $profile['note'];
	/*------------------------------------------*/

	if($profileCode != '' && $accountEmail != '' && $passwordHash != '') {
		
		$authCheckResult = $db->Procedure("call sp_AUTH_CHECK('$profileCode', '$accountEmail', '$passwordHash')");
		if($authCheckResult[0]['STATUS'] == 'success') {
			/*------------- Profile Update -------------*/
			$profileResult = $db->Procedure("call sp_PROFILE_UPDATE($profileId, '$cardName', '$accountEmail', '$passwordHash', '$firstname', '$lastname', '$birthday', '$orgName', '$position', '$note')");
			/*------------------------------------------*/

			/*------------- Phones Update -------------*/
			foreach ($phones as $ph) {
				$phoneId = $ph['id'];
				$phoneType = $ph['typeId'];
				$phone = $ph['number'];

				if($phoneId) {
					$phoneResult = $db->Procedure("call sp_PHONE_UPDATE($profileId, $phoneId, '$accountEmail', '$passwordHash', $phoneType, '$phone')");
				}
				else {
					$phoneResult = $db->Procedure("call sp_PHONE_ADD($profileId, $phoneType, '$phone')");
				}
			}
			/*--------------------------------------*/

			/*------------- Emails Update -------------*/
			foreach ($emails as $em) {
				$emailId = $em['id'];
				$emailType = $em['typeId'];
				$email = $em['email'];

				if($emailId){
					$emailResult = $db->Procedure("call sp_EMAIL_UPDATE($profileId, $emailId, '$accountEmail', '$passwordHash', $emailType, '$email')");
				}
				else {
					$emailResult = $db->Procedure("call sp_EMAIL_ADD($profileId, $emailType, '$email')");
				}
			}
			/*--------------------------------------*/

			/*------------- Websites Update -------------*/
			foreach ($websites as $wb) {
				$websiteId = $wb['id'];
				$websiteType = $wb['typeId'];
				$website = $wb['url'];

				if($websiteId) { 
					$websiteResult = $db->Procedure("call sp_WEBSITE_UPDATE($profileId, $websiteId, '$accountEmail', '$passwordHash', $websiteType, '$website')");
				}
				else {
					$websiteResult = $db->Procedure("call sp_WEBSITE_ADD($profileId, $websiteType, '$website')");
				}
			}
			/*--------------------------------------*/

			/*------------- Addresses Update -------------*/
			foreach ($addresses as $ad) {
				$addressId = $ad['id'];
				$addressType = $ad['typeId'];
				$addressName = $ad['name'];
				$addressContent = $ad['address'];
				$city = $ad['city'];
				$town = $ad['town'];
				$country = $ad['country'];
				$zipCode = $ad['zipCode'];

				if($addressId) {
					$addressResult = $db->Procedure("call sp_ADDRESS_UPDATE($profileId, $addressId, '$accountEmail', '$passwordHash', $addressType, '$addressName', '$addressContent', '$city', '$town', '$country', '$zipCode')");
				}
				else {
					$addressResult = $db->Procedure("call sp_ADDRESS_ADD($profileId, $addressType, '$addressName', '$addressContent', '$city', '$town', '$country', '$zipCode')");
				}
			}
			/*--------------------------------------*/

			/*------------- All Delete -------------*/
			$phonesDeleted = $deleted["phones"];
			$emailsDeleted = $deleted["emails"];
			$websitesDeleted = $deleted["websites"];
			$addressesDeleted = $deleted["addresses"];

			foreach ($phonesDeleted as $id) {
				$result = $db->Procedure("call sp_PHONE_DELETE($profileId, $id,    '$accountEmail', '$passwordHash')");
			}

			foreach ($emailsDeleted as $id) {
				$result = $db->Procedure("call sp_EMAIL_DELETE($profileId, $id,    '$accountEmail', '$passwordHash')");
			}

			foreach ($websitesDeleted as $id) {
				$result = $db->Procedure("call sp_WEBSITE_DELETE($profileId, $id,    '$accountEmail', '$passwordHash')");
			}

			foreach ($addressesDeleted as $id) {
				$result = $db->Procedure("call sp_ADDRESS_DELETE($profileId, $id,    '$accountEmail', '$passwordHash')");
			}

			/*--------------------------------------*/

			$jsonArray["status"] = "success";
			$jsonArray["message"] = "Kartvizi güncellendi!";
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
else{
	$func->setHeader(400);
}

 ?>