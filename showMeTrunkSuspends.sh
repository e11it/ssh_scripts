#!/bin/sh
# ARGV 1: number of line. -n for tail cmd.
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
if [[ ($# > 0) ]]
then
        TAIL=$1
else
        TAIL=100
fi

ls -rt /Invade/Logs/Genghis_`pgrep mono`_* | xargs grep "ErrorManager" | grep "suspend" | perl -ne '/(\d{2}:\d{2}:\d{2}).+?Port\s(\S+?)\s(Unsuspended|suspended).*?(\d{1,} seconds)*?$/; print "$1| ".uc($2)."\t$3 $4\n"' | tail -n $TAIL
