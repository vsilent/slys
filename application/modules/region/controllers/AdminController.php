<?php
/**
 * Description
 *
 * @author Serghei Ilin <criolit@gmail.com>
 * @version $Id$
 */
class Region_AdminController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->view->regions = Region_Model_DbTable_Region::getInstance()->findAll();
    }

    public function citiesAction()
    {
        $this->view->cities = Region_Model_DbTable_City::getInstance()->findAll();
    }

    public function editRegionAction()
    {
        $form = new Region_Form_Region();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($this->getRequest()->getPost())) {
                $region = new Region_Model_Mapper_Region();

                $values = $form->getValues();

                if (empty($values['id']) === false)
                    $region->assignIdentifier($values['id']);

                unset($values['id']);

                $region->fromArray($values);
                $region->save();

                $this->_redirect($this->view->url(array('module' => 'region', 'controller' => 'admin', 'action' => 'index')));
            }
        } else {
            $regionId = $this->getRequest()->getParam('id');

            if (empty($regionId) === false) {
                $region = Region_Model_DbTable_Region::getInstance()->find($regionId);
                $form->populate( $region->toArray() );
            }
        }

        $this->view->regionForm = $form;
    }

    public function editCityAction()
    {
        $form = new Region_Form_City();

        if ($this->getRequest()->isPost()) {
            if ($form->isValid($this->getRequest()->getPost())) {
                $city = new Region_Model_Mapper_City();

                $values = $form->getValues();

                if (empty($values['id']) === false)
                    $city->assignIdentifier($values['id']);

                unset($values['id']);

                $city->fromArray($values);
                $city->save();

                $this->_redirect($this->view->url(array('module' => 'region', 'controller' => 'admin', 'action' => 'cities')));
            }
        } else {
            $cityId = $this->getRequest()->getParam('id');

            if (empty($cityId) === false) {
                $city = Region_Model_DbTable_City::getInstance()->find($cityId);
                $form->populate( $city->toArray() );
            }
        }

        $this->view->cityForm = $form;
    }

    public function deleteRegionAction()
    {
        $id = $this->getRequest()->getParam('id');

        if (empty($id) === false) {
            $region = Region_Model_DbTable_Region::getInstance()->find($id);
            if (empty($region) === false)
                $region->delete();
        }

        $this->_redirect($this->view->url(array('module' => 'region', 'controller' => 'admin', 'action' => 'index')));
    }

    public function deleteCityAction()
    {
        $id = $this->getRequest()->getParam('id');

        if (empty($id) === false) {
            $city = Region_Model_DbTable_City::getInstance()->find($id);
            if (empty($city) === false)
                $city->delete();
        }

        $this->_redirect($this->view->url(array('module' => 'region', 'controller' => 'admin', 'action' => 'cities')));
    }
}