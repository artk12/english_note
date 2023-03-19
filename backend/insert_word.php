<?php

    header('Access-Control-Allow-Origin: *');
    define('db_user', 'msswbetk_admin');
    define('db_pass', 'JlgET*oC{b[b');
    define('db_host', 'localhost');
    define('db_name', 'msswbetk_fastwords');

    $query = $_POST["query"];

    $mysqli = mysqli_connect(db_host, db_user, db_pass, db_name);

    mysqli_set_charset($mysqli,'utf8');
    
    if(mysqli_query($mysqli,$query)){
        $id = mysqli_insert_id($mysqli);

        if(mysqli_query($mysqli,"INSERT INTO `word_counter`(`id_word`, `counter`) VALUES ('$id','0')")){

            echo 'done';

        }else{

            echo mysqli_errno($mysqli);

        }
      }else{

        echo mysqli_errno($mysqli);

      }

    

?>