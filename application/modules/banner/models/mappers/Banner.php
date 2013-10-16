<?php

/**
 * SlyS
 * 
 * This is a class generated with Zend_CodeGenerator.
 * 
 * @version $Id: Generator.php 985 2011-01-06 08:23:52Z deeper $
 * @license New BSD
 */
class Banner_Model_Mapper_Banner extends Banner_Model_Mapper_BaseBanner
{
  public function getMCA()
  {
      $params = array('identifier' => $this->sysmap_id);
      $sysmapItem = Slys_Api::getInstance()->request(
        new Slys_Api_Request($this, 'sysmap.get-item-by-identifier', $params));

      if (empty($sysmapItem) === true)
        return null;

      $sysmapItem = $sysmapItem->getFirst();

      if (empty($sysmapItem) === true)
        return null;

      $mca = $sysmapItem->toRequest();

      $module      = $mca->getModuleName();
      $controller  = $mca->getControllerName();
      $action      = $mca->getActionName();
    
      $result = array(
        'module' => $module,
        'controller' => ($controller == 'index') ? '' : $controller,
        'action' => $action,
        'params' => $sysmapItem->params
      );

      return $result;

  }
}

