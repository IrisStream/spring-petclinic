#!/bin/bash

echo "[ROLLBACK]"

ssh -i /var/jenkins_home/.ssh/remote_key remote_user@remote_host "/home/remote_user/deploy_scripts/restore_db.sh"
