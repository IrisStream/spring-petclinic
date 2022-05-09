#!/bin/bash

RESPONCE="$(curl -s --head --request GET deploy:8080 | grep 200)"

if [ $RESPONCE ]; then
    echo "Don't rollback"
else
    ./jenkins-pipeline/scripts/rollback.sh
fi
