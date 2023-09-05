<?php

declare(strict_types=1);
require_once 'api/bootstrap.php';

class ItemModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }

  protected function fetch(int $id)
  {
    $stmt = $this->pdo->prepare('SELECT * FROM items WHERE id = ?');
    $stmt->execute([$id]);
    $data = $stmt->fetch();
    return $data;
  }

  protected function fetchAll(string $orderby = null): array
  {
    if (isset($orderby)) {
      $stmt = $this->pdo->prepare('SELECT * FROM items ORDER BY ' . $orderby . ' ASC');
    } else {
      $stmt = $this->pdo->prepare('SELECT * FROM items');
    }
    $stmt->execute();
    $data = $stmt->fetchAll();
    return $data;
  }

  protected function create(array $data)
  {
    try {
      $query = 'INSERT INTO items (title, price, size, about, seller_id ) VALUES (:title, :price, :size, :about, :seller_id)';
      $stmt = $this->pdo->prepare($query);
      $stmt->bindParam(':title', $data['body']['title']);
      $stmt->bindParam(':price', $data['body']['price']);
      $stmt->bindParam(':size', $data['body']['size']);
      $stmt->bindParam(':about', $data['body']['about']);
      $stmt->bindParam(':seller_id', $data['body']['seller_id']);
      $result = $stmt->execute();
      return $result;
    } catch (PDOException $e) {
      die('Insert failed: ' . $e->getMessage());
    }
  }

  protected function update(int $id, int $sold)
  {
    try {
      $query = 'UPDATE items SET sold = :sold WHERE id = :id';
      $stmt = $this->pdo->prepare($query);
      $stmt->bindParam(':sold', $sold);
      $stmt->bindParam(':id', $id);
      $result = $stmt->execute();
      return $result ? 'Item updated' : 'Item not updated';
    } catch (PDOException $e) {
      die('Update failed: ' . $e->getMessage());
    }
  }
}