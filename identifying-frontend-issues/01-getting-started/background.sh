#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

statuscheck "environment"

until  [ -f /root/nginx.conf ]
do
  sleep 2
done

mkdir /root/lab
mv /root/docker-compose.yml /root/lab

git clone -b workshop https://github.com/arosenkranz/workshop-microsite.git /discounts-frontend
cd /discounts-frontend
npm install -g npm @datadog/datadog-ci
# fixes missing esbuild-linux64 issue 
npm rebuild esbuild

# note: Currently using workaround where GitHub repo has the node_modules pushed for speed purposes, so no need for install
# npm install

# Fetch discounts in the browser
mv /root/home_controller.rb /ecommworkshop/store-frontend-broken-instrumented/app/controllers/spree/home_controller.rb
mv /root/spree_application.html.erb /ecommworkshop/store-frontend-broken-instrumented/app/views/spree/layouts/spree_application.html.erb
mv /root/index.html.erb /ecommworkshop/store-frontend-broken-instrumented/app/views/spree/home/index.html.erb
mv /root/frontend-config.rb /ecommworkshop/store-frontend-broken-instrumented/config/environments/development.rb

ln -s /ecommworkshop/store-frontend-broken-instrumented /root/lab/store-frontend

mv /root/discounts-requirements.txt /ecommworkshop/discounts-service/requirements.txt
mv /root/discounts.py /ecommworkshop/discounts-service/discounts.py
ln -s /ecommworkshop/discounts-service /root/lab/discounts-service

mv /root/ads-requirements.txt /ecommworkshop/ads-service/requirements.txt
mv /root/ads.py /ecommworkshop/ads-service/ads.py
ln -s /ecommworkshop/ads-service /root/lab/ads-service

# Link to microsite
ln -s /discounts-frontend /root/lab/discounts-frontend

# # set puppeteer scripts
mv /root/puppeteer.sh /root/lab/puppeteer.sh
mv /root/puppeteer.js /root/lab/puppeteer.js

docker-compose -f /root/lab/docker-compose.yml pull

statusupdate "workspace"