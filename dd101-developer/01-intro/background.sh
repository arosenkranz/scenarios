#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab
mv /root/docker-compose.yml /root/lab

ln -s /ecommworkshop/store-frontend-instrumented-fixed /root/lab/store-frontend

ln -s /ecommworkshop/discounts-service /root/lab/discounts-service

ln -s /ecommworkshop/ads-service /root/lab/ads-service

docker-compose -f /root/lab/docker-compose.yml pull

statusupdate environment