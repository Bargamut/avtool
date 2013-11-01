<?php
include_once('../eng/site.conf.php');

if ($_SERVER['SERVER_NAME'] == 'avtool.dev') {
    $DB = new JF_Database('127.0.0.1', 'avtool.dev', 'avtool.dev');
    $DB->select_db('avtool.dev');
} else {

}

$SITE = new AdminSite($_POST, $DB);