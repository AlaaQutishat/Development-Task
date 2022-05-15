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
            array_push($rows,array( "datetime"=>$temp["datetime"] , "fileds_number"=>$temp["fileds_number"], "filed_types"=>$temp["filed_types"]  ));
        }
       
  } 

  
  echo json_encode( $rows , JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
   
?>