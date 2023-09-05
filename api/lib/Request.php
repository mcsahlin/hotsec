<?php

declare(strict_types=1);
class Request
{
  public string $httpMethod;
  public string $endpoint;
  public string $url;
  public array $params;
  public array $body;
  public function __construct()
  {
    //* Set method 
    $this->httpMethod = $_SERVER['REQUEST_METHOD'];

    //* Set url
    $url = $_SERVER['REQUEST_URI'];
    $this->url = filter_var($url, FILTER_SANITIZE_URL);

    //* Get endpoint
    if (isset($_SERVER['REQUEST_URI'])) {
      $uri = $_SERVER['REQUEST_URI'];
      $uri = filter_var($uri, FILTER_SANITIZE_URL);
      $endpoint = explode('?', $uri)[0];
      $this->endpoint = explode('/', $endpoint)[2];
    }

    //* Get id
    if (isset($_GET['id'])) {
      $id = (int) filter_var($_GET['id'], FILTER_SANITIZE_NUMBER_INT);
      $this->params['id'] = $id;
    }

    //* Get sort param
    if (isset($_GET['sort'])) {
      $sort = filter_var($_GET['sort'], FILTER_SANITIZE_SPECIAL_CHARS);
      $options = [];
      switch ($this->endpoint) {
        case 'sellers':
          $options = ['firstname', 'lastname'];
          break;
        case 'items':
          $options = ['name', 'price'];
          break;
        default:
          echo 'Invalid sort / enpoint';
          exit();
      }
      if (in_array($sort, $options)) {
        $this->params['sort'] = $sort;
      } else {
        echo 'Invalid sort parameter';
        exit();
      }
    }

    //* Get body
    if ($this->httpMethod === 'POST') {
      $this->body = json_decode(file_get_contents('php://input'), true);
    }

    //* Get sold
    if ($this->httpMethod === 'PUT') {
      if ($this->endpoint === 'items' && isset($this->params['id']) && isset($_GET['sold'])) {
        $this->params['sold'] = (int) filter_var($_GET['sold'], FILTER_SANITIZE_NUMBER_INT);
      }
    }
  }
}
