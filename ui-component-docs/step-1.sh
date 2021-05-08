#!/bin/bash

mkdir -p /opt/.katacodacode/user-data/User/
cat << VSCODEEOF > /opt/.katacodacode/user-data/User/settings.json
{ 
  "workbench.startupEditor": "none", 
  "files.autoSave": "off",
  "editor.minimap.enabled": false,
  "window.autoDetectColorScheme": false,
  "workbench.colorCustomizations": {},
  "workbench.colorTheme": "Default Dark+",
  "editor.semanticHighlighting.enabled": false,
  "editor.tokenColorCustomizations": {
      "semanticHighlighting": true
  },
  "files.exclude": {
    "**/.*": true
  }
}
VSCODEEOF

git clone https://github.com/arosenkranz/component-library-demo
cd component-library-demo
git fetch && git checkout step-1
# docker run --rm -it --mount type=bind,source="$(pwd)",target=/src -p 6006:6006 -u node  node:14.16.0-alpine3.13 npm install && npm run storybook --bind=0.0.0.0
# ls
npm install -ci
