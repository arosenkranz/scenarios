#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab
mv /root/docker-compose.yml /root/lab
mv /root/docker-compose-dev.yml /root/lab

git clone https://github.com/arosenkranz/workshop-microsite.git /storedog-microsite
cd /storedog-microsite
docker build -f ./Dockerfile.dev . -t storedog-microsite

# Fetch discounts in the browser
mv /root/home_controller.rb /ecommworkshop/store-frontend-instrumented-fixed/app/controllers/spree/home_controller.rb
mv /root/spree_application.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/layouts/spree_application.html.erb
mv /root/index.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/home/index.html.erb

ln -s /ecommworkshop/store-frontend-instrumented-fixed /root/lab/store-frontend

mv /root/discounts-requirements.txt /ecommworkshop/discounts-service/requirements.txt
mv /root/discounts.py /ecommworkshop/discounts-service/discounts.py
ln -s /ecommworkshop/discounts-service /root/lab/discounts-service

mv /root/ads-requirements.txt /ecommworkshop/ads-service/requirements.txt
mv /root/ads.py /ecommworkshop/ads-service/ads.py
ln -s /ecommworkshop/ads-service /root/lab/ads-service

# Link to the modified frontend configuration file
mv /root/frontend-config.rb /ecommworkshop/store-frontend-instrumented-fixed/config/environments/development.rb

# Link to microsite
ln -s /storedog-microsite /root/lab/microsite

docker pull node:alpine 
docker pull nginx 

docker-compose -f /root/lab/docker-compose-dev.yml pull

statusupdate environment