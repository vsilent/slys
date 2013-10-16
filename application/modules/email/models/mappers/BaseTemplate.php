<?php

/**
 * Email_Model_Mapper_BaseTemplate
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property string $sysname
 * @property string $subject
 * @property string $email_from
 * @property string $reply_to
 * @property text $message
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class Email_Model_Mapper_BaseTemplate extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('email_template');
        $this->hasColumn('id', 'integer', null, array(
             'primary' => true,
             'autoincrement' => true,
             'type' => 'integer',
             ));
        $this->hasColumn('sysname', 'string', 64, array(
             'type' => 'string',
             'unique' => true,
             'length' => '64',
             ));
        $this->hasColumn('subject', 'string', 255, array(
             'type' => 'string',
             'length' => '255',
             ));
        $this->hasColumn('email_from', 'string', 64, array(
             'type' => 'string',
             'length' => '64',
             ));
        $this->hasColumn('reply_to', 'string', 64, array(
             'type' => 'string',
             'length' => '64',
             ));
        $this->hasColumn('message', 'text', null, array(
             'type' => 'text',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        
    }
}