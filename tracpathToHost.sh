#!/bin/bash

while true
  do
    TIME=`date +%T`
    TRAC=`tracepath $1`
    echo -e "[$TIME]\n$TRAC\n" >> /tmp/trac.log
    tail -n 12  /tmp/trac.log
    sleep 3;
  done
