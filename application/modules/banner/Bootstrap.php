<?php
class Banner_Bootstrap extends Zend_Application_Module_Bootstrap
{

    public function _initRoutes()
    {
        Zend_Controller_Front::getInstance()->getRouter()->addRoute('banner',
            new Zend_Controller_Router_Route_Regex(
                'banner/([a-zA-Z0-9\-_]*)\.html',
                array(
                    'module' => 'banner',
                    'controller' => 'index',
                    'action' => 'view'
                ),
                array(
                    1 => 'id'
                ),
                'banner/%s.html'
            ));
    }
}