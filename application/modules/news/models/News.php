<?php
class News_Model_News
{
    /** @var null|News_Model_News */
    private static $_instance = null;

    /**
     * @static
     * @return News_Model_News
     */
    public static function getInstance()
    {
        if (self::$_instance === null)
            self::$_instance = new self;
        return self::$_instance;
    }

    //protected function __construct()
    //{

    //}

    public function getList($userId = null)
    {
        $dql = News_Model_DbTable_News::getInstance()->createQuery();

        if($userId !== null)
            $dql->addWhere('user_id = ?', $userId);

        return $dql->execute();

    }

    /**
     * @param $sysname sysname of news
     * @return News_Model_Mapper_News
     */
    public function getNewsBySysname($sysname) {
        return News_Model_DbTable_News::getInstance()->findOneBy('sysname', $sysname);
    }



}
