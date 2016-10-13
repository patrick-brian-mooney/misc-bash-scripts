#!/bin/bash
# Backs up my $HOME directory, or most of it, to an external drive attached to another computer on my network.

# script no longer assumes it's running as root as of 11 July 2014.

# Assume that we're on the right network if we can access the NFS-shared Backups folder
if [ -d /media/Backups/Backups ]; then
	if [ -f /home/patrick/Photos/.NeverDelete ]; then      # the external photos drive is plugged in
		rsync -avhHSP --delete --log-file=/home/patrick/Desktop/home_backup.log --exclude ".thumbnails" --exclude ".gvfs" --exclude ".cache" -e ssh /home/patrick patrick@file-server:/media/Backups/Backups
	else       # external Photos drive is missing -- update existing, but don't delete anything.
		rsync -avhHSP --log-file=/home/patrick/Desktop/home_backup.log --exclude ".thumbnails" --exclude ".gvfs" --exclude ".cache" -e ssh /home/patrick patrick@file-server:/media/Backups/Backups
	fi
fi
