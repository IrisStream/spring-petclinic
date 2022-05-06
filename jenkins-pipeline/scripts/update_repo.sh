#!/bin/bash

echo "[UPDATE REPOSITORY]"

eval "$(ssh-agent -s)"
ssh-add /var/jenkins_home/.ssh/github-key
git -C /var/jenkins_home/src/spring-petclinic pull origin main