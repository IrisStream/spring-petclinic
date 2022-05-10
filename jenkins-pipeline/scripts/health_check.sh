#!/bin/bash

RESPONCE="$(curl -s --head --request GET deploy:8080 | grep 200)"

echo "Responce: $RESPONCE"

./jenkins-pipeline/scripts/rollback.sh
if [$RESPONCE == "" ] || [$TEST_ROLLBACK]
    ./jenkins-pipeline/scripts/rollback.sh
else
    echo "Health check fine!"
fi
