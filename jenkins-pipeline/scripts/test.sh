#!/bin/bash

echo "[TESTING STAGE]"

docker run -v $MVN_LOCAL_REPO:/root/.m2 -v $SRC_REPO:/root/src --network $NETWORK -w /root/src/ $DOCKER_IMAGE \
	mvn test