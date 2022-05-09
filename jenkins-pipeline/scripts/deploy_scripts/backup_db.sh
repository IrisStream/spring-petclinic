#!/bin/bash

VERSION=$1

mysqldump --single-transaction --no-tablespaces -hmysql -upetclinic -ppetclinic petclinic > /var/jenkins_home/db_backup/$VERSION.sql
