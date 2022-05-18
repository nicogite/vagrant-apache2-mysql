#!/usr/bin/env bash

DBHOST=localhost
DBNAME=dbname
DBUSER=dbuser
DBPASSWD=userpass

# Update package repository and install tools
apt-get update
apt-get install vim curl build-essential python-software-properties git

# Predefine answers for mysql server installation
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

# install mysql

apt-get -y install mysql-server

mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASSWD'"

cd /vagrant

# update mysql conf file to allow remote access to the db

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# restart mysql service

sudo service mysql restart