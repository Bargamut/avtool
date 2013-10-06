<?php
include_once('eng/site.conf.php');

$DB = new JF_Database('127.0.0.1', 'avtool.dev', 'avtool.dev');
$DB->select_db('avtool.dev');

$SITE = new Site($_POST, $DB);