#!/bin/bash
# Backs up my $HOME directory, or most of it, to an external drive attached to another computer on my network.

# script no longer assumes it's running as root as of 11 July 2014.

if [ -d /home/patrick/Photos/.NeverDelete ]; then      # the external photos drive is plugged in
	echo "Pruning backup dir ..."; sleep 2; rsync -avhHSP --delete --ignore-errors --delete-before --delete-excluded --exclude ".thumbnails" --exclude ".gvfs" --exclude ".cache" --exclude ".temp" --exclude ".config/google-chrome/Default/Application Cache/" --exclude ".local/share/Trash" --exclude ".dropbox-dist/dropbox-lnx*" --exclude ".dropbox/" --exclude ".dropbox.cache" --exclude ".config/google-chrome" --exclude ".PyCharmCE2*" --exclude ".local/share/gvfs-metadata" --exclude ".config/libreoffice" --log-file=/home/patrick/Desktop/home_backup.log -e ssh /home/patrick patrick@file-server:/media/Backup/Backups
else       # external Photos drive is missing -- update existing, but don't delete anything.
	echo "Not pruning backup dir ..."; sleep 2; rsync -avhHSP --log-file=/home/patrick/Desktop/home_backup.log --exclude ".thumbnails" --exclude ".gvfs" --exclude ".cache" --exclude ".temp" --exclude ".config/google-chrome/Default/Application Cache/" --exclude ".local/share/Trash" --exclude ".dropbox-dist/dropbox-lnx*" --exclude ".dropbox/" --exclude ".dropbox.cache" --exclude ".config/google-chrome" --exclude ".PyCharmCE2*" --exclude ".local/share/gvfs-metadata" --exclude ".config/libreoffice" -e ssh /home/patrick patrick@file-server:/media/Backup/Backups
fi
