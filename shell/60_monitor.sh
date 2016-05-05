#!/bin/bash
docker ps
if [[ $? -eq 0 ]]
then
    a=1
else
    a=2
fi
echo $a
ts=`date +%s`
host=`hostname`
echo $host
curl -X POST -d "[{\"metric\": \"docker-metric\", \"endpoint\": \"$host\", \"timestamp\": $ts,\"step\": 60,\"value\": $a,\"counterType\": \"GAUGE\",\"tags\": \"idc=lg,project=xx\"}]" http://127.0.0.1:1988/v1/push
