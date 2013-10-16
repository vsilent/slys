#!/bin/bash
# very simple installation script
# @todo: improvements

CURRENT=`pwd`
BASEPATH=`basename $CURRENT`

setup()
{
	echo "Please enter project name:"
	read project
	if [ -z "$project" ]
	then
		setup
	fi
	echo "Please enter your database hostname, (default: localhost):"
	read hostname
	if [ -z "$hostname" ]
	then
		hostname=localhost
	fi
	echo "Please note that this script can not create database"
	echo "if provided user has no 'Drop/Create' privileges."

	echo "Please enter database name:"
	read database
	echo "Please enter database user:"
	read database_user
	echo "Please enter database password:"
	read database_password
	if [ -z "$hostname" ]
	then
		database_password=""
	fi
	#echo "Please enter database admin login (default: root):"
	#read database_admin_login
	#if [ -z "$database_admin_login" ]
	#then
		#database_admin_login=root
	#fi
	#echo "Please enter database admin password (default is empty):"
	#read database_admin_password
	#if [ -z "$database_admin_password" ]
	#then
		#database_admin_password=
	#fi

	echo "Activate Sly's platform ? (yes/no) :"
	read activate_slys
	if [ -z "$activate_slys" ]
	then
		activate_slys=yes
	fi
	return;
}

#run setup
setup

BASECONF='

[production]

;SlyS activation
pluginpaths.Slys_Application_Resource_ = "Slys/Application/Resource"
pluginpaths.ZendX_Application_Resource_ = "ZendX/Application/Resource"

resources.slys.config = "'${project}'"

phpSettings.display_startup_errors = 0
phpSettings.display_errors = 0

includePaths.library = APPLICATION_PATH "/../library"

bootstrap.path = APPLICATION_PATH "/Bootstrap.php"
bootstrap.class = "Bootstrap"
appnamespace = "Application"

resources.frontController.controllerDirectory = APPLICATION_PATH "/controllers"
resources.frontController.moduleDirectory = APPLICATION_PATH "/modules"
resources.frontController.params.displayExceptions = 0
resources.frontController.baseUrl = ""
resources.debug.enabled = false
resources.translate.adapter = ini
resources.translate.content = APPLICATION_PATH "/../data/locales/en_US.ini"

[staging : production]

[testing : production]
phpSettings.display_startup_errors = 1
phpSettings.display_errors = 1

[development : production]
phpSettings.display_startup_errors = 1
phpSettings.display_errors = 1
resources.debug.enabled = true
[windows : development]'

PROJECTCONF='
[production]
resources.doctrine.dsn.doctrine = "mysql://'${database_user}:${database_password}'@'${hostname}'/'${database}'"
resources.doctrine.current = "doctrine"
navigation.cache.enabled = TRUE

resources.Jquery.uiversion = 1.8.19
resources.Jquery.version = 1.7.2
resources.Jquery.localpath = "/themes/default/js/jquery/jquery.min.js"
resources.Jquery.enable = true
resources.Jquery.uienable = true
resources.Jquery.enable = true
resources.Jquery.uilocalpath = "/themes/default/js/jquery/jquery-ui-1.8.19.custom.min.js";
resources.Jquery.stylesheet = "/themes/default/css/smoothness/jquery-ui-1.8.19.custom.css"

resources.mail.transport.type = smtp
resources.mail.transport.host = "smtp.gmail.com"
resources.mail.transport.port = 587
resources.mail.transport.ssl = "tls"
resources.mail.transport.auth = "login"
resources.mail.transport.username = ""
resources.mail.transport.password = ""

resources.cachemanager.main.frontend.name = Core
resources.cachemanager.main.frontend.customFrontendNaming = false
resources.cachemanager.main.frontend.options.lifetime = 7200
resources.cachemanager.main.frontend.options.automatic_serialization = true

resources.cachemanager.main.backend.name = File
resources.cachemanager.main.backend.customBackendNaming = false
resources.cachemanager.main.backend.options.cache_dir = APPLICATION_PATH "/../data/cache"
resources.cachemanager.main.frontendBackendAutoload = false

[development : production]
resources.doctrine.dsn.doctrine = "mysql://'${database_user}:${database_password}'@'${hostname}'/'${database}'"
navigation.cache.enabled = true

[windows : development]
navigation.cache.frontend.name = "Core"
navigation.cache.frontend.options.cache_dir = APPLICATION_PATH "/../data/cache"
navigation.cache.frontend.options.automatic_serialization = "true"
navigation.cache.backend.name = "File"
navigation.cache.backend.options.cache_dir = APPLICATION_PATH "/../data/cache"
navigation.cache.backend.options.automatic_serialization = "true"

templater.enabled = 1
templater.directory = APPLICATION_PATH "/../public/themes"
templater.view.directory = "views"
templater.layout.directory = "layouts"
templater.layout.default = "index"
templater.layout.admin = "admin"
templater.layout.encoding = "utf-8"
user.acl.config = APPLICATION_PATH "/configs/acl.ini"
'
PROJECTCONF_DIR="../application/configs/${project}/"


if [ -d "$PROJECTCONF_DIR" ] ; then
	echo "Directory already exists.. skipping"
else
	echo "Creating $PROJECTCONF_DIR .."
	mkdir ../application/configs/${project}/
	chmod -R 02775 ../application/configs/${project}/
fi

if [ -d "$PROJECTCONF_DIR" ] && [ -w "$PROJECTCONF_DIR" ] ; then
	if [ -e "../application/configs/application.ini" ] ; then
		echo "Configuration already set..  skipping"
	else
		touch ../application/configs/application.ini
		touch ../application/configs/${project}/application.ini
		#chmod 02775 ../application/configs/application.ini
		echo "${BASECONF}" >../application/configs/application.ini
		echo "${PROJECTCONF}" >../application/configs/${project}/application.ini
	fi
fi

chmod -R 0777 ../data
chmod -R 0777 ../tmp
#chmod -R 02775 uploads

echo Loading data files ...

#mysql -Be "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, CREATE ROUTINE ON \`"$UN"\\_"$database"\`.* TO '"$UN"_"$database_user"'@'localhost' IDENTIFIED BY '$database_password';FLUSH PRIVILEGES"


#if [ -z "$database_admin_password" ]
#then
	#mysql -u${database_admin_login} -e "SET CHARACTER SET 'utf8';"
	#mysql -u${database_admin_login} -e "SET NAMES 'utf8';"
	#mysql -u${database_admin_login} -e "DROP DATABASE IF EXISTS ${database};"
	#mysql -u${database_admin_login} -e "CREATE DATABASE ${database} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
	#mysql -u${database_admin_login} -e "use  ${database}; source ../scripts/sql/dump.sql;"
#else
	#mysql -u${database_admin_login} -p ${database_admin_password} -e "SET CHARACTER SET 'utf8';"
	#mysql -u${database_admin_login} -p ${database_admin_password}  -e "SET NAMES 'utf8';"
	#mysql -u${database_admin_login} -p ${database_admin_password}  -e "DROP DATABASE IF EXISTS ${database};"
	#mysql -u${database_admin_login} -p ${database_admin_password}  -e "CREATE DATABASE ${database} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
	#mysql -u${database_admin_login} -p ${database_admin_password}  -e "use  ${database}; source ../scripts/sql/dump.sql;"
#fi
#mysql -u${database_admin_login} -p ${database_admin_password} -e "SET CHARACTER SET 'utf8';"
#mysql -u${database_admin_login} -p ${database_admin_password}  -e "SET NAMES 'utf8';"
#mysql -u${database_admin_login} -p ${database_admin_password}  -e "DROP DATABASE IF EXISTS ${database};"
#mysql -u${database_admin_login} -p ${database_admin_password}  -e "CREATE DATABASE ${database} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
if [ -z "$database_password" ]
then
	sql=`mysql -u${database_user} -h${hostname} -e "SET CHARACTER SET 'utf8';"`
	sql=`mysql -u${database_user} -h${hostname} -e "SET NAMES 'utf8';"`
	sql=`mysql -u${database_user} -h${hostname} -e "DROP DATABASE IF EXISTS ${database};"`
	sql=`mysql -u${database_user} -h${hostname} -e "CREATE DATABASE ${database} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"`
	sql=`mysql -u${database_user} -h${hostname} -e "use  ${database}; source ../scripts/sql/dump.sql;"`
else
	sql=`mysql -u${database_user} -p${database_password} -h${hostname} -e "SET CHARACTER SET 'utf8';"`
	sql=`mysql -u${database_user} -p${database_password} -h${hostname} -e "SET NAMES 'utf8';"`
	sql=`mysql -u${database_user} -p${database_password} -h${hostname} -e "DROP DATABASE IF EXISTS ${database};"`
	sql=`mysql -u${database_user} -p${database_password} -h${hostname} -e "CREATE DATABASE ${database} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"`
	sql=`mysql -u${database_user} -p${database_password} -h${hostname} -e "use  ${database}; source ../scripts/sql/dump.sql;"`
fi

$sql
php ../scripts/migration.php

echo "Setup complete!"
