<?php
/**
 * @version $Id: Edit.php 54 2011-01-10 16:11:50Z zak $
 */

/**
 * Provides parameters list for products list action
 */
class News_Form_ListParams extends Zend_Form_SubForm
{
    public function init()
    {
        $page = new Zend_Form_Element_Select('newsname');
        $page->setLabel('title');
        $page->setAllowEmpty(false)
             ->setRequired(true);

        $pagesList = News_Model_News::getInstance()->getList(Zend_Auth::getInstance()->getIdentity()->id);

        $page->addMultiOption('', '');

        foreach ($pagesList as $pageMapper)
            $page->addMultiOption($pageMapper->sysname, $pageMapper->title);

        $this->addElement($page);
    }
}