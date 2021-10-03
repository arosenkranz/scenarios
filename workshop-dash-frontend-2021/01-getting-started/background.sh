#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

mkdir /root/lab
mv /root/docker-compose.yml /root/lab
# mv /root/docker-compose-dev.yml /root/lab

git clone https://github.com/arosenkranz/workshop-microsite.git /storedog-microsite
cd /storedog-microsite
npm install

npm i -g craco --silent

# Fetch discounts in the browser
# mv /root/home_controller.rb /ecommworkshop/store-frontend-instrumented-fixed/app/controllers/spree/home_controller.rb
mv /root/home_controller.rb /ecommworkshop/store-frontend-broken-instrumented/app/controllers/spree/home_controller.rb
# mv /root/spree_application.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/layouts/spree_application.html.erb
mv /root/spree_application.html.erb /ecommworkshop/store-frontend-broken-instrumented/app/views/spree/layouts/spree_application.html.erb
# mv /root/index.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/home/index.html.erb
mv /root/index.html.erb /ecommworkshop/store-frontend-broken-instrumented/app/views/spree/home/index.html.erb
# mv /root/frontend-config.rb /ecommworkshop/store-frontend-instrumented-fixed/config/environments/development.rb
mv /root/frontend-config.rb /ecommworkshop/store-frontend-broken-instrumented/config/environments/development.rb

# ln -s /ecommworkshop/store-frontend-instrumented-fixed /root/lab/store-frontend
ln -s /ecommworkshop/store-frontend-broken-instrumented /root/lab/store-frontend


mv /root/discounts-requirements.txt /ecommworkshop/discounts-service/requirements.txt
mv /root/discounts.py /ecommworkshop/discounts-service/discounts.py
ln -s /ecommworkshop/discounts-service /root/lab/discounts-service

mv /root/ads-requirements.txt /ecommworkshop/ads-service/requirements.txt
mv /root/ads.py /ecommworkshop/ads-service/ads.py
ln -s /ecommworkshop/ads-service /root/lab/ads-service

# Link to microsite
ln -s /storedog-microsite /root/lab/storedog-microsite

# # set puppeteer scripts
# mv /root/puppeteer.sh /root/lab/puppeteer.sh
# mv /root/puppeteer-mobile.js /root/lab/puppeteer-mobile.js

# docker pull node:alpine 
# docker pull nginx 

# docker-compose -f /root/lab/docker-compose.yml pull

statusupdate environment