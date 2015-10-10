#!/bin/bash
# exit script if error
set -e

# Update yum
echo "*** Update yum ***"
yum -y update

# Install MySQL repo and package
echo "*** Installing MySQL ***"
yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server
yum -y install mysql-utilities

# Configuration of install
echo "*** Running MySQL config ***"
mysql_install_db --user=mysql #--basedir=/opt/mysql/mysql --datadir=/opt/mysql/mysql/data

# Remove access to filesystem from MySQL
echo "*** Removing access to filesystem ***"
sed -i '/\[mysqld\]/a local-infile=0' /etc/my.cnf

# Lockdown connections to localhost only - requires app connects through SSH (off by default)
echo "*** Locking down connections to localhost ***"
sed -i '/\[mysqld\]/a #bind-address = 127.0.0.1' /etc/my.cnf

# Start MySQL daemon and set tp run at startup
echo "*** Starting to MySQL and setting to run ***"
systemctl start mysqld
systemctl enable mysqld

# Lock down
echo "*** Secure the MySQL installation ***"
mysql_secure_installation
