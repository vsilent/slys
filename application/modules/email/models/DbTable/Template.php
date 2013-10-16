<?php

/**
 * SlyS
 *
 * This is a class generated with Zend_CodeGenerator.
 *
 * @version $Id: Generator.php 1158 2011-02-02 09:48:32Z deeper $
 * @license New BSD
 */
class Email_Model_DbTable_Template extends Doctrine_Table
{

    /**
     * Returns an instance of this class.
     *
     * @return Email_Model_DbTable_Template
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Email_Model_Mapper_Template');
    }

    public function getPager($page = 1, $maxPerPage = 20)
    {
        $query = Doctrine_Query::create()
            ->select('*')
            ->from('Email_Model_Mapper_Template tpl');

        return new Doctrine_Pager($query, $page, $maxPerPage);
    }
}
