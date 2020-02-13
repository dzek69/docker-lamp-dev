#!/bin/bash

# Node install
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install nodejs -y

# Yarn install
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update && apt-get install yarn
