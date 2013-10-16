<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('Templater_Model_Mapper_BaseWidget', 'doctrine');

/**
 * Templater_Model_Mapper_BaseWidget
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property string $name
 * @property string $map_id
 * @property boolean $published
 * @property integer $layout_id
 * @property integer $ordering
 * @property string $placeholder
 * @property Templater_Model_Mapper_Layout $Layout
 * @property Doctrine_Collection $WidgetPoints
 * 
 * @package    ##PACKAGE##
 * @subpackage ##SUBPACKAGE##
 * @author     ##NAME## <##EMAIL##>
 * @version    SVN: $Id: BaseWidget.php 1283 2011-07-19 12:04:28Z zak $
 */
class Templater_Model_Mapper_BaseWidget extends Doctrine_Record
{
    public function setTableDefinition()
    {
        $this->setTableName('templater_widgets');
        $this->hasColumn('id', 'integer', 11, array(
             'type' => 'integer',
             'primary' => true,
             'autoincrement' => true,
             'length' => '11',
             ));
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'length' => '255',
             ));
        $this->hasColumn('map_id', 'string', 255, array(
             'type' => 'string',
             'length' => '255',
             ));
        $this->hasColumn('published', 'boolean', null, array(
             'type' => 'boolean',
             ));
        $this->hasColumn('layout_id', 'integer', 11, array(
             'type' => 'integer',
             'length' => '11',
             ));
        $this->hasColumn('ordering', 'integer', 11, array(
             'type' => 'integer',
             'length' => '11',
             ));
        $this->hasColumn('placeholder', 'string', 255, array(
             'type' => 'string',
             'length' => '255',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Templater_Model_Mapper_Layout as Layout', array(
             'local' => 'layout_id',
             'foreign' => 'id'));

        $this->hasMany('Templater_Model_Mapper_BaseWidgetPoint as WidgetPoints', array(
             'local' => 'id',
             'foreign' => 'widget_id',
             'onDelete' => 'CASCADE'));
    }
}