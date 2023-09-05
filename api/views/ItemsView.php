<?php

declare(strict_types=1);
class ItemsView extends ItemModel
{
  public function renderJson($data)
  {
    header('Content-Type: application/json');
    echo json_encode(['data' => $data]);
  }
  public function render404()
  {
    header('HTTP/1.0 404 not found');
    echo json_encode(['error' => 'not found']);
  }
}
