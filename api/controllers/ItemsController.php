<?php

declare(strict_types=1);
require_once 'api/bootstrap.php';
class ItemsController extends ItemModel
{
  private Request $request;
  private ItemModel $model;
  private ItemsView $view;
  public function __construct(Request $request)
  {
    parent::__construct();
    $this->request = $request;
    $this->model = new ItemModel();
    $this->view = new ItemsView();
  }
  public function index()
  {
    $id = $this->request->params['id'] ?? null;
    $sort = $this->request->params['sort'] ?? null;
    isset($id) &&
      $this->view->renderJson($this->model->fetch($id));
    isset($sort) &&
      $this->view->renderJson($this->model->fetchAll($sort));
    !isset($id) && !isset($sort) &&
      $this->view->renderJson($this->model->fetchAll());
  }

  public function insert()
  {
    $this->view->renderJson($this->model->create($this->request->body));
  }

  public function setSold()
  {
    $id = $this->request->params['id'];
    $sold = $this->request->params['sold'];
    $this->view->renderJson($this->model->update($id, $sold));
  }
}