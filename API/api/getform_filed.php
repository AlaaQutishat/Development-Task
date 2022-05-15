<?php

 include("../configuration/db.php");
 $form_id = $_GET["form_id"];
 $select = "SELECT `id`, `form_id`, `value` FROM `form_fileds` WHERE `form_id` ='$form_id' ORDER BY `datetime` ASC;";
 $result = mysqli_query( $link , $select );
 $rows = array();
 if (mysqli_num_rows( $result ) >0 )
  {
        while($temp = mysqli_fetch_array( $result ))
        {
            array_push($rows,array( "id"=>$temp["id"] , "value"=>$temp["value"] ));
        }
       
  } 

  
  echo json_encode( $rows , JSON_UNESCAPED_UNICODE|JSON_PRETTY_PRINT);
   
?>