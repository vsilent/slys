mysql.exe -u root -proot -e "SET CHARACTER SET 'utf8';"
mysql.exe -u root -proot -e "SET NAMES 'utf8';"
mysql.exe -u root -proot -e "DROP DATABASE IF EXISTS slys;"
mysql.exe -u root -proot -e "CREATE DATABASE `slys` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql.exe -u root -proot -e "use slys; source ../scripts/sql/dump.sql;"

php ../scripts/migration.php
