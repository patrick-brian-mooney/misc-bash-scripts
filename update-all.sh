#!/bin/sh
# Update all the software on every Linux machine on the network.
sudo aptitude update; sudo aptitude upgrade; ssh -t file-server 'sudo aptitude update; sudo aptitude upgrade' ; ssh -t liniscious 'sudo aptitude update; sudo aptitude upgrade'
