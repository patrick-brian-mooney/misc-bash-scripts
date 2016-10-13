# !/bin/bash
# Quick wrapper to re-encode video.
if [ ! $# == 3 ]; then
  echo ""
  echo "Usage:"
  echo "mencoder-wrapper.sh Input_file Output_file bitrate"
  echo ""
  echo "All arguments are mandatory."
  echo "Destination directory must have enough free space for both the temporary files and the final product."
  echo "Recompresses audio even if it doesn't need it."
  echo "Assumes that input file is widescreen."
  echo ""
  exit;
fi;

exit;

mencoder -srate 48000 -af lavcresample=48000 -noautosub -oac lavc -aid 1 -ovc lavc -of mpeg -mpegopts format=dvd:tsaf -ofps 30000/1001 -vf scale=720:480,harddup -lavcopts vcodec=mpeg2video:trell:mbd=2:sc_threshold=1000000000:cgop:vstrict=0:vrc_maxrate=6050:vrc_buf_size=1835:vbitrate=$3:keyint=12:acodec=ac3:abitrate=192:aspect=16/9:vpass=1 -passlogfile "${2}.log" -o "$2" "$1" && mencoder -srate 48000 -af lavcresample=48000 -noautosub -oac lavc -aid 1 -ovc lavc -of mpeg -mpegopts format=dvd:tsaf -ofps 30000/1001 -vf scale=720:480,harddup -lavcopts vcodec=mpeg2video:trell:mbd=2:sc_threshold=1000000000:cgop:vstrict=0:vrc_maxrate=6050:vrc_buf_size=1835:vbitrate=$3:keyint=12:acodec=ac3:abitrate=192:aspect=16/9:vpass=2 -passlogfile "${2}.log" -o "$2" "$1" 

