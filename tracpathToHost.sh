#!/bin/bash
# http://goo.gl/C3UVr
#
OUTPUT_FILE=/tmp/trace_to_$1.log

if [ -f $OUTPUT_FILE ]; then
  echo "" > $OUTPUT_FILE
fi

while true
  do
    TIME=`date +%T`
    TRAC=`tracepath $1`
    echo -e "[$TIME]\n$TRAC\n" >> $OUTPUT_FILE
    tail -n 12  $OUTPUT_FILE
    sleep 3;
  done
