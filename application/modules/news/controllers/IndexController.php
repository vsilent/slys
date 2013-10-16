<?php
class News_IndexController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $model = News_Model_News::getInstance();
        $news = $model->getList();
        if($news === false)
            $this->_forward('error404','error','default');

        $this->view->news = $news;
    }

    public function hotNewsAction()
    {
        $model = new News_Model_News();
        $news = $model->getList();

        if($news === false)
            $this->_forward('error404','error','default');

        $this->view->news = $news;
        //$this->view->headTitle($news->title, Zend_View_Helper_Placeholder_Container_Abstract::APPEND);
        //$this->view->headMeta()->appendName('description', $news->meta_description);
        //$this->view->headMeta()->appendName('keywords', $news->meta_keywords);
    }
    /**
     * View news
     * @paramsform News_Form_ListParams
     */
    public function viewAction()
    {
        $name = $this->getRequest()->getParam('newsname');

        if(empty($name) === false) {
            $model = new News_Model_News();
            $news = $model->getNewsBySysname($name);

            if($news === false)
                $this->_forward('error404','error','default');

            $this->view->news = $news;

            $this->view->headTitle($news->title, Zend_View_Helper_Placeholder_Container_Abstract::APPEND);
            $this->view->headMeta()->appendName('description', $news->meta_description);
            $this->view->headMeta()->appendName('keywords', $news->meta_keywords);
        }
        else
            $this->_redirect('/');
    }
}
