#!/bin/bash
envsubst '${LB_BACKEND_PRIMARY} ${LB_BACKEND_FALLBACK} ${LB_PORT}' < /tmp/nginx.conf.template > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;' 