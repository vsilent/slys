<?php
/**
 * Description
 *
 * @author Serghei Ilin <criolit@gmail.com>
 * @version $Id$
 */
class Region_Form_Region extends Zend_Form
{
    public function init()
    {
        $this->setMethod(self::METHOD_POST);

        $title = new Zend_Form_Element_Text('title');
        $title->setLabel( $this->getView()->translate('title') );
        $this->addElement($title);

        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel( $this->getView()->translate('save') )
               ->setIgnore(true);
        $this->addElement($submit);

        $this->addElement( new Zend_Form_Element_Hidden('id') );
    }
}