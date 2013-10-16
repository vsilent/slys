<?php

/**
 * SlyS
 *
 * @author     Evgheni Poleacov <evgheni.poleacov@gmail.com>
 *
 * @version    $Id: User.php 1354 2012-04-27 12:04:59Z jabberroid@gmail.com $
 */
class User_Form_User extends Zend_Form
{

     /**
     * Initialization
     */
    public function init()
    {
        $this->setMethod('POST');
        $this->setAttrib('autocomplete', 'off');

        $loginElement = new Zend_Form_Element_Text('login');
        $loginElement->setLabel('login');
        $loginElement->setRequired(true);
        $this->addElement($loginElement);


        $roleModel = new User_Model_Roles();
        $roles = $roleModel->getRegistrationRoles();
        $options = array(''=>'');
        foreach($roles as $role) {
            $options[$role->id] = $role->name;
        }

        $type = new Zend_Form_Element_Select('role_id');
        $type->addMultiOptions($options)->setRequired()->setLabel('user_type');
        $this->addElement($type);

        $firstname = new Zend_Form_Element_Text('firstname');
        $firstname->setRequired()->addValidator(new Zend_Validate_Alpha)->setLabel('firstname');
        $this->addElement($firstname);

        $lastname = new Zend_Form_Element_Text('lastname');
        $lastname->setRequired()->addValidator(new Zend_Validate_Alpha)->setLabel('lastname');
        $this->addElement($lastname);

		$password = new Zend_Form_Element_Password('password');
		$password->setLabel('password')
			->addValidator('StringLength', false, array(6,24))
			->setRequired(true);
		$this->addElement($password);

		$password2 = new Zend_Form_Element_Password('password-confirm');
		$password2->setLabel('confirm password')
			->addValidator('StringLength', false, array(6,24))
			->addValidator(new Zend_Validate_Identical('password'))
			->setRequired(true);
        $this->addElement($password2);

        $email = new Zend_Form_Element_Text('email');
        $email->setRequired()->addValidator(new Zend_Validate_EmailAddress)->setLabel('email');
        $this->addElement($email);

        $active = new Zend_Form_Element_Checkbox('active');
        $active->setLabel('Is active');
        $this->addElement($active);

        $submitElement = new Zend_Form_Element_Submit('submit');
        $submitElement->setLabel('save');
        $submitElement->setIgnore(true);
        $this->addElement($submitElement);
    }

    public function isValid($data)
    {
        $this->populate($data);
        return parent::isValid($data);
    }

}
