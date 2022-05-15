<?php

   
    $link = mysqli_connect("localhost", "id18939468_development_task", "gBlpNnLj1M|x=<gu","id18939468_developmenttask");
    mysqli_set_charset($link, "utf8");
    
    date_default_timezone_set("Asia/Amman");
    $current_time = date("h:m:s", time()) ;
    $current_date = date("Y-m-d ", time());
    $current_datetime = date("d-m-Y h:i:s A", time()) ;
    $current_month = date("Y-m", time());
    $current_year = date("Y", time());
    $current_date_sort = date("Y-m-d h:i", time());
    
    if ($link === false) {
        echo "0";
        return;
    }
   
   

?>