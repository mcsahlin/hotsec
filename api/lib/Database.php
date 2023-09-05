<?php

declare(strict_types=1);
class Database
{
  protected $pdo;
  public function __construct()
  {
    $config = require('api/config/config.php');
    $options = [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];
    $dbconf = $config['db'];
    $dsn = "mysql:host=$dbconf[host];dbname=$dbconf[dbname];charset=$dbconf[charset]";
    try {
      $pdo = new PDO($dsn, $dbconf['username'], $dbconf['password'], $options);
    } catch (PDOException $e) {
      die($e->getMessage());
    }
    $this->pdo = $pdo;
    unset($dbconf, $config['db']);
  }
  public function __destruct()
  {
    $this->pdo = null;
  }
}