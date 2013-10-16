<?php

/**
 * SlyS
 * 
 * This is a class generated with Zend_CodeGenerator.
 * 
 * @version $Id: Generator.php 1158 2011-02-02 09:48:32Z deeper $
 * @license New BSD
 */
class Region_Model_DbTable_Region extends Doctrine_Table
{

    /**
     * Returns an instance of this class.
     * 
     * @return Region_Model_DbTable_Region
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Region_Model_Mapper_Region');
    }

    public function getListForSelectBox()
    {
      $data = $this->findAll()->toArray();
      $regions = array();
      foreach($data as $region) {
          $regions[$region['id']] = $region['title'];
      }
      return $regions;
    }

}

