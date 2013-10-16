<?php
class Page_AdminController extends Zend_Controller_Action {
    
    public function indexAction()
    {
        $modelPages = new Page_Model_Pages();
        $list = $modelPages->getList();
        $this->view->list = $list;
    }

    public function addAction() {
        $this->_forward('edit');
    }

    public function editAction() {
        $pageId = $this->getRequest()->getParam('id');
        if(!empty($pageId)) {
            $pagesModel = new Page_Model_Pages();
            $pageMapper = $pagesModel->getPageById($pageId);
            $this->view->title = $this->view->translate('page') . ' &laquo' . $pageMapper->title .'&raquo;';
        } else {
            $pageMapper = new Page_Model_Mapper_Page();
            $this->view->title = $this->view->translate('new_page');
        }

        $form = new Page_Form_Edit();
        $form->populate($pageMapper->toArray());

        if ( $this->getRequest()->isPost() ) {
            if ( $form->isValid( $this->getRequest()->getPost() ) ) {

                $pageMapper->fromArray($form->getValues());
                $pageMapper->save();

                $this->_helper->getHelper('FlashMessenger')->addMessage('save_ok');
                $this->_helper->redirector->goToRoute(array(
                                                            'module' => 'page',
                                                       ), 'admin', true);
            }
        }

        $this->view->form = $form;
    }

    public function deleteAction()
    {
        $id = $this->getRequest()->getParam('id');
        $pageMapper = Page_Model_DbTable_Page::getInstance()->findOneBy('id',$id);
        $pageMapper->delete();

        $this->_helper->getHelper('FlashMessenger')->addMessage('save_ok');
        $this->_helper->redirector->goToRoute(array(
                                                    'module' => 'page',
                                               ), 'admin', true);
    }
}
