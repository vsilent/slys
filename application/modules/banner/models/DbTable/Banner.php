<?php

/**
 * SlyS
 *
 * This is a class generated with Zend_CodeGenerator.
 *
 * @version $Id: Generator.php 985 2011-01-06 08:23:52Z deeper $
 * @license New BSD
 */
class Banner_Model_DbTable_Banner extends Doctrine_Table
{

    /**
     * Returns an instance of this class.
     *
     * @return Banner_Model_DbTable_Page
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Banner_Model_Mapper_Banner');
    }

    public function getList()
    {
        return $this->findAll();
    }
}

