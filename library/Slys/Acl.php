<?php

class Slys_Acl extends Zend_Acl
{
    /**
     * Caller context
     * @var Slys_Acl_Caller
     */
    protected $callerContext;
    
    /**
     * Default acl role
     * @var string 
     */
    protected $defaultRole;
    /**
     * Check if allowed current request
     * @param string $action
     * @param string $controller
     * @param string $module
     * @param string $params
     * @return boolean
     */
    public function isAllowed($role = null, $resource = null, $privilege = null)
    {
        if(empty($role))
            $role = $this->defaultRole;
        
        if($this->has($resource))
            $allow = parent::isAllowed($role, $resource, $privilege);
        
        if(!$this->has($resource) || ($allow === false && $this->has($resource))) {
            $apiRequest = new Slys_Api_Request($this->callerContext,
                                                'sysmap.get-item-parents-by-identifier',
                                                array('identifier'=>$resource));
            
            $sysmap = $apiRequest->proceed()->getResponse()->getFirst();

            if(empty($sysmap))
                return false;

            foreach($sysmap as $parentResource) {

                $parentItem = $parentResource->getMapIdentifier();

                if(empty($parentItem))
                    continue;
                
                if($parentResource == $parentItem)
                    return false;
                
                if(!$this->has($parentItem)) {
                    $this->addResource($parentItem);
                    $this->callerContext->setRules($role, array($parentItem));
                }
                
                $allow = parent::isAllowed($role, $parentItem, $privilege);                
                
                if($allow)
                    return true;
            }

           return false;
        }
        return $allow;
    }
    
    /**
     * Set default role
     * @param string $role
     * @return Slys_Acl 
     */
    public function setDefaultRole($role)
    {
        $this->defaultRole = $role;
        return $this;
    }
    
    /**
     * Set caller context
     * @param object $context
     * @return Slys_Acl 
     */
    public function setCallerContext(Slys_Acl_Caller $context)
    {
        $this->callerContext = $context;
        return $this;
    }

}
