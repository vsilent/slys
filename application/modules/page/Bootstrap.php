<?php
class Page_Bootstrap extends Zend_Application_Module_Bootstrap
{

    public function _initRoutes()
    {
        Zend_Controller_Front::getInstance()->getRouter()->addRoute('page',
            new Zend_Controller_Router_Route_Regex(
                'page/([a-zA-Z0-9\-_]*)',
                array(
                    'module' => 'page',
                    'controller' => 'index',
                    'action' => 'view'
                ),
                array(
                    1 => 'pagename'
                ),
                'page/%s'
            ));
    }
}
