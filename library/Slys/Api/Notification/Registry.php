<?php
/**
 * @version $Id: Registry.php 1332 2012-04-18 09:41:05Z jabberroid@gmail.com $
 */

/**
 * Registry
 *
 * Instance of this registry is passed to publishNotifications of your bootstrap
 */
class Slys_Api_Notification_Registry
{
    /**
     * List of registered notifications
     * @var array
     */
    private $_notifications = array();

    /**
     * Register notification
     *
     * Registers notification
     *
     * @param string $notificationName
     * @return void
     */
    public function register($notificationName)
    {
        $notificationName = $this->_escapeNotificationName($notificationName);

        if(in_array($notificationName, $this->_notifications)) {
            user_error("Notification '$notificationName' already registered", E_USER_WARNING);
        } else {
            $this->_notifications[] = $notificationName;
        }
    }

    /**
     * Get registered notifications
     *
     * Retrieves all registered notifications
     *
     * @link http://wiki.optimum-web.com/doku.php/slys:manual:library
     * @return array
     */
    public function getNotifications()
    {
        return $this->_notifications;
    }


    /**
     * Escapes notification name to be same
     * <p>
     * - trim spaces <br>
     * - convert to lower case
     * </p>
     *
     * @param string $notificationName
     * @return string
     */
    private function _escapeNotificationName($notificationName)
    {
        return strtolower( trim($notificationName) );
    }

    /**
     * Check if notification is registered
     *
     * @param string $notificationName
     * @link http://wiki.optimum-web.com/doku.php/slys:manual:library
     * @return bool
     */
    public function isRegistered($notificationName)
    {
        $notificationName = $this->_escapeNotificationName($notificationName);
        return in_array($notificationName, $this->_notifications);
    }
}
