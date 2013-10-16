<?php

/**
 * SlyS
 *
 * @author     Evgheni Poleacov <evgheni.poleacov@gmail.com>
 *
 * @version    $Id: Profile.php 1352 2012-04-27 11:02:51Z jabberroid@gmail.com $
 */
class User_Form_Profile extends Zend_Form
{

    public function init()
    {
        $action = $this->getView()->url(
                array('action'=>'index','controller'=>'profile','module'=>'user'),
                'default',
                true);
        $this->setMethod('POST');
        $this->setAction($action);

        $element = new Zend_Form_Element_Text('login');
        $element->setLabel('Login:');
        $element->setRequired(true);
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('password');
        $element->setLabel('Login:');
        $element->setRequired(true);
        $this->addElement($element);


        $element = new Zend_Form_Element_Text('firstname');
        $element->setLabel('Firstname:');
        $element->setRequired(true);
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('lastname');
        $element->setLabel('Lastname:');
        $element->setRequired(true);
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('patronymic');
        $element->setLabel('Patronymic:');
        $element->setRequired(true);
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('email');
        $element->setLabel('Email:');
        $element->setRequired(true);
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('phone');
        $element->setLabel('Phone:');
        $element->setRequired(true);
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('city');
        $element->setLabel('City:');
        $element->setRequired(true);
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('zip');
        $element->setLabel('ZIP:');
        $this->addElement($element);

        $element = new Zend_Form_Element_Text('address');
        $element->setLabel('Address:');
        $this->addElement($element);


        $submitElement = new Zend_Form_Element_Submit('submit');
        $submitElement->setIgnore(true);
        $this->addElement($submitElement);
    }

}
