<?php

    include "../configuration/db.php";
    $fileds_value = $_GET["fileds_value"];
  $str_arr = explode (",", $fileds_value); 
 $form_id = $_GET["form_id"];
 $select = "SELECT `id`  FROM `form_fileds` WHERE  `form_id` ='$form_id';";
 $result = mysqli_query( $link , $select );
 $rows = array();
 if (mysqli_num_rows( $result ) >0 )
  {
      $x=0;
        while($temp = mysqli_fetch_array( $result ))
        {
            
            $id=$temp["id"];
             $update = "UPDATE `form_fileds` SET `value`='$str_arr[$x]' WHERE `id` = '$id';";
             $x+=1;
    $resultupdate = mysqli_query( $link, $update );
    $rows = array();
 
       if ( $resultupdate )
    {
        $rows["id"] = "1";
        $rows["data"] = "1";
       
    }
    else
    {
        $rows["id"] = "0";
        $rows["data"] = "0";
    }   
    
        }
       
  } 
   
  
    
    echo json_encode($rows, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

?>
