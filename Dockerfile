FROM php:7.3.0-cli
LABEL maintainer="Ivan Kalinichenko <kalinichenko@constlab.ru>"

RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git

COPY install-composer /install-composer
RUN /install-composer && rm /install-composer

RUN composer global require "spatie/http-status-check"

RUN apt-get clean && \
    apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY check /check
CMD /check