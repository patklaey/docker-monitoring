#!/bin/bash

data=$(ps aux | grep -v '%CPU' | grep -v 'awk' | awk '{out="memory_usage{process=\""$11" "; for(i=12;i<=14 && i<=NF  ;i++){out=out" "$i}; out=out"\", pid=\""$2"\"} "$4; print out}' )
curl -X POST -H  "Content-Type: text/plain" --data "$data
" http://localhost:9091/metrics/job/top/instance/machine
