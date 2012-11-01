#!/bin/bash
while true
    do
        TIME=`date +%T`
        PING=`ping $1 -c 1 | grep '=2'`
	LA=`uptime | grep -P -o "load average: (.+?)$"`
            echo "[$TIME][$LA] $PING" >>/tmp/pingtime.log
            tail -n 1 /tmp/pingtime.log
    sleep 1
    done
