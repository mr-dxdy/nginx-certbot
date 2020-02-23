#!/bin/sh

 echo "start letsencrypt updater"
 while :
 do
   echo [$(date +"%y-%m-%d %T")]  trying to update letsencrypt ...
   certbot renew  --deploy-hook "nginx -s reload"
   sleep 12h
 done
