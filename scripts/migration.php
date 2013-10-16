<?php

/**
 * Description
 *
 * @author Serghei Ilin <criolit@gmail.com>
 * @version $Id: migration.php 510 2011-06-23 12:20:31Z criolit $
 */
defined('ROOT_PATH') or define('ROOT_PATH', dirname(dirname(__FILE__)));
defined('APPLICATION_PATH') or define('APPLICATION_PATH', ROOT_PATH.'/application');
defined('APPLICATION_ENV') or define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'development'));

set_include_path(
        implode(
                PATH_SEPARATOR, array(
            realpath(ROOT_PATH.'/library'),
            get_include_path(),
                )
        )
);

require_once 'Zend/Application.php';

$application = new Zend_Application(
                APPLICATION_ENV,
                APPLICATION_PATH.'/configs/application.ini'
);

Zend_Controller_Front::getInstance()->setParam(
    'bootstrap',
    $application->bootstrap()->getBootstrap()
);


echo "Reindex MCA...";
$reindexStart = microtime(1);

$sysmapRoot = Sysmap_Model_DbTable_Sysmap::getInstance()->find(1);
$sysmapRoot->index_date = '1970-01-01 00:00:00';
$sysmapRoot->save();

Sysmap_Model_Map::getInstance()->reindexMCA();

printf(" finished in %0.6f sec. \r\n",(microtime(1)-$reindexStart));

/**
 * AFTER THIS COMMENT GOES YOUR CODE! PLEASE WRITE THE AUTHOR OF THE CODE!
 */

//Product_Model_DbTable_Product::getInstance()->export();
//Product_Model_DbTable_Category::getInstance()->export();
//Product_Model_DbTable_Image::getInstance()->export();
//Page_Model_DbTable_Page::getInstance()->export();
//Banner_Model_DbTable_Banner::getInstance()->export();
//News_Model_DbTable_News::getInstance()->export();
//Comment_Model_DbTable_Comment::getInstance()->export();

/**
 * END OF THE MIGRATION PHP CODE
 */

Navigation_Model_Navigation::getInstance()->clearCache();
