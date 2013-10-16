<?php
class News_Form_Edit extends Zend_Form
{
    public function init()
    {
        $this->setMethod(self::METHOD_POST);

        $sysname = new Zend_Form_Element_Text('sysname');
        $sysname->setAllowEmpty(false);
        $sysname->setRequired(true);
        $sysname->setLabel( 'sysname' );
        $this->addElement($sysname);

        $title = new Zend_Form_Element_Text('title');
        $title->setAllowEmpty(false);
        $title->setRequired(true);
        $title->setLabel( 'title' );
        $this->addElement($title);

        $keywords = new Zend_Form_Element_Textarea('content');
        $keywords->setAllowEmpty(false);
        $keywords->setRequired(true);
        $keywords->setAttrib('rows',10);
        $keywords->setLabel( 'content' );
        $this->addElement($keywords);

        $keywords = new Zend_Form_Element_Textarea('meta_keywords');
        $keywords->setAllowEmpty(false);
        $keywords->setRequired(true);
        $keywords->setAttrib('rows',2);
        $keywords->setLabel( 'meta_keywords' );
        $this->addElement($keywords);

        $description = new Zend_Form_Element_Textarea('meta_description');
        $description->setAllowEmpty(false);
        $description->setRequired(true);
        $description->setAttrib('rows',3);
        $description->setLabel( 'meta_description' );
        $this->addElement($description);

        $identity = Zend_Auth::getInstance()->getIdentity();

        $userId = new Zend_Form_Element_Hidden('user_id');
        $userId->removeDecorator('HtmlTag');
        $userId->removeDecorator('Label');
        $userId->setValue($identity->id);
        $this->addElement($userId);



        $publishDate = new ZendX_JQuery_Form_Element_DatePicker('publish_date');
        $publishDate->setLabel('publish_date');
        $publishDate->setValue(date('Y-m-d'));
        $publishDate->setJQueryParam('dateFormat','yy-mm-dd');

        $this->addElement($publishDate);

        $submitElement = new Zend_Form_Element_Submit('submit');
        $submitElement->setLabel('save');

        $this->addElement($submitElement);
    }
}