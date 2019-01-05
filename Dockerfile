FROM php:7.3.0-cli
LABEL maintainer="Ivan Kalinichenko <kalinichenko@constlab.ru>"

RUN apt-get update && \
    apt-get install -y git zip unzip && \
    php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN composer global require "spatie/http-status-check"

COPY check /usr/bin/check
CMD check