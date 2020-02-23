#!/bin/sh

(
 sleep 5 #give nginx time to start
 /le_updater.sh
) &

nginx -g "daemon off;"
