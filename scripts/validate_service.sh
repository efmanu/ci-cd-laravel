#!/bin/bash
set -e

# Check if Apache2 is running
service apache2 status || exit 1

# Perform a health check on the application (e.g., HTTP response from root URL)
curl -f http://localhost || exit 1
