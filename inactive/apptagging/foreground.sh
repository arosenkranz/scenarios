#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export STOREDOG_URL=https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com


statuscheck files

# cd /ecommworkshop

# sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service/requirements.txt
# sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service-fixed/requirements.txt
# sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service/requirements.txt
# cp /root/frontend-docker-entrypoint.sh ./store-frontend-instrumented-fixed/docker-entrypoint.sh
# cp /root/frontend-docker-entrypoint.sh ./store-frontend-broken-instrumented/docker-entrypoint.sh

cd /root/lab
docker-compose -f docker-compose-broken.yml up -d
clear
# envready
statusupdate complete
clear

prepenvironment