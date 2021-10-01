#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash


echo 
# Prep for Ecommerce Workshop
git clone https://github.com/DataDog/ecommerce-workshop.git /ecommworkshop
cd /ecommworkshop
git checkout a670e6ab791d3ac4b9ef45dae1b68f64950414e4
git reset --hard

cd /root

mv /root/docker-compose-fixed.yml /ecommworkshop/deploy/docker-compose/
mv /root/docker-compose-broken.yml /ecommworkshop/deploy/docker-compose/
statusupdate files

/ecommworkshop/gor --input-file-loop --input-file "/ecommworkshop/requests_0.gor|300%" --output-http "http://localhost:3000" >> /dev/null 2>&1