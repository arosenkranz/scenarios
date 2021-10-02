#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export DD_DISCOUNTS_URL=https://[[HOST_SUBDOMAIN]]-5001-[[KATACODA_HOST]].environments.katacoda.com/discount
export DD_ADS_URL=https://[[HOST_SUBDOMAIN]]-5002-[[KATACODA_HOST]].environments.katacoda.com
export STOREDOG_URL=https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com
export MICROSITE_URL=https://[[HOST_SUBDOMAIN]]-3001-[[KATACODA_HOST]].environments.katacoda.com
export REACT_APP_DD_ADS_URL=$DD_ADS_URL
export REACT_APP_DD_DISCOUNTS_URL=$DD_DISCOUNTS_URL
export REACT_APP_STOREDOG_URL=$STOREDOG_URL
export REACT_APP_DD_APPLICATION_ID=$DD_APPLICATION_ID
export REACT_APP_DD_CLIENT_TOKEN=$DD_CLIENT_TOKEN

export DD_CLIENT_TOKEN=`curl -s "https://api.datadoghq.com/api/v1/public_api_key" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
|jq  -r '.. | objects | select(.name == "[RUM] Storedog").hash'`

export DD_APPLICATION_ID=`curl -s "https://api.datadoghq.com/api/v1/rum/projects" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
|jq  -r '.. | objects | select(.name == "Storedog").application_id'`

([ -z $DD_APPLICATION_ID ] || [ -z $DD_CLIENT_TOKEN ]) && clear && echo '** Storedog RUM Application not found! **'


clear

statuscheck environment

cd /root/lab

printf "DD_API_KEY=$DD_API_KEY\n\
DD_APP_KEY=$DD_APP_KEY\n\
DD_APPLICATION_ID=$DD_APPLICATION_ID\n\
DD_CLIENT_TOKEN=$DD_CLIENT_TOKEN\n\
POSTGRES_USER=postgres\n\
POSTGRES_PASSWORD=postgres\n\
DD_ADS_URL=$DD_ADS_URL\n\
DD_DISCOUNTS_URL=$DD_DISCOUNTS_URL\n\
STOREDOG_URL=$STOREDOG_URL\n\
MICROSITE_URL=$MICROSITE_URL\n\
REACT_APP_DD_ADS_URL=$DD_ADS_URL\n\
REACT_APP_DD_DISCOUNTS_URL=$DD_DISCOUNTS_URL\n\
REACT_APP_STOREDOG_URL=$STOREDOG_URL\n\
REACT_APP_DD_APPLICATION_ID=$DD_APPLICATION_ID\n\
REACT_APP_DD_CLIENT_TOKEN=$DD_CLIENT_TOKEN" > .env 

cp .env /storedog-microsite

cd /storedog-microsite
npm run build
npx datadog-ci sourcemaps upload ./build \
  --project-path=./src/ \
  --service=storedog-microsite \
  --release-version=1.1 \
  --minified-path-prefix="${REACT_APP_MICROSITE_URL}/static/js"

cd /root/lab

statusupdate complete
prepenvironment