<?php

/**
 * Slys
 *
 * Navigation module bootstrap class
 *
 * @author Serghei Ilin <criolit@gmail.com>
 * @version $Id: Bootstrap.php 1139 2011-01-28 16:07:30Z criolit $
 */
class Region_Bootstrap extends Zend_Application_Module_Bootstrap implements Slys_Api_Request_Requestable
{
    public function onRequest(Slys_Api_Request $request) {
        switch($request->getName()) {
            case 'region.get-regions-list':
                $request->getResponse()->setData( Region_Model_DbTable_Region::getInstance()->findAll()->toArray() );
                break;
        }

        switch($request->getName()) {
            case 'region.get-region':
                $id = $request->getParam('id');
                $request->getResponse()->setData( Region_Model_DbTable_Region::getInstance()->findOneById($id) );
                break;
        }

         switch($request->getName()) {
            case 'region.get-cities-list':
                $params = $request->getParams();
                $region  = empty($params['region']) ? null : $params['region'] ;
                if(!empty($region))
                    $data = Region_Model_DbTable_City::getInstance()->getCitiesByRegions((array)$region);
                else
                    $data = Region_Model_DbTable_City::getInstance()->findAll();

                if(!empty($data))
                    $request->getResponse()->setData( $data->toArray() );
                else
                    $request->getResponse()->setData( array() );

                break;
        }
    }
}