#!/bin/bash

curl -sk https://datadoghq.dev/katacodalabtools/r?raw=true|bash

# Wait for required assets to appear in the filesystem
until  [ -f /root/puppeteer.sh ]
do
  sleep 2
done

mkdir /root/lab
mv /root/docker-compose.yml /root/lab
cd /root/lab

docker pull datadog/agent:7.31.0

statusupdate "workspace"