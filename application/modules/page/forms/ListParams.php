<?php
/**
 * @version $Id: Edit.php 54 2011-01-10 16:11:50Z zak $
 */

/**
 * Provides parameters list for products list action
 */
class Page_Form_ListParams extends Zend_Form_SubForm
{
    public function init()
    {
        $page = new Zend_Form_Element_Select('pagename');
        $page->setLabel('title');
        $page->setAllowEmpty(false)
             ->setRequired(true);

        $pagesList = Page_Model_DbTable_Page::getInstance()->getList();

        $page->addMultiOption('', '');

        foreach ($pagesList as $pageMapper)
            $page->addMultiOption($pageMapper->sysname, $pageMapper->title);

        $this->addElement($page);
    }
}