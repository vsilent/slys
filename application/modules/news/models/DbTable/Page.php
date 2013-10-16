<?php

/**
 * SlyS
 *
 * This is a class generated with Zend_CodeGenerator.
 *
 * @version $Id: Generator.php 985 2011-01-06 08:23:52Z deeper $
 * @license New BSD
 */
class Page_Model_DbTable_Page extends Doctrine_Table
{

    /**
     * Returns an instance of this class.
     *
     * @return Page_Model_DbTable_Page
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Page_Model_Mapper_Page');
    }

    public function getList()
    {
        return $this->findAll();
    }
}

