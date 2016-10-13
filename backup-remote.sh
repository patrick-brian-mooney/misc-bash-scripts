#!/bin/bash
# Script to make an extra backup of absolutely essential files to UCSB's student web space. 
# No longer in use, since UCSB's technocrats, in their infinite wisdom, have apparently decided they're too incompetent to administer web space.
set -x

tar c -PSvv --to-stdout --exclude=".thumbnails" --exclude-tag-under=".SkipMe" /home/patrick/Documents/school /home/patrick/Documents/writing 2> /home/patrick/Desktop/remote-backup.log | bzip2 -z 2>> /home/patrick/Desktop/remote-backup.log | gpg2 -r 505AB18E --batch -o "/tmp/Backup.tar.bz2.gpg" -e - > /home/patrick/Desktop/remote-backup.log && scp /tmp/Backup.tar.bz2.gpg patrickmooney@ustorage.ucsb.edu:backups 2>> /home/patrick/Desktop/remote-backup.log
if [ -d /media/Externa/backups ]; then
  cp /tmp/Backup.tar.bz2.gpg /media/Externa/backups/
fi
rm /tmp/Backup.tar.bz2.gpg
chown patrick:patrick /home/patrick/Desktop/remote-backup.log

