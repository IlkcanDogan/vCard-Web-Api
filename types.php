<?php 
error_reporting(1);
include("class.php");

$func = new Functions();
$_method = $_SERVER['REQUEST_METHOD'];

if ($_method == "GET"){
	$func->setHeader(200);
	$func->addHeader();

	$jsonArray = array();
	$db = new Database();
	
	$addressResult = $db->Procedure("call sp_TYPES_GET(1)");
	$emailResult = $db->Procedure("call sp_TYPES_GET(2)");
	$phoneResult = $db->Procedure("call sp_TYPES_GET(3)");
	$websiteResult = $db->Procedure("call sp_TYPES_GET(4)");


	$jsonArray["status"] = "success";
	$jsonArray["address"] = $addressResult;
	$jsonArray["email"] = $emailResult;
	$jsonArray["phone"] = $phoneResult;
	$jsonArray["website"] = $websiteResult;

	echo $func->json($jsonArray);

}   
else{
	$func->setHeader(400);
}

 ?>