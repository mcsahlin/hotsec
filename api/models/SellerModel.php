<?php

declare(strict_types=1);
require_once 'api/bootstrap.php';

class SellerModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }

  protected function fetch(int $id)
  {
    $stmt = $this->pdo->prepare('SELECT * FROM sellers WHERE id = ?');
    $stmt->execute([$id]);
    $data = $stmt->fetch();
    return $data;
  }

  protected function fetchAll(string $orderby = null): array
  {
    if (isset($orderby)) {
      $stmt = $this->pdo->prepare('SELECT * FROM sellers ORDER BY ' . $orderby . ' ASC');
    } else {
      $stmt = $this->pdo->prepare('SELECT * FROM sellers');
    }
    $stmt->execute();
    $data = $stmt->fetchAll();
    return $data;
  }

  protected function create(array $data)
  {

    try {
      $query = 'INSERT INTO sellers (firstname, lastname) VALUES (:firstname, :lastname)';
      $stmt = $this->pdo->prepare($query);
      $stmt->bindParam(':firstname', $data['body']['firstname']);
      $stmt->bindParam(':lastname', $data['body']['lastname']);
      $result = $stmt->execute();
      return $result;
    } catch (PDOException $e) {
      die('Insert failed: ' . $e->getMessage());
    }
  }


  // protected function setStats(int $id, int $sold)
  // {
  //   $stmt = $this->pdo->prepare('SELECT seller_id, COUNT(*) as item_count FROM items GROUP BY seller_id;');
  //   $stmt->execute([$sold, $id]);
  //   $data = $stmt->fetch();
  //   return $data;
  // }

  protected function getSellerItemCount(int $id)
  {
    $stmt = $this->pdo->prepare('SELECT COUNT(*) as item_count FROM items WHERE seller_id = ?');
    $stmt->execute([$id]);
    $data = $stmt->fetch();
    return $data;
  }

  protected function getSellerSoldItemCount(int $id)
  {
    $stmt = $this->pdo->prepare('SELECT COUNT(*) as sold_item_count FROM items WHERE seller_id = ? AND sold = 1');
    $stmt->execute([$id]);
    $data = $stmt->fetch();
    return $data;
  }

  protected function getSellerSalesTotal(int $id)
  {
    $stmt = $this->pdo->prepare('SELECT SUM(price) as revenue_sum FROM items WHERE seller_id = ? AND sold = 1');
    $stmt->execute([$id]);
    $data = $stmt->fetch();
    return $data;
  }

  protected function getSellerItems(int $id)
  {
    $stmt = $this->pdo->prepare('SELECT * FROM items WHERE seller_id = ?');
    $stmt->execute([$id]);
    $data = $stmt->fetchAll();
    return $data;
  }
}