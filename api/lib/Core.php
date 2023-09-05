<?php

declare(strict_types=1);
class Core
{
  protected Request $request;
  protected ItemsController | SellersController $controller;
  protected $currentMethod;
  protected $params = [];

  public function __construct()
  {
    $this->handleRequest();
  }
  private function handleRequest(): void
  {
    $this->request = new Request();
    $this->controller = new (ucfirst($this->request->endpoint) . 'Controller'($this->request));
    // $this->controller = new $currentController($request);
    switch ($this->request->httpMethod) {
      case 'GET':
        $this->controller->index();
        break;
      case 'POST':
        if ($this->request->url === '/test/sellers/' || $this->request->url === '/test/items/') {
          $this->controller->insert();
        } else {
          die('Invalid POST request');
        }
        break;
      case 'PUT':
        switch ($this->request->endpoint) {
          case 'items':
            $this->controller->update($this->request->params['id'], $this->request->params['sold']);
            break;
          default:
            die('Invalid PUT request');
        }
        break;
      default:
        die('Invalid request');
    }
  }
}