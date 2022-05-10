#!/bin/bash

#Remote to deploy node

scp -i /var/jenkins_home/.ssh/remote_key -r jenkins-pipeline/scripts/deploy_scripts/ remote_user@remote_host:/home/remote_user/

ssh -i /var/jenkins_home/.ssh/remote_key remote_user@remote_host "/home/remote_user/deploy_scripts/run_jar.sh"
