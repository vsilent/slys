#!/bin/bash
# very simple migration script
# What it does:
# 1. It drops the database
# 2. Applies dump.sql from scripts/sql/dump.sql
# 3. Applies queries from scripts/migration.php by running php scripts/migration.php
# @todo: need application.ini parser for db connection details

database_user="root"
database_password=""
hostname='localhost'
database='slys'

echo Loading data files ...

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
echo "Migration complete."
