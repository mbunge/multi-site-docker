<?php
/**
 * Created by PhpStorm.
 * User: mbunge
 * Date: 11.03.2017
 * Time: 09:41
 */

//var_dump($_SERVER);

$db = new PDO(
    'mysql:host=database;port=3306;dbname=agantty_app;charset=UTF8;',
    'root',
    'dev',
    [
        PDO::ATTR_PERSISTENT=>true
    ]
);
var_dump($db->query('SHOW TABLES')->fetchAll());