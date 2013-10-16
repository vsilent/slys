<?php
class Banner_AdminController extends Zend_Controller_Action {

    /**
     * Main page configure list of banners
     * @return void
     */
    public function indexAction()
    {
        $modelBanner = new Banner_Model_Banners();
        $list = $modelBanner->getList();
        $this->view->list = $list;
    }

    public function addAction()
    {
        $this->_forward('edit');
    }

    public function editAction()
    {
        $id = $this->getRequest()->getParam('id');
        if(!empty($id))
        {
            //  edit
            $bannerModel = new Banner_Model_Banners();
            $bannerMapper = $bannerModel->getItemById($id);
            $this->view->title =  $this->view->translate('banner'). ' &laquo' . $bannerMapper->name .'&raquo;';
        }
        else
        {
            // add
            $bannerMapper = new Banner_Model_Mapper_Banner();
            $this->view->title = $this->view->translate('new_banner');
        }

        $form = new Banner_Form_Edit();
        $form->populate($bannerMapper->toArray());



        if ($this->getRequest()->isPost())
        {
            if ($form->isValid($this->getRequest()->getPost()))
            {
                $bannerMapper->fromArray($form->getValues());
                $bannerMapper->save();

                //  redirect & notice
                $this->_helper->getHelper('FlashMessenger')->addMessage('save_ok');
                $this->_helper->redirector->goToRoute(array('module' => 'banner'), 'admin', true);
            }
        }

        $this->view->form = $form;
    }

    public function deleteAction()
    {
        $id = $this->getRequest()->getParam('id');
        $bannerMapper = Banner_Model_DbTable_Banner::getInstance()->findOneBy('id', $id);
        $bannerMapper->delete();

        $this->_helper->getHelper('FlashMessenger')->addMessage('Успешно удален');
        $this->_helper->redirector->goToRoute(array('module' => 'banner'), 'admin', true);
    }
}
