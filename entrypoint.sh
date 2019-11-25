#!/bin/bash
set -e

sed -i -e "s/ENV/${ENV:-DEFAULT_ENV}/g" /usr/share/nginx/html/index.html
sed -i -e "s/SECRET/${SECRET:-DEFAULT_SECRET}/g" /usr/share/nginx/html/index.html
exec "$@"
