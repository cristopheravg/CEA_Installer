#!/bin/bash
clear

echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::   OBER TECHNOLOGY MASTER   ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo ""
echo "	 POR FAVOR ASEGÚRESE DE QUE CUENTA CON CONEXIÓN A INTERNET," 
echo "	 DE LO CONTRARIO NO SE PODRÁ CONTINUAR CON LA INSTALACIÓN"
echo ""
echo "	        Junio de 2019    || 	Ver. 1.0"
echo ""
echo ""
echo ""
echo ""
echo "  PRIMER PASO : ACTUALIZACIÓN DE REPOSITORIOS DEL SISTEMA ::::::  "
add-apt-repository universe
add-apt-repository ppa:linuxuprising/java

apt update

clear
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::    OBER TECHNOLOGY MASTER    ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo " SEGUNDO PASO : ACTUALIZACIÓN DE SOFTWARE DE SISTEMA :::::::::::  "
apt upgrade -y


clear
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::    OBER TECHNOLOGY MASTER    ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo " TERCER PASO : INSTALANDO APACHE2 WEBSERVER "
apt install apache2 -y



clear
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::    OBER TECHNOLOGY MASTER    ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo "CUARTO PASO : INSTALANDO PHP "
apt install php libapache2-mod-php php-mysql -y

clear
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::    OBER TECHNOLOGY MASTER    ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo "QUINTO PASO : INSTALANDO MYSQL SERVER"

apt install mysql-server -y
service mysql stop
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld
gnome-terminal -e 'mysqld_safe --skip-grant-tables'

mysql -u root<<MY_QUERY
USE mysql; 
UPDATE user SET authentication_string=PASSWORD("OBERTECH") where User='root';
UPDATE user SET plugin="mysql_native_password"; 
FLUSH PRIVILEGES; 
quit;
MY_QUERY



service mysql stop
echo "DETENIEDO SERVIDOR MYSQL"
pkill mysqld &
service mysql start
echo "INICIANDO SERVIDOR MYSQL"


clear
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::    OBER TECHNOLOGY MASTER    ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo "SEXTO PASO :  INSTALANDO JAVA 12"
#apt install phpmyadmin php-mbstring php-gettext -y
apt install oracle-java12-set-default -y




clear
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::    OBER TECHNOLOGY MASTER    ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo ""
echo "IMPORTANDO BASE DE DATOS DEL SISTEMA"

mysql -u root --password="OBERTECH"<<MY_QUERY
CREATE DATABASE ceautomotriz;
#SHOW DATABASES;
USE ceautomotriz
SOURCE /home/otm/.CEA/installer/ceautomotriz.sql;
quit;
MY_QUERY

echo "LA BASE DE DATOS FUE INSTALADA."


clear
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo "  ::::::::::::::::    OBER TECHNOLOGY MASTER    ::::::::::::::::  "
echo "  ::::::::::: Instalación del sistema de archivos ::::::::::::::  "
echo "  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  "
echo ""
echo ""
echo " 	INSTALANDO EL SOFTWARE DEL SISTEMA. ESPERE	   :::::::::::  "

mkdir $HOME/.CEA
chmod -R 777 $HOME/.CEA
#cp "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/CEA/* /$HOME/.CEA

cp "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/* $HOME/.CEA

