#!/bin/bash

# This script is a wrapper for my isp_complain.sh script that makes it easier to call from a cron job.
# See https://sourceforge.net/p/isp-complain/ for more info. DO NOT use the isp_complain script without reading the full documentation.

# You should adjust the options for your own particular situation.

# Last update to this file: 18 October 2015, to update the name of the router, because those douchebag sales associates at Cox misled me about
# whether their router would meet my needs, probably so a sales associate could squeeze a couple extra bucks in commission out of me.

/home/patrick/.scripts/isp_complain.sh -u ".@CoxComm" -a "http://is.gd/CoxDown" -r "pinhead" -b 1800 -c 7200 -p 70 -l /var/log/isp_complain.log
