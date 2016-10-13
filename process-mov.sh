#!/bin/bash
# Quick hack to re-encode .mov files. 
chmod +w "${1%/*}"
mencoder "$1" -of avi -oac mp3lame -ovc x264 -x264encopts preset=slow:tune=film:crf=20 -o "${1%mov}avi" 
chmod +w "$1"
rm "$1"
chmod -w "${1%/*}"
