#!/bin/bash
# Record six hours of audio.
DATETIME=$(date +%d%m%g%H%M%S)
while [ -e $DATETIME ] 
do
  DATETIME=$(date +%d%m%g%H%M%S%N)
done
arecord -r 22050 -f S16_LE -d 21600 | lame -a --abr 80 --vbr-new --tc "$DATETIME" --id3v2-only - /home/patrick/.recordings/$DATETIME.mp3
