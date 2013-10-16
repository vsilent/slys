<?php

/**
 * Regions ajax controller
 */
class Region_AjaxController extends Zend_Controller_Action
{

    public function init()
    {
        $this->getHelper('AjaxContext')->addActionContext('get-cities','json')->initContext('json');
    }

    /**
     * Return cities list by region (Ajax)
     */
    public function getCitiesAction()
    {
        $regions = $this->getRequest()->getParam('regions');
        $cities = Region_Model_DbTable_City::getInstance()->getCitiesByRegions($regions);
        
        if(!empty($cities)) {
            $this->view->cities = $cities->toArray();
        } else {
            $this->view->cities = array();
        }
    }

    public function selectionCityAction()
    {
      $region = $this->getRequest()->getParam('region');
      
      $data['type']   = 'city';
      $data['values'] = Region_Model_DbTable_City::getInstance()->getListForSelectBox($region);
      $data['values'] = $this->converToJSON($data['values']);
      $this->_helper->json($data);
    }

    private function converToJSON($data)
    {
        $new_data = array();
        foreach($data as $key => $value)
        {
            $new_data[]= array(
                'id' => $key,
                'value' => $value
            );
        }
        return $new_data;
    }
}

