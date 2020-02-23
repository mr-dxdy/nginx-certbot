FROM nginx:1.17.8

RUN echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list
RUN apt-get -y update && apt-get install -y certbot openssl python-certbot-nginx -t buster-backports
RUN apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

ADD script/le_updater.sh /le_updater.sh
ADD script/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
