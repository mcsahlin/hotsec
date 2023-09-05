<?php

declare(strict_types=1);
require_once 'api/bootstrap.php';
class SellersController extends SellerModel
{
  private SellerModel $model;
  private SellersView $view;
  private Request $request;
  public function __construct(Request $request)
  {
    parent::__construct();
    $this->model = new SellerModel;
    $this->view = new SellersView;
    $this->request = $request;
  }
  public function index()
  {
    $id = $this->request->params['id'] ?? null;
    $sort = $this->request->params['sort'] ?? null;
    isset($id) && $this->view->renderJson($this->compileSellerData($id));
    isset($sort) && $this->view->renderJson($this->model->fetchAll($sort));
    !isset($id) && !isset($sort) && $this->view->renderJson($this->model->fetchAll());
  }

  public function insert()
  {
    $this->view->renderJson($this->model->create($this->request->body));
  }

  public function compileSellerData(int $id)
  {
    return [
      array(
        'seller' => $this->model->fetch($id),
        'submissionCount' => $this->model->getSellerItemCount($id),
        'soldItemCount' => $this->model->getSellerSoldItemCount($id),
        'salesTotal' => $this->model->getSellerSalesTotal($id),
        'items' => $this->model->getSellerItems($id)
      )
    ];
  }
}