#!/bin/bash
used=$(df -Ph | grep '/dev/mapper/vg_2g-lv_dbs' | awk {'print $5'})
max=80%
if [ ${used%?} -ge ${max%?} ]; then
echo "The Mount Point "/DB" on $(hostname) has used $used at $(date)" | mail -s "Disk space alert on $(hostname): $used used" anilvm09@gmail.com
rm -rf /path/workspace/*
docker image prune -a
fi