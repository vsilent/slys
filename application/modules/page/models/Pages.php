<?php
class Page_Model_Pages
{

    /**
     * @param int $pageId
     * @return Mapper_Page
     */
    public function getPageById($pageId) {
        return Page_Model_DbTable_Page::getInstance()->findOneBy('id',$pageId);
    }

    /**
     * @param string $sysname
     * @return Mapper_Page
     */
    public function getPageBySysname($sysname) {
        return Page_Model_DbTable_Page::getInstance()->findOneBy('sysname',$sysname);
    }

    public function getList()
    {
        return Page_Model_DbTable_Page::getInstance()->getList();
    }
}