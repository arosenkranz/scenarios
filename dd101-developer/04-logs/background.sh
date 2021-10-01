#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash


echo 
# Prep for Ecommerce Workshop
git clone https://github.com/DataDog/ecommerce-workshop.git /ecommworkshop
cd /ecommworkshop
git checkout a670e6ab791d3ac4b9ef45dae1b68f64950414e4
git reset --hard

cd /ecommworkshop/deploy/docker-compose

docker-compose -f docker-compose-broken-instrumented.yml pull
docker-compose -f docker-compose-broken-no-apm-instrumentation.yml pull
docker-compose -f docker-compose-broken-no-instrumentation.yml pull
docker-compose -f docker-compose-fixed-instrumented-livecode.yml pull
docker-compose -f docker-compose-fixed-instrumented.yml pull

cd /root
# Prep for 101
docker pull redis:6.0.10
docker pull nginx:1.19.7
docker pull datadog/agent:7
docker pull datadog/agent:6
docker pull datadog/agent:7.21.1
docker pull postgres:11-alpine

mv /root/docker-compose-fixed.yml /ecommworkshop/deploy/docker-compose/
mv /root/docker-compose-broken.yml /ecommworkshop/deploy/docker-compose/
statusupdate files

/ecommworkshop/gor --input-file-loop --input-file "/ecommworkshop/requests_0.gor|300%" --output-http "http://localhost:3000" >> /dev/null 2>&1