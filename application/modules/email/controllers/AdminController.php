<?php
/**
 * Email_AdminController
 *
 * @uses Zend_Controller_Action
 * @package
 * @version 1.0
 * @copyright @copyright
 * @author Vasilii Pascal <vs@webdirect.md>
 * @license
 */
class Email_AdminController extends Zend_Controller_Action
{
    /**
     * indexAction
     *
     * @return void
     */
    public function indexAction()
    {
        $this->_forward('template-list');
    }

    /**
     * templateListAction
     *
     * @return void
     */
    public function templateListAction()
    {
        $tplModel = new Email_Model_Templates();
        $this->view->pager = $tplModel->getTemplatePager(
                $this->getRequest()->getParam('page', 1),
                $this->getRequest()->getParam('perPage', 20)
                );
    }

    public function templateEditAction()
    {
        $id = $this->getRequest()->getParam('id');
        if(!empty($id)) {
            $emailTemplateModel = new Email_Model_Templates();
            $emailTemplateMapper = $emailTemplateModel->getTemplate($id);
            $this->view->title = $this->view->translate('email_template') . ' &laquo' . $emailTemplateMapper->subject .'&raquo;';
        } else {
            $emailTemplateMapper = new Email_Model_Mapper_Template();
            $this->view->title = $this->view->translate('new_email_template');
        }

        $form = new Email_Form_TemplateEdit();
        $form->populate($emailTemplateMapper->toArray());

        if ( $this->getRequest()->isPost() ) {
            if ( $form->isValid( $this->getRequest()->getPost() ) ) {
                $emailTemplateMapper->fromArray($form->getValues());
                $emailTemplateMapper->save();

                $this->_helper->getHelper('FlashMessenger')->addMessage('save_ok');
                $this->_helper->redirector->goToRoute(array(
                                                            'module' => 'email',
                                                            'action' => 'template-list',
                                                       ), 'admin', true);
            }
        }

        $this->view->form = $form;
    }
}
