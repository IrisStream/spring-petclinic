#!/bin/bash

echo "[DEPLOY TO NEXUS REPOSITORY]"

docker run -v $MVN_LOCAL_REPO:/root/.m2 -v $SRC_REPO:/root/src --network $NETWORK -w /root/src/spring-petclinic $DOCKER_IMAGE \
	mvn deploy