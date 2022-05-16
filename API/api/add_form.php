<?php

    include "../configuration/db.php";
        $fileds_type = $_GET["fileds_type"];
    $fileds_number = $_GET["fileds_number"];
     $user_token = $_GET["user_token"];

    $insert = "INSERT INTO `froms`(`id`, `user_token`, `datetime`, `fileds_number`, `filed_types`) VALUES (null,'$user_token','$current_datetime','$fileds_number','$fileds_type');";
    $result = mysqli_query( $link, $insert );
    $rows = array();
   
       if ( $result )
    {
        
         $last_id = mysqli_insert_id($link);
         
         for ($x = 0; $x <$fileds_number; $x++) {
  $insertfileds = "INSERT INTO `form_fileds`(`id`, `form_id`, `value`) VALUES (null,'$last_id','-');";
         $resultfileds = mysqli_query( $link, $insertfileds );
           if ( $resultfileds )
    {
      $rows["id"] = "1";
         $rows["form_id"]=(string)$last_id;
        $rows["data"] = "1";
        
    }
        
       else
    {
        $rows["id"] = "0";
          $rows["form_id"]="0";
        $rows["data"] = "0";
    }  
}
         
        
        
       
    }
    else
    {
        $rows["id"] = "0";
          $rows["form_id"]="0";
        $rows["data"] = "0";
    }   
    
  
    
    echo json_encode($rows, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

?>
