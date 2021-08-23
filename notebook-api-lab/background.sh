#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab
mv /root/docker-compose.yml /root/lab

cd /ecommworkshop
git fetch
git checkout tags/2.0.0

docker-compose -f /root/lab/docker-compose.yml pull

statusupdate environments