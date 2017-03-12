<?php

$db = new PDO(
    'mysql:host=database;port=3306;dbname=agantty_app;charset=UTF8;',
    'root',
    'dev',
    [
        PDO::ATTR_PERSISTENT=>true
    ]
);
var_dump($db->query('SHOW TABLES')->fetchAll());