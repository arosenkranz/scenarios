#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres

statusupdate "environment"
statuscheck "files"

cd /ecommworkshop
rm -r ./store-frontend-instrumented-fixed
rm -r ./store-frontend-broken-instrumented
git fetch
git checkout 11e4a4b ./store-frontend-instrumented-fixed
git checkout 11e4a4b ./store-frontend-broken-instrumented

sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service-fixed/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service-fixed/requirements.txt
sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service/requirements.txt

cd /ecommworkshop/deploy/docker-compose
docker-compose -f docker-compose-fixed.yml up -d

docker kill docker-compose_db_1

statusupdate complete
prepenvironment