<?php

    include "../configuration/db.php";
    $token = $_GET["token"];

    $insert = "INSERT INTO `Users`(`id`, `datetime`, `token`) VALUES (null,'$current_datetime','$token');";
    $result = mysqli_query( $link, $insert );
    $rows = array();
   
       if ( $result )
    {
        $rows["id"] = "1";
        $rows["data"] = "1";
       
    }
    else
    {
        $rows["id"] = "0";
        $rows["data"] = "0";
    }   
    
  
    
    echo json_encode($rows, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

?>
