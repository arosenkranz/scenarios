#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

# Wait for required assets to appear in the filesystem
until  [ -f /root/puppeteer.sh ]
do
  sleep 2
done

mkdir /root/lab
mv /root/docker-compose.yml /root/lab

# remove service-level `development` env
sed -i 's/ENV DD_ENV=development//g' /ecommworkshop/discounts-service/Dockerfile
sed -i 's/ENV DD_ENV=development//g' /ecommworkshop/ads-service/Dockerfile

cd /root/lab

docker-compose -f /root/lab/docker-compose.yml pull

statusupdate "workspace"