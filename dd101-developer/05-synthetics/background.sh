#!/bin/bash
curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash
statusupdate tools

git clone https://github.com/DataDog/ecommerce-workshop.git /ecommworkshop
cd /ecommworkshop
git checkout a670e6ab791d3ac4b9ef45dae1b68f64950414e4
git reset --hard

mv /root/docker-compose.yml /ecommworkshop


# fix 2.5 second delay in ads service
git checkout e400e3fc ./ads-service-fixed/ads.py
mv ./ads-service-fixed/ads.py ./ads-service/ads.py

# Use enhanced discounts service
mv /root/discounts.py ./discounts-service-fixed/discounts.py
mv /root/regression.patch ./discounts-service-fixed/regression.patch

# fix env tagging
sed -i 's/.ruby-shop./ENV["DD_ENV"]/' ./store-frontend-instrumented-fixed/api/config/initializers/datadog.rb
sed -i 's/.ruby-shop./ENV["DD_ENV"]/' ./store-frontend-instrumented-fixed/config/initializers/datadog.rb
sed -i 's/.ruby-shop./ENV["DD_ENV"]/' ./store-frontend-instrumented-fixed/frontend/config/initializers/datadog.rb

# update ddtrace
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service-fixed/requirements.txt
mv /root/frontend-docker-entrypoint.sh ./store-frontend-instrumented-fixed/docker-entrypoint.sh

statusupdate setup

# Start storedog
statuscheck "environment-variables"
docker-compose up -d

# Wait for the frontend-service container to fire up
while [[ -z $(docker ps --filter "name=ecommworkshop_frontend_1" --format '{{.Names}}') ]]
do sleep 5
done

statusupdate complete

# Generate traffic
# ./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000" >> /dev/null 2>&1