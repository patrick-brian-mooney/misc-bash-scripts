#!/bin/bash
# Back up Tumblr blog entries. This is run periodically as a cron job.
# Based on kiodane's explanation: http://kiodane.tumblr.com/post/27508318036/wget-mirror-a-tumblr-site
OLDDIR=$(pwd)

DATETIME=$(date +%d%m%g%H%M%S)
cd /tmp
mkdir $DATETIME
cd $DATETIME

wget -mpNHk -D .media.tumblr.com,patrickbrianmooney.tumblr.com -R "*avatar*","*\?*","*_[0-9][0-9][0-9].*" http://patrickbrianmooney.tumblr.com -o /home/patrick/Desktop/tumblr-backup.log
tar c -PSvv --to-stdout * 2>> /home/patrick/Desktop/tumblr-backup.log | bzip2 -z 2>> /home/patrick/Desktop/tumblr-backup.log > "/home/patrick/Documents/online services/Tumblr backups/$DATETIME.tar.bz2"

cd ..
rm -R $DATETIME

cd $OLDDIR