#!/bin/bash
# Put stuff here that runs in a foreground process, visible to the learner.

statuscheck "workspace"
cd /root/lab

# Store learner environment variablse for background.sh to access
# ** Set DD_ENV to a unique value for your scenario. E.g. dd-201 **
printf "DD_API_KEY=$DD_API_KEY\n\
DD_APP_KEY=$DD_APP_KEY\n\
POSTGRES_USER=postgres\n\
DD_ENV=notebook-reports\n\ 
POSTGRES_PASSWORD=postgres
PUPPETEER_URL=https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/" > .env 


clear
statusupdate "environment-variables"
statuscheck "storedog"

# Display trial account credentials in terminal
statusupdate complete
prepenvironment