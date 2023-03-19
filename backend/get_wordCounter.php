<?php

    header('Access-Control-Allow-Origin: *');
    define('db_user', 'msswbetk_admin');
    define('db_pass', 'JlgET*oC{b[b');
    define('db_host', 'localhost');
    define('db_name', 'msswbetk_fastwords');

    $mysqli = mysqli_connect(db_host, db_user, db_pass, db_name);
    
    $result =  mysqli_query($mysqli,"SELECT `ID`, `id_word`, `counter` FROM `word_counter`");
    $output = [];


    while($content = mysqli_fetch_array($result)){
        $item = [];
        $item['ID'] = $content['ID'];
        $item['id_word'] = $content['id_word'];
        $item['counter'] = $content['counter'];
        $output[] = $item; 
     }

     echo json_encode($output);

?>