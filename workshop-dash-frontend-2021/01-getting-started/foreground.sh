#!/bin/bash

. setrumvars
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export DD_DISCOUNTS_URL=https://[[HOST_SUBDOMAIN]]-5001-[[KATACODA_HOST]].environments.katacoda.com/discount
export DD_ADS_URL=https://[[HOST_SUBDOMAIN]]-5002-[[KATACODA_HOST]].environments.katacoda.com/
export RUM_START_URL=https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/
export MICROSITE_URL=https://[[HOST_SUBDOMAIN]]-3001-[[KATACODA_HOST]].environments.katacoda.com/
export REACT_APP_DD_APPLICATION_ID=$DD_APPLICATION_ID
export REACT_APP_DD_CLIENT_TOKEN=$DD_CLIENT_TOKEN

clear

statuscheck environment

cd /root/lab

statusupdate complete
prepenvironment