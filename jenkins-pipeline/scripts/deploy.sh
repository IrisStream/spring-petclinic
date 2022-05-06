#!/bin/bash

#Remote to deploy node

scp -i /var/jenkins_home/.ssh/remote_key scripts/deploy_dockerfile remote_user@remote_host:/home/remote_user/Dockerfile

scp -i /var/jenkins_home/.ssh/remote_key scripts/get_name_of_snapshot.py remote_user@remote_host:/home/remote_user/

scp -i /var/jenkins_home/.ssh/remote_key scripts/run_jar.sh remote_user@remote_host:/home/remote_user/

ssh -i /var/jenkins_home/.ssh/remote_key remote_user@remote_host "/home/remote_user/run_jar.sh"
