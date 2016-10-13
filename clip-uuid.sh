#!/bin/bash
# Create a new UUID, echo it to the terminal, and copy it to the clipboard
THEUUID=$(uuidgen)
echo $THEUUID | xclip -i -sel clip
echo $THEUUID "copied to clipboard"
