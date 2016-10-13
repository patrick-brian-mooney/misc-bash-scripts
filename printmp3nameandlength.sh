#!/bin/sh
# Does just what the name says it does. Helpful for producing a list of .mp3 files sorted by name and length.
echo -n "$1"
echo -n "|"
mp3info -p "%m:%s\n" "$1"
