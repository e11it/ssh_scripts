#!/bin/bash
# http://goo.gl/rxanp
#
OUTPUT_FILE=/tmp/ping_to_$1.log
if [ -f $OUTPUT_FILE ]; then
  echo "" > $OUTPUT_FILE
fi

while true
    do
        TIME=`date +%T`
        PING=`ping $1 -c 1 | grep '=2'`
	LA=`uptime | grep -P -o "load average: (.+?)$"`
            echo "[$TIME][$LA] $PING" >>/tmp/ping_to_$1.log
            tail -n 1 /tmp/ping_to_$1.log
    sleep 1
    done
