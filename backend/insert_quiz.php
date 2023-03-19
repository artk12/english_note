<?php

    header('Access-Control-Allow-Origin: *');
    define('db_user', 'msswbetk_admin');
    define('db_pass', 'JlgET*oC{b[b');
    define('db_host', 'localhost');
    define('db_name', 'msswbetk_fastwords');

    $quiz_query = $_POST["queries"];
    $words = $_POST['words'];
    $created_time = $_POST['created_time'];

    $mysqli = mysqli_connect(db_host, db_user, db_pass, db_name);

    $queries = json_decode($quiz_query,true);

    if(mysqli_query($mysqli,"INSERT INTO `quiz`(`created_time`, `words`) VALUES ('$created_time','$words')")){
        foreach($queries as $item){
            $query = str_replace('.',"'",$item['query']);
            if(mysqli_query($mysqli,$query)){
                echo 'done';
            }else{
                echo mysqli_error($mysqli);
            }
        }
    }else{
        echo mysqli_error($mysqli);
    }

?>