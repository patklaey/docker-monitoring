#!/bin/bash

data=$(top -n 1 -b -w 200 | tail -n +8 | grep -v awk | grep -v top | awk '{out="cpu_usage{process=\""$12; for(i=13;i<=15 && i<=NF  ;i++){out=out" "$i}; out=out"\", pid=\""$1"\"} "$9; print out}')
curl -X POST -H  "Content-Type: text/plain" --data "$data
" http://localhost:9091/metrics/job/top/instance/machine
