<?php

/**
 * SlyS
 * 
 * This is a class generated with Zend_CodeGenerator.
 * 
 * @version $Id: Generator.php 1158 2011-02-02 09:48:32Z deeper $
 * @license New BSD
 */
class Region_Model_DbTable_City extends Doctrine_Table
{

    /**
     * Returns an instance of this class.
     * 
     * @return Region_Model_Mapper_City
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Region_Model_Mapper_City');
    }
    
    public function getCitiesByRegions($regions) 
    {
        return $this->createQuery('city')->whereIn('region_id', $regions)->execute();
    }


    public function getListForSelectBox()
    {
      $region = 1;
      $data = Region_Model_DbTable_City::getInstance()->getCitiesByRegions((array)$region)->toArray();

      $cities = array();
      foreach($data as $city) {
          $cities[$city['id']] = $city['title'];
      }
      
      return $cities;
    }


}

