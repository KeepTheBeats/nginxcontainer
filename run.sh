#!/bin/env bash

# This script will firstly render placeholders, and then execute the command.
# docker run should set the environment variables LISTENPORT and TARGET

CURRENT_DIR=$(cd $(dirname $0); pwd)

# render the parameters in the config file
sed -i "s/\[\[LISTENPORT\]\]/${LISTENPORT}/g" /usr/local/nginx/conf/nginx.conf
sed -i "s|\[\[TARGET\]\]|${TARGET}|g" /usr/local/nginx/conf/nginx.conf

# run the application
cd ${CURRENT_DIR} || echo "cd ${CURRENT_DIR} fails"
exec "$@"
