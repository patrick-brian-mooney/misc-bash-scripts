#!/bin/bash
/usr/bin/synclient TouchPadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
