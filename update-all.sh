#!/bin/sh
# Update all the software on every Linux machine on the network.
ssh -t linawesome 'sudo aptitude update; sudo aptitude upgrade; sudo apt-get autoremove; sudo apt-get -y clean'
ssh -t file-server 'sudo aptitude update; sudo aptitude upgrade; sudo apt-get autoremove; sudo apt-get -y clean'
ssh -t liniscious 'sudo aptitude update; sudo aptitude upgrade; sudo apt-get autoremove; sudo apt-get -y clean'
ssh -t mahalo@web-server 'sudo aptitude update; sudo aptitude upgrade; sudo apt-get autoremove; sudo apt-get -y clean'

