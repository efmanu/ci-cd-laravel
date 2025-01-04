#!/bin/bash
set -e

# Set ownership of the Laravel project to the Apache user (www-data)
chown -R www-data:www-data /var/www/html

# Set write permissions for storage and bootstrap/cache
chmod -R 775 /var/www/html/storage
chmod -R 775 /var/www/html/bootstrap/cache
