<?php
class Banner_IndexController extends Zend_Controller_Action
{
    public function indexAction()
    {
      $bannerModel = new Banner_Model_Banners();
      $this->view->list = $bannerModel->getList();
    }
}