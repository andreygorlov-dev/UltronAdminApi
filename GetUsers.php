<?php
	$link = mysqli_connect(
        '127.0.0.1', 
        'workmif8_ultron',       
        'z%Kf8eK6',   
        'workmif8_ultron');
    if (!$link) {
        printf("{status: 'error'}");
        exit;
    }

	$request = json_decode($req);	
	$result = mysqli_query($link, "SELECT * FROM `users`") or die("error");

	$myArray = array();

	while($row = $result->fetch_array(MYSQLI_ASSOC)) {
        $myArray[] = $row;
    }

    echo json_encode($myArray);	
?>