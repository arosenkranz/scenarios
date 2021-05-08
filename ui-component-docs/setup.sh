#!/bin/bash

git clone https://github.com/arosenkranz/component-library-demo
cd component-library-demo
docker run --rm -it --mount type=bind,source="$(pwd)",target=/src -p 6006:6006 -u node  node:14.16.0-alpine3.13 npm install && npm run storybook --bind=0.0.0.0
# ls
# npm install
# echo "Starting..."
# npm run storybook