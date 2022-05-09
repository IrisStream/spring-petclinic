DEPLOY_NAME=$1

export DOCKER_HOST="tcp://172.20.0.1:2375"

if [ "$(docker ps -aq -f name=deploy)" ]; then 
	if (("$(docker container inspect -f '{{.State.Running}}' deploy)" == true)); then
        docker stop deploy
	fi
	docker rm deploy
fi

pushd /home/remote_user/deploy_scripts

curl -X GET -u deployment:123 http://nexus:8081/repository/maven-snapshots/org/springframework/samples/spring-petclinic/2.6.0-SNAPSHOT/maven-metadata.xml -O

DEPLOY_IMAGE_NAME=$(python3 get_name_of_snapshot.py)

docker build --build-arg JAR_NAME=${DEPLOY_IMAGE_NAME} -t $DEPLOY_IMAGE_NAME --network=jenkins_lab_jenkins_net .

./backup_db.sh $DEPLOY_IMAGE_NAME

docker run -e SPRING_PROFILES_ACTIVE=mysql -d -p 8083:8080 --name deploy --network jenkins_lab_jenkins_net $DEPLOY_IMAGE_NAME

popd
