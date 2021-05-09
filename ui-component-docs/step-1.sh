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

apt install bsdtar -y

curl -L https://marketplace.visualstudio.com/_apis/public/gallery/publishers/silvenon/vsextensions/mdx/0.1.0/vspackage | bsdtar -xvf - extension

mv extension /opt/.katacodacode/extensions/mdx

git config --global user.email "demouser@xyz.biz"
git config --global user.name "demo user name"
git clone https://github.com/arosenkranz/component-library-demo
cd component-library-demo
git fetch && git checkout step-1

npm install -q
clear
echo "READY TO START!"
