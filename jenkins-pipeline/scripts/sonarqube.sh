#!/bin/bash

echo "[SONARQUBE STAGE]"

docker run -v $MVN_LOCAL_REPO:/root/.m2 -v $SRC_REPO:/root/src --network $NETWORK -w /root/src/spring-petclinic $DOCKER_IMAGE \
        mvn clean verify sonar:sonar -Dsonar.projectKey=spring-clinic -Dsonar.login=75b1252e90978b12cb4b82675713ae2b353306d7
