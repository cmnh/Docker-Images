#!/bin/bash
set -e # fail on any error

echo '* Working around permission errors locally by making sure that "apache2" uses the same uid and gid as the host volume'
TARGET_UID=$(stat -c "%u" /var/www/html)
echo '-- Setting www-data user to use uid '$TARGET_UID
usermod -u 1000 www-data || true
TARGET_GID=$(stat -c "%g" /var/www/html)
echo '-- Setting www-data group to use gid '$TARGET_GID
groupmod -o -g $TARGET_GID www-data || true
echo
echo '* Starting apache2'
chown -R www-data:root /var/www/html/
apache2 --user=www-data --console
