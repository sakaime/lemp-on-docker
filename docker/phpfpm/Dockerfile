FROM php:7.4-fpm-alpine

ARG INSTALL_XDEBUG
ARG USER_ID

COPY init.sh /init.sh

RUN apk add --update bash vim unzip icu-dev gcc g++ make autoconf sudo && \
  docker-php-ext-install intl pdo_mysql && \
  adduser -u $USER_ID -D developer && \
  echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
  chmod 0440 /etc/sudoers.d/developer && \
  addgroup nginx && \
  addgroup developer nginx && \
  chown -R developer:nginx /var/www/ && \
  chown -R developer:nginx /var/run && \
  chown -R developer:nginx /var/log/ && \
  chmod +x /init.sh

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN if "$INSTALL_XDEBUG"; then \
  pecl install xdebug && \
  docker-php-ext-enable xdebug && \
  apk add iproute2 \
;fi

USER developer

CMD ["/bin/bash", "/init.sh"]
