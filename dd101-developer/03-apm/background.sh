#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab
# mv /root/docker-compose.yml /root/lab

# mv /root/discounts.py /ecommworkshop/discounts-service/discounts.py

ln -s /ecommworkshop/store-frontend-broken-instrumented /root/lab/store-frontend
ln -s /ecommworkshop/discounts-service /root/lab/discounts-service
ln -s /ecommworkshop/ads-service /root/lab/ads-service

docker-compose -f /root/lab/docker-compose.yml pull

statusupdate environment