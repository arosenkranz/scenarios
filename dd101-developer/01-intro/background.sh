#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab
mv /root/docker-compose.yml /root/lab

sed -i 's/production/<%= ENV["DD_ENV"] %>/g' /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/layouts/spree_application.html.erb

sed -i 's/production/<%= ENV["DD_ENV"] %>/g' /ecommworkshop/store-frontend-instrumented-fixed/app/views/layouts/application.html.erb

ln -s /ecommworkshop/store-frontend-instrumented-fixed /root/lab/store-frontend

ln -s /ecommworkshop/discounts-service /root/lab/discounts-service

ln -s /ecommworkshop/ads-service /root/lab/ads-service

docker-compose -f /root/lab/docker-compose.yml pull

statusupdate environment