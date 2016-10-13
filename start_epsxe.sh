#!/bin/bash
# Run ePSXe, which is not all that Linuxy a program. But there seems to be no better alternative for PSX emulation.
# This is a quick hack based on https://ubuntuforums.org/showthread.php?t=95835  

export EPSXE='/home/patrick/bin/ePSXe/'
export LD_LIBRARY_PATH=$EPSXE
cd $EPSXE
padsp ./epsxe
chmod 666 $EPSXE/cfg/*.cfg $EPSXE/sstates/* $EPSXE/memcards/*.mcr $EPSXE/snap/* 2>/dev/null 
