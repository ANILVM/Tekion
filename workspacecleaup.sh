#!/bin/bash
used=$(df -Ph | grep '/dev/sda1' | awk {'print $5'})
max=80%
if [ ${used%?} -ge ${max%?} ]; then
echo "The Mount "/DB" on $(hostname) has used $used at $(date)" | mail -s "Disk space alert on $(hostname): $used used" anilvm09@gmail.com
rm -rf /path/workspace/*
docker image prune -a
fi
