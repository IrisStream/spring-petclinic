#!/bin/bash

FILE=$(ls /home/remote_user/db_backup)

OLD_VERSION=${FILE%.sql}

pushd /home/remote_user/deploy_scripts/

# Restore database
mysql -hmysql -upetclinic -ppetclinic petclinic < reset_db.sql

mysql -hmysql -upetclinic -ppetclinic petclinic < ../db_backup/$OLD_VERSION.sql

# Restore web app

export DOCKER_HOST="tcp://172.20.0.1:2375"

if [ "$(docker ps -aq -f name=deploy)" ]; then 
	if (("$(docker container inspect -f '{{.State.Running}}' deploy)" == true)); then
        docker stop deploy
	fi
	docker rm deploy
fi

docker run -e SPRING_PROFILES_ACTIVE=mysql -d -p 8083:8080 --name deploy --network jenkins_lab_jenkins_net $OLD_VERSION

popd
