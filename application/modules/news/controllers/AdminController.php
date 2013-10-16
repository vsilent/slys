<?php
/**
 * News backend controller
 */
class News_AdminController extends Zend_Controller_Action {

    /**
     * News list
     * @return void
     */
    public function indexAction()
    {
        $list = News_Model_News::getInstance()->getList(Zend_Auth::getInstance()->getIdentity()->id);
        $this->view->list = $list;
    }

    /**
     * News edit form
     * @return void
     */
    public function editAction() {
        $newsId = $this->getRequest()->getParam('id');
        $form = new News_Form_Edit();

        if(!empty($newsId)) {
            $mapper = News_Model_DbTable_News::getInstance()->findOneBy('id', $newsId);
            $form->populate($mapper->toArray());
            $this->view->title = $this->view->translate('page') . ' &laquo' . $mapper->title .'&raquo;';
        } else {

            $mapper = new News_Model_Mapper_News();
            $this->view->title = $this->view->translate('new_news');
        }


        if ( $this->getRequest()->isPost() ) {
            if ( $form->isValid( $this->getRequest()->getPost() ) ) {

                $mapper->fromArray($form->getValues());
                $mapper->save();

                $this->_helper->getHelper('FlashMessenger')->addMessage('save_ok');
                $this->_helper->redirector->goToRoute(array('module' => 'news'), 'admin', true);
            }
        }

        $this->view->form = $form;
    }

    /**
     * News delete action
     * @return void
     */
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
