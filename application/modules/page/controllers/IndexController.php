<?php
class Page_IndexController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->_forward('view');
    }

    /**
     * @paramsform Page_Form_ListParams
     */
    public function viewAction()
    {
        $pageName = $this->getRequest()->getParam('pagename');

        if(empty($pageName) === false) {
            $modelPages = new Page_Model_Pages();
            $page = $modelPages->getPageBySysname($pageName);

            if($page === false)
                $this->_forward('error404','error','default');

            $this->view->page = $page;
        }
        else
            $this->_redirect('/');
    }
}