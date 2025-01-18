#!/bin/bash

PATH=/usr/local/bin:$PATH
cd /var/www

# Create the storage tree if needed and fix permissions
cp -r storage.skel/* storage/
cp -r bootstrap.skel/* bootstrap/
# chown -R www-data:www-data storage/ bootstrap/

# Need to do this because tmp files
cp /etc/nginx/nginx.conf /tmp/nginx.conf
sed -i "s/__PORT__/${APP_PORT}/" /tmp/nginx.conf
sed -i "s/__SERVERNAME__/${APP_DOMAIN}/" /tmp/nginx.conf
cp /tmp/nginx.conf /etc/nginx/nginx.conf

# Refresh the environment
php artisan storage:link
php artisan route:cache
php artisan view:cache
php artisan config:cache
php artisan migrate --force
# php artisan import:cities
php artisan instance:actor

# Finally run everything
php-fpm -D &
nginx -g 'daemon off;'
