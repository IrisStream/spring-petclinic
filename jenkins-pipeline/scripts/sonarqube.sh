#!/bin/bash

echo "[SONARQUBE STAGE]"

docker run -v $MVN_LOCAL_REPO:/root/.m2 -v $SRC_REPO:/root/src --network $NETWORK -w /root/src/ $DOCKER_IMAGE \
        mvn clean verify sonar:sonar -Dsonar.projectKey=spring-clinic -Dsonar.login=058412b02ecd2ec23c1c9604d378b0bfe3ec03ad
