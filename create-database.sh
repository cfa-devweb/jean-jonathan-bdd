#!/bin/bash

mysql --local-infile=1 --user=root --host=localhost  -e 'create database if not exists library' -proot 

mysql --local-infile=1 --user=root --host=localhost  -proot < library.sql

echo "Database created"

#mysql -uroot -proot library

#source 'library.sql'

#show databases;

