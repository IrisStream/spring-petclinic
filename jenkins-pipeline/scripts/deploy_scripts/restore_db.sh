#!/bin/bash

pushd /home/remote_user/deploy_scripts/

mysql -hmysql -upetclinic -ppetclinic petclinic < /home/remote_user/deploy_scripts/reset_db.sql

mysql -hmysql -upetclinic -ppetclinic petclinic < /home/remote_user/db_backup/*.sql

popd
