#!/bin/bash

git submodule update --init

if [ "x$(which node || true)" == "x" ]; then
  sudo ./nave/nave.sh usemain stable
fi

npm install
node install.js
