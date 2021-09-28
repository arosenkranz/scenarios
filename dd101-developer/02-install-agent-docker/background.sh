#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

# Wait for required assets to appear in the filesystem
until  [ -f /root/docker-compose.yml ]
do
  sleep 2
done

mkdir /root/lab
mv /root/docker-compose.yml /root/lab

ln -s /ecommworkshop/store-frontend-instrumented-fixed /root/lab/store-frontend

ln -s /ecommworkshop/discounts-service /root/lab/discounts-service

ln -s /ecommworkshop/ads-service /root/lab/ads-service


cd /root/lab

docker-compose pull

statusupdate "workspace"