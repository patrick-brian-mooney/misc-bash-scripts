#!/bin/sh
# Script to ask the user whether Transmission should be launched. Useful when I'm on campus, because an ignorant policy prohibits running
# BitTorrent software AT ALL.

zenity --question --text="Connected to a repressive network?"
rc=$?
echo $rc

if [ "$rc" = "0" ] ; then
  echo "Not launching Transmission."
  exit 0
fi
nohup transmission-gtk > /dev/null &
