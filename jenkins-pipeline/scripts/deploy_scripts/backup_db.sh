#!/bin/bash

VERSION=$1

rm -rf /home/remote_user/db_backup/*

mysqldump --single-transaction --no-tablespaces -hmysql -upetclinic -ppetclinic petclinic > /home/remote_user/db_backup/$VERSION.sql
