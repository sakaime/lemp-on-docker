FROM php:7.4-fpm-alpine

RUN apk add --update vim unzip icu-dev && \
  docker-php-ext-install intl pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN if "$INSTALL_XDEBUG"; then \
  pecl install xdebug && \
  docker-php-ext-enable xdebug && \
  apt-get install -y iproute && \
  echo $(ip route | awk 'NR==1 {print $3}') host.docker.internal >> /etc/hosts \
;fi
