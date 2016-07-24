#!/bin/bash
# Build

echo "Clearing existing dist files ..."
if [ -f dist.zip ]; then
  echo "Delete dist.zip file"
  rm dist.zip
fi
if [ -d dist ]; then
  echo "Delete /dist folder"
  rm -rf dist
fi

echo "Creating empty /dist files ..."
mkdir dist
touch dist/index.vulcanized.html
touch dist/index.vulcanized.js

echo "Running vulcanize ..."
vulcanize index.html --inline-script | crisper --html dist/index.vulcanized.html --js dist/index.vulcanized.js

echo "Copying manifest file to /dist ..."
cp -av manifest.json dist/manifest.json

echo "Copying additional resources to /dist ..."
cp -avr images dist/images

echo "Creating final dist.zip file from /dist folder ..."
zip -r dist.zip dist
