<?php

    header('Access-Control-Allow-Origin: *');
    define('db_user', 'msswbetk_admin');
    define('db_pass', 'JlgET*oC{b[b');
    define('db_host', 'localhost');
    define('db_name', 'msswbetk_fastwords');

    $mysqli = mysqli_connect(db_host, db_user, db_pass, db_name);
    mysqli_set_charset($mysqli,'utf8');
    
    $result =  mysqli_query($mysqli,"SELECT `ID`, `lesson`, `word`, `translated`, `sentences`, `description`, `year`, `month`, `day` FROM `words` ");

    $output = [];

    if(!$result){
        echo mysqli_error($mysqli);
    }

    while($content = mysqli_fetch_array($result)){
        $item = [];
        $item['ID'] = $content['ID'];
        $item['lesson'] = $content['lesson'];
        $item['word'] = $content['word'];
        $item['translated'] = $content['translated'];
        $item['sentences'] = $content['sentences'];
        $item['description'] = $content['description'];
        $item['year'] = $content['year'];
        $item['month'] = $content['month'];
        $item['day'] = $content['day'];
        $output[] = $item; 
     }

     echo json_encode($output);

?>