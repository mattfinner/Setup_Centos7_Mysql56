#!/bin/bash
# exit script if error
set -e

# Create mysql data folder and sub folders
echo "*** Create data folders ***"
mkdir -p /data/mysql/binlogs
mkdir -p /data/mysql/backups/FULL
mkdir -p /data/mysql/backups/LOGS
mkdir -p /data/mysql/scripts
mkdir -p /data/mysql/logs
chown -R mysql:mysql /data/mysql

# Enable binary logs
echo "*** Enable binary logs ***"
sed -i '/\[mysqld\]/a log-bin = "/data/mysql/binlogs/binlog"' /etc/my.cnf

# Change data location
#echo "*** Changing data location ***"
systemctl stop mysqld
#sed -i 's/var\/lib\/mysql/data\/mysql\/data/g' /etc/my.cnf
#mv /var/lib/mysql/* /data/mysql/data
systemctl start mysqld
