<?php
class Banner_Model_Banners
{
    const TYPE_TEXT = 'text';
    const TYPE_IMAGE = 'image';
    const TYPE_FLASH = 'flash';

    const TYPE_TEXT_VALUE = 'Текстовой блок';
    const TYPE_IMAGE_VALUE = 'Изображение';
    const TYPE_FLASH_VALUE = 'Флеш';

    /**
     * @param int $id
     * @return Mapper_Page
     */
    public function getItemById($id) {
        return Banner_Model_DbTable_Banner::getInstance()->findOneBy('id', $id);
    }

    /**
     * @param string $sysname
     * @return Mapper_Page
     */
    public function getBannerBySysname($sysname) {
        return Banner_Model_DbTable_Banner::getInstance()->findOneBy('sysname', $sysname);
    }

    public function getList()
    {
        return Banner_Model_DbTable_Banner::getInstance()->getList();
    }

    public static function getTypes()
    {

    }

    public static function getTypeByCode($code='')
    {
      switch ($code)
      {
        case (self::TYPE_TEXT):   $value = self::TYPE_TEXT_VALUE; break;
        case (self::TYPE_IMAGE):  $value = self::TYPE_IMAGE_VALUE; break;
        case (self::TYPE_FLASH):  $value = self::TYPE_FLASH_VALUE; break;
        default: $value = ''; break;
      }
      return $value;

    }


    public static function getSource(Banner_Model_Mapper_Banner $banner)
    {
      return '/images/banners/'.$banner->src;
    }

}