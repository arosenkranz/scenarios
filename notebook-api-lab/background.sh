#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab

cd /ecommworkshop
git fetch
git checkout tags/2.0.0

mv /ecommworkshop/deploy/docker-compose/docker-compose-fixed-instrumented.yml /root/lab/docker-compose.yml

docker-compose -f /root/lab/docker-compose.yml pull

statusupdate environments