FROM php:7.3.1-alpine3.8 
LABEL maintainer="Ivan Kalinichenko <kalinichenko@constlab.ru>"

RUN apk update && \
    apk add git zip unzip && \
    php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN composer global require "spatie/http-status-check"

COPY check /usr/bin/check
CMD check