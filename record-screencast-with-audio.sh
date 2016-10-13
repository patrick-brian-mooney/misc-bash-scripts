#!/bin/sh
# Capture a screencast with audio.
avconv -f alsa -ac 2 -ar 8000 -f pulse -i alsa_input.pci-0000_00_1b.0.analog-stereo -acodec s16le -aq 6 -f x11grab -r 12 -s 1366x768 -i :0.0 -qscale 0.1 "/home/patrick/Desktop/Your Screencast, Master.mp4"
