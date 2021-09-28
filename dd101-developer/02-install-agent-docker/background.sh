#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

# Wait for required assets to appear in the filesystem
until  [ -f /root/docker-compose.yml ]
do
  sleep 2
done

mkdir /root/lab
mv /root/docker-compose.yml /root/lab

sed -i 's/production/<%= ENV["DD_ENV"] %>/g' /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/layouts/spree_application.html.erb

sed -i 's/1.1/<%= ENV["DD_VERSION"] %>/g' /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/layouts/spree_application.html.erb

sed -i 's/production/<%= ENV["DD_ENV"] %>/g' /ecommworkshop/store-frontend-instrumented-fixed/app/views/layouts/application.html.erb

sed -i 's/1.1/<%= ENV["DD_VERSION"] %>/g' /ecommworkshop/store-frontend-instrumented-fixed/app/views/layouts/application.html.erb

ln -s /ecommworkshop/store-frontend-instrumented-fixed /root/lab/store-frontend

ln -s /ecommworkshop/discounts-service /root/lab/discounts-service

ln -s /ecommworkshop/ads-service /root/lab/ads-service


cd /root/lab

docker-compose pull

statusupdate "workspace"