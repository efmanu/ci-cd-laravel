#!/bin/bash
set -e

echo "Configure repo"
apt-get install -y software-properties-common
add-apt-repository -y ppa:ondrej/php

# Update package lists and install dependencies
echo "Updating ubuntu"
apt-get update

echo "Installing libraries"
apt-get install -y apache2 php7.4 php7.4-cli php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath php7.4-pdo nano vim
# Enable PHP module and restart Apache
a2enmod php7.4
a2enmod rewrite
service apache2 restart

# Navigate to the Laravel application directory and install dependencies
cd /var/www/html
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
composer global require laravel/installer
composer install --no-dev --optimize-autoloader

# Clear and cache Laravel configurations
php artisan config:clear
php artisan config:cache
php artisan route:cache
php artisan view:cache
