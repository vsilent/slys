<?php
class Banner_Form_Edit extends Zend_Form
{
    public function init()
    {
        //  form attributes
        $this->setMethod(self::METHOD_POST);
        $this->setAttrib('enctype', 'multipart/form-data');

        // name
        $field = new Zend_Form_Element_Text('name');
        $field->setAllowEmpty(false);
        $field->setRequired(true);
        $field->setAttrib('size',40);
        $field->setLabel('title');
        $this->addElement($field);

        //  type
        $field = new Zend_Form_Element_Select('type');
        $field->setAllowEmpty(false);
        $field->setRequired(true);
        $field->setLabel('type');
        $field->setMultiOptions(array(
          'text' => 'text',
          'image' => 'image',
          'flash' => 'flash',
        ));
        $this->addElement($field);

        // type of link
        $field = new Zend_Form_Element_Radio('link_type');
        $field->setAllowEmpty(false);
        $field->setRequired(false);
        $field->setMultiOptions(array(
          'external' => 'external',
          'internal' => 'internal',
        ));
        $field->setValue('external');
        $field->setLabel('link_type');
        $this->addElement($field);

        //  link
        $field = new Zend_Form_Element_Text('link');
        $field->setAllowEmpty(false);
        $field->setRequired(false);
        $field->setAttrib('size',40);
        $field->setLabel('link');
        $this->addElement($field);

        //  sysmap
        $mapTree = Slys_Api::getInstance()->request(new Slys_Api_Request($this, 'sysmap.get-map-tree'))->getFirst();
        $mapTree->setName('sysmap_id')->addDisableCondition('level', new Zend_Validate_LessThan(3));
        $mapTree->setRequired(false);
        $this->addElement($mapTree);

        // text
        $field = new Zend_Form_Element_Textarea('text');
        $field->setAllowEmpty(false);
        $field->setRequired(false);
        $field->setAttrib('rows',10);
        $field->setLabel('text');
        $this->addElement($field);

        // file
        $file = new Zend_Form_Element_File('src');
        $file->setLabel('file');

        $destination = APPLICATION_PATH.'/../public/images/banners';

        if(!file_exists($destination)) {
            mkdir($destination,0755,true);
        }

        $file->setDestination($destination);
        $file->setRequired(false);
        $file->addValidator('Size', false, 10240000); // 10 MB
        $file->addValidator('Extension', false, 'jpg,png,gif,swf');
        $this->addElement($file);

        // flash width
        $field = new Zend_Form_Element_Text('flash_width');
        $field->setAllowEmpty(true);
        $field->setRequired(false);
        $field->setAttrib('size',10);
        $field->setLabel('width');
        $this->addElement($field);

        // flash width
        $field = new Zend_Form_Element_Text('flash_height');
        $field->setAllowEmpty(true);
        $field->setRequired(false);
        $field->setAttrib('size',10);
        $field->setLabel('height');
        $this->addElement($field);

        //  submit button
        $submitElement = new Zend_Form_Element_Submit('submit');
        $submitElement->setLabel('save');
        $this->addElement($submitElement);
    }
}