#!/bin/bash
set -e # fail on any error

TARGET_UID=$(stat -c "%u" /var/www/html)
usermod -o -u $TARGET_UID www-data || true
TARGET_GID=$(stat -c "%g" /var/www/html)
groupmod -o -g $TARGET_GID www-data || true

cd /var/www/html
gem install compass  --no-rdoc --no-ri
npm install 
gulp