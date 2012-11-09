#!/bin/sh
#
# +get mono pid number;
# +get allfiles like Genghis_PID_ in /Invade/Logs/ dir
# +sorting revert by time
# +in all file find lines that have "ErrorManager" and "suspend"
# +extract time and suspend status with time
# +show only 100(var TAIL) last lines
# Example:
# 13:49:49| SUSPENDED 60 seconds
# 13:50:49| UNSUSPENDED
#
TAIL=100
ls -rt /Invade/Logs/Genghis_`pgrep mono`_* | xargs grep "ErrorManager" | grep "suspend" | perl -ne '/(\d{2}:\d{2}:\d{2}).+?(Unsuspended|suspended).*?(\d{1,} seconds)*?$/; print "$1| ".uc($2)." $3\n"' | tail -n $TAIL
