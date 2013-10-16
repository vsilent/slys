<?php
/**
 * Email_Model_Templates
 *
 * @package
 * @version 1.0
 * @copyright @copyright
 * @author Vasilii Pascal <vs@webdirect.md>
 * @license
 */
class Email_Model_Templates
{

    /**
     * getTemplate
     *
     * @param mixed $id
     * @return void
     */
    public function getTemplate($id) {
        return Email_Model_DbTable_Template::getInstance()->findOneBy('id',$id);
    }

    /**
     * getTemplateBySysname
     *
     * @param mixed $sysname
     * @return void
     */
    public function getTemplateBySysname($sysname) {
        return Email_Model_DbTable_Template::getInstance()->findOneBy('sysname',$sysname);
    }

    /**
     * getTemplateList
     *
     * @return void
     */
    public function getTemplateList()
    {
        return Email_Model_DbTable_Template::getInstance()->getList();
    }

    /**
     * getTemplatePager
     *
     * @param int $page
     * @param int $maxPerPage
     * @return void
     */
    public function getTemplatePager($page = 1, $maxPerPage = 20)
    {
        return Email_Model_DbTable_Template::getInstance()->getPager($page, $maxPerPage);
    }

    /**
     * getEditForm
     *
     * @param mixed $item
     * @return void
     */
    public function getEditForm($item)
    {
        $form  = new Email_Form_TemplateEdit();
        if ($item) {
            $form->populate($item);
        } else {
            $form->populate($item);
        }
        return $form;
    }


    /**
     * sendEmail
     *
     * @param mixed $to
     * @param mixed $tpl_vars
     * @param string $tpl_var_wrapper
     * @return void
     */
    public function sendEmail( $params, $tpl_var_wrapper='@')
    {
        $email_arr = $this->makeEmail($params, $tpl_var_wrapper);
        $mail = new Zend_Mail('UTF-8');
        $mail->setFrom($email_arr['email_from']);
        $mail->addTo($params['to']);
        $mail->setSubject($email_arr['subject']);
        $mail->setReplyTo($email_arr['reply_to']);
        $mail->setBodyText($email_arr['message']);

        return $mail->send();
    }

    /**
     * makeEmail
     *
     * @param mixed $tpl_vars
     * @param mixed $tpl_var_wrapper
     * @return void
     */
    public function makeEmail($tpl_vars, $tpl_var_wrapper)
    {
        $tpl = $this->getTemplateBySysname($tpl_vars['sysname']);

        if (!$tpl) {
            throw new Zend_Exception( "Could not find e-mail template with name '".$tpl_vars['sysname']."'" );
        }
        $result_arr = array();
        foreach ($tpl->toArray() as $k=>$email_tpl_part){
            $result_arr[$k] = $this->replaceVars($tpl_vars, $tpl_var_wrapper, $email_tpl_part);
        }
        return $result_arr;
    }

    /**
     * replaceVars
     *
     * @param mixed $tpl_vars
     * @param mixed $tpl_var_wrapper
     * @param mixed $text
     * @return void
     */
    public function replaceVars($tpl_vars, $tpl_var_wrapper, $text )
    {
        foreach ($tpl_vars as $key=>$value){
            $text = preg_replace('/'.$tpl_var_wrapper.$key.$tpl_var_wrapper.'/', $value, $text);
        }
        return $text;
    }
}
