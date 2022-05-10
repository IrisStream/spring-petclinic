#!/bin/bash

RESPONCE="$(curl -s --head --request GET deploy:8080 | grep 200)"

echo "Responce: $RESPONCE"

if [ -z "$RESPONCE" ] || [ $TEST_ROLLBACK ];
then
    ./jenkins-pipeline/scripts/rollback.sh
else
    echo "Health check fine!"
fi
