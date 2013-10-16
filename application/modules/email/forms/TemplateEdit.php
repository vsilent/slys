<?php
class Email_Form_TemplateEdit extends Zend_Form
{
    public function init()
    {
        $this->setMethod(self::METHOD_POST);
        //$this->setEnctype(self::ENCTYPE_MULTIPART);

        $lengthValidator = new Zend_Validate_StringLength();
        $lengthValidator->setMax(64);

        $sysnameRegexValidator = new Zend_Validate_Regex('/^([0-9a-z\_\-]+)$/');
        $sysnameRegexValidator->setMessage('invalid_sysname_error_message', Zend_Validate_Regex::NOT_MATCH);

        $sysname= new Zend_Form_Element_Text('sysname');
        $sysname->setLabel('sys');
        $sysname->setAllowEmpty(false);
        $sysname->setRequired();
        $sysname->addValidator($lengthValidator);
        $sysname->addValidator($sysnameRegexValidator);
        $sysname->setAttrib('maxlength', 64);
        $this->addElement($sysname);

        $lengthValidator = new Zend_Validate_StringLength();
        $lengthValidator->setMax(255);
        $subject = new Zend_Form_Element_Text('subject');
        $subject->setLabel('subject');
        $subject->setAllowEmpty(false);
        $subject->setRequired();
        $subject->addValidator($lengthValidator);
        $subject->setAttrib('maxlength', 255);
        $this->addElement($subject);


        $lengthValidator = new Zend_Validate_StringLength();
        $lengthValidator->setMax(64);
        $from = new Zend_Form_Element_Text('email_from');
        $from->setLabel('from');
        $from->setAllowEmpty(true);
        //$from->setRequired();
        $from->addValidator($lengthValidator);
        $from->setAttrib('maxlength', 64);
        $this->addElement($from);

        $lengthValidator = new Zend_Validate_StringLength();
        $lengthValidator->setMax(255);
        $reply_to = new Zend_Form_Element_Text('reply_to');
        $reply_to->setLabel('reply_to');
        $reply_to->setAllowEmpty(true);
        //$reply_to->setRequired();
        $reply_to->addValidator($lengthValidator);
        $reply_to->setAttrib('maxlength', 255);
        $this->addElement($reply_to);

        $message = new Zend_Form_Element_Textarea('message');
        $message->setLabel('message');
        $message->setRequired(true);
        $this->addElement($message);

        $save = new Zend_Form_Element_Submit('save');
        $save->setLabel('save');
        $this->addElement($save);
    }
}

