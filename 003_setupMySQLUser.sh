#!/bin/bash
# exit script if error
set -e

# Create user and test database
mysql --user="root" --password="Harewood21" --execute="GRANT ALL PRIVILEGES ON *.* TO 'matt'@'localhost' IDENTIFIED BY 'Harewood21' WITH GRANT OPTION;
CREATE DATABASE sakila"

mysql --user="root" --password="Harewood21" sakila < ./sakila-schema.sql
mysql --user="root" --password="Harewood21" sakila < ./sakila-data.sql

# Make sure performance_schema owned by mysql
chown -R mysql:mysql /var/lib/mysql/performance_schema/
