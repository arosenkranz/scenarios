#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

# Wait for required assets to appear in the filesystem
until  [ -f /root/docker-compose.yml ]
do
  sleep 2
done

mkdir /root/lab
mv /root/docker-compose.yml /root/lab
cd /root/lab

docker-compose pull

statusupdate "workspace"