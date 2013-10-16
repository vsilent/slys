<?php
/**
 * Description
 *
 * @author Serghei Ilin <criolit@gmail.com>
 * @version $Id$
 */
class Region_Form_City extends Zend_Form
{
    public function init()
    {
        $this->setMethod(self::METHOD_POST);

        $regions = new Zend_Form_Element_Select('region_id');
        $regions->setLabel('region');
        $this->_fillRegions($regions);
        $this->addElement($regions);

        $title = new Zend_Form_Element_Text('title');
        $title->setLabel('title');
        $this->addElement($title);

        $delivery = new Zend_Form_Element_Select('delivery_type');
        $delivery->setLabel('Тип доставки')
                ->addMultiOptions(array(
                    '' => 'Нет доставки',
                    'courier' => 'Курьер',
                    'carrier' => 'Перевозчик'
                ));
        $this->addElement($delivery);

        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('save')
               ->setIgnore(true);
        $this->addElement($submit);

        $this->addElement( new Zend_Form_Element_Hidden('id') );
    }

    protected function _fillRegions(Zend_Form_Element_Select $regionElement)
    {
        $regions = Region_Model_DbTable_Region::getInstance()->findAll();

        foreach($regions as $region)
            $regionElement->addMultiOption($region->id, $region->title);
    }
}