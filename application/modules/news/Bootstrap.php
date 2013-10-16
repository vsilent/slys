<?php
class News_Bootstrap extends Zend_Application_Module_Bootstrap
{

    public function _initRoutes()
    {
        Zend_Controller_Front::getInstance()->getRouter()->addRoute('news',
            new Zend_Controller_Router_Route_Regex(
                'news/([a-zA-Z0-9\-_]*)\.html',
                array(
                    'module' => 'news',
                    'controller' => 'index',
                    'action' => 'view'
                ),
                array(
                    1 => 'newsname'
                ),
                'news/%s.html'
            ));
    }
}