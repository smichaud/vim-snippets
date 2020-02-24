#!/usr/bin/env bash

# To enable sync, use `crontab -e` and add this line:
# */5 * * * * /home/smichaud/Workspace/vim-snippets/sync.sh
# Note: will be sync every 5 minutes in this case

cd "$(dirname "$0")"

log_file="/home/smichaud/Desktop/vim-snippets-sync.log"

eval `ssh-agent` $>> $log_file
ssh-add /home/smichaud/.ssh/github $>> $log_file

git pull &>> $log_file
git commit -am "[$(date)] Updated by the cron job from $(hostname)" &>> $log_file
git push origin master &>> $log_file

