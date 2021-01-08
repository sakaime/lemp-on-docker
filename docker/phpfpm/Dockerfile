FROM php:7.4-fpm-alpine

USER root

ARG INSTALL_XDEBUG

COPY init.sh /root/init.sh

RUN apk add --update bash vim unzip icu-dev gcc g++ make autoconf && \
  docker-php-ext-install intl pdo_mysql && \
  chmod +x /root/init.sh

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN if "$INSTALL_XDEBUG"; then \
  pecl install xdebug && \
  docker-php-ext-enable xdebug && \
  apk add iproute2 \
;fi

CMD ["/root/init.sh"]
