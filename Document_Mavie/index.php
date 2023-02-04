<?php
	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
	header('Access-Control-Allow-Credentials: true');
	header('Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Accept, X-PINGOTHER, Content-Type');
	
	session_start();
	require_once '../apiEngine.php';

	$rawBody = file_get_contents('php://input');
	$APIEngine=new APIEngine('Document_Mavie', $_GET, $rawBody, $_SERVER['REQUEST_METHOD']);
	$response = $APIEngine->callApiFunction();
	if ($response != 'null') {
		echo $response; 
	}
?>