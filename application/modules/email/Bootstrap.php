<?php
/**
 * Email_Bootstrap
 *
 * @uses Zend_Application_Module_Bootstrap
 * @uses Slys_Api_Request_Requestable
 * @package
 * @version 1.0
 * @copyright @copyright
 * @author Vasilii Pascal <vs@webdirect.md>
 * @license
 */
class Email_Bootstrap extends Zend_Application_Module_Bootstrap implements Slys_Api_Request_Requestable
{

    /**
     * onRequest
     *
     * set response data as array
     *
     * @param Slys_Api_Request $request
     * @author Vasilii Pascal <vs@webdirect.md>
     * @return void
     */
    public function onRequest(Slys_Api_Request $request)
    {
        switch ($request->getName()) {
            /**
             * Usage example:
             *
             * $apiRequest = new Slys_Api_Request($this, 'email.get-tpl-by-sysname', array('sysname'=>'sample-template'));
             * $tpl = $apiRequest->proceed()->getResponse()->getFirst();
             *
             **/
            case 'email.get-tpl-by-sysname':
                $params = $request->getParams();
                $sysname  = $params['sysname'];
                if (!empty($sysname)) {
                    $response = Email_Model_DbTable_Template::getInstance()->findOneBy('sysname', $sysname )->toArray();
                }
                if(!empty($response)) {
                    $request->getResponse()->setData($response);
                }
                break;

                /**
                 * Usage example:
                 *
                 * $apiRequest = new Slys_Api_Request($this, 'email.get-tpl-list');
                 * $list = $apiRequest->proceed()->getResponse()->getFirst();
                 *
                 */
            case 'email.get-tpl-list':
                $response = Email_Model_DbTable_Template::getInstance()->findAll();
                if(!empty($response)) {
                    $request->getResponse()->setData($response);
                }
                break;

                /**
                 *
                 *  Request example:
                 *
                 *
                 *  $params = array('sysname'=>'sample-template'
                 *               ,'to'=>'user@email.com'
                 *               ,'user_full_name'=>'Jack Black'
                 *               ,'email'=>'sample@sample.com'
                 *               ,'default_manager_info'=>'Please contact manager at: manager@interteam.com.ua'
                 *               ,'login'=>'jackbl'
                 *               ,'password'=>'password23'
                 *               ,'site'=>'Interteam.com.ua'
                 *              );
                 *  $apiRequest = new Slys_Api_Request($this, "email.send-email-template", $params);
                 *  $response = $apiRequest->proceed()->getResponse()->getFirst();
                 *
                 */
            case 'email.send-email-template':

                $example = '$apiRequest = new Slys_Api_Request($this, "email.send-email-template", array("sysname"=>"sample-template", "to"=>"somebody@somewhere.com"));';

                $params = $request->getParams();

                if(!empty($params) && !is_array($params)){
                    throw new Zend_Exception( "Passed argument should be an array. ".$example );
                }
                if (empty($params['sysname'])) {
                    throw new Zend_Exception( "Passed array doesn't contain 'sysname' parameter. ".$example );
                }
                if(empty($params['to'])){
                    throw new Zend_Exception( "To e-mail string parameter required. ".$example );
                }

                $sysname = $params['sysname'];

                $tplModel = new Email_Model_Templates();

                $response = $tplModel->sendEmail($params);

                if(!empty($response)) {
                    $request->getResponse()->setData($response);
                }
                break;
        }
    }

    /**
     * Register notification first !!!
     * @param Slys_Api_Notification_Registry $registry
     * @return void
     */
    //public function publishNotifications(Slys_Api_Notification_Registry $registry)
    //{
    //$registry->register('email.send-email-template');
    //}
    /**
     * onNotification
     *
     * @param Slys_Api_Notification $notification
     * @return void
     */
    //public function onNotification(Slys_Api_Notification $notification)
    //{
    //switch ($notification->getName()) {

    //case 'email.send-email-template':
    //$example = 'Slys_Api::getInstance()->notify(null, "email.send-email-template", $params=array("sysname"=>"sample-template", "to"=>"somebody@somewhere.com"));';
    //$params = $notification->getParams();

    //if(!empty($params) && !is_array($params)){
    //throw new Zend_Exception( "Passed argument should be an array. ".$example );
    //}
    //if (empty($params['sysname'])) {
    //throw new Zend_Exception( "Passed array doesn't contain 'sysname' parameter. ".$example );
    //}
    //if(empty($params['to'])){
    //throw new Zend_Exception( "To e-mail string parameter required. ".$example );
    //}

    //$sysname = $params['sysname'];

    //$tplModel = new Email_Model_Templates();

    //$tplModel->sendEmail($params);
    //break;
    //}
    //}
}
