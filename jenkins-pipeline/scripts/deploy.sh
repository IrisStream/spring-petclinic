#!/bin/bash

#Remote to deploy node

scp -i /var/jenkins_home/.ssh/remote_key scripts/deploy_scripts/* remote_user@remote_host:/home/remote_user/

ssh -i /var/jenkins_home/.ssh/remote_key remote_user@remote_host "/home/remote_user/run_jar.sh"
