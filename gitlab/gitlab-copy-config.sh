#!/bin/bash
set -e
echo "***********************************************************"
echo "* GitLab Copy Customize Config File                       *"
echo "***********************************************************"
echo "[INFO] Copy 'gitlab.rb.template' to '/etc/gitlab/gitlab.rb'"
sudo cp gitlab.rb.template /etc/gitlab/gitlab.rb
echo "[ OK ]"
echo "[INFO] Reconfigure GitLab with the new cofig file..."
sudo gitlab-ctl reconfigure
echo "[ OK ]"
echo "[INFO] Restarting GitLab with the new config..."
sudo gitlab-ctl restart
echo "[ OK ]"
exit 0
