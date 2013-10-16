<?php

/**
 * SlyS
 *
 * This is a class generated with Zend_CodeGenerator.
 *
 * @version $Id: Generator.php 1158 2011-02-02 09:48:32Z deeper $
 * @license New BSD
 */
class News_Model_DbTable_News extends Doctrine_Table
{

    /**
     * Returns an instance of this class.
     *
     * @return News_Model_DbTable_News
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('News_Model_Mapper_News');
    }


}

