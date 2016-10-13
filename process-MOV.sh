#!/bin/bash
# Quick hack to re-encode .MOV files.
chmod +w "."
mencoder "$1" -o "${1%MOV}avi" -of avi -oac mp3lame -ovc x264 -x264encopts preset=slow:tune=film:crf=20  
chmod +w "$1"
rm "$1"
chmod -w "."
