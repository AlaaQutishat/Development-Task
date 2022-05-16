<?php

 include("../configuration/db.php");
 $user_token = $_GET["user_token"];
 $select = "SELECT `id`, `user_token`, `datetime`, `fileds_number`, `filed_types` FROM `froms` WHERE  `user_token` ='$user_token' ORDER BY `datetime` ASC;";
 $result = mysqli_query( $link , $select );
 $rows = array();

 if (mysqli_num_rows( $result ) >0 )
  {
        while($temp = mysqli_fetch_array( $result ))
        {
              $fileds = array();
            $form_id=$temp["id"];
            
             $selectfiled = "SELECT `id`, `form_id`, `value` FROM `form_fileds` WHERE `form_id`='$form_id';";
            $resultfiled = mysqli_query( $link , $selectfiled );
            if (mysqli_num_rows( $resultfiled ) >0 )
  {
  while($tempfiled = mysqli_fetch_array( $resultfiled ))
        {
            
           array_push($fileds,array( "id"=>$tempfiled["id"] , "value"=>$tempfiled["value"] )); 
        }
      
      
      
      
  }
            
            array_push($rows,array( "datetime"=>$temp["datetime"] , "fileds_number"=>$temp["fileds_number"], "filed_types"=>$temp["filed_types"] ,"filed_value"=>$fileds ));
        }
       
  } 

  
  echo json_encode( $rows , JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
   
?>