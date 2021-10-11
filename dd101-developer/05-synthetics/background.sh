#!/bin/bash
curl -sk https://datadoghq.dev/katacodalabtools/r?raw=true|bash

until  [ -f /root/docker-compose.yml ]
do
  sleep 2
done

statuscheck "environment"

ln -s /ecommworkshop/store-frontend-instrumented-fixed /root/lab/store-frontend
ln -s /ecommworkshop/discounts-service /root/lab/discounts-service
ln -s /ecommworkshop/ads-service /root/lab/ads-service

statusupdate "workspace"

