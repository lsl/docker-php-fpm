FROM alpine:3.7

# Set uid/gid correctly
RUN adduser -D -u 1000 -g 1000 -s /bin/sh php

# Install PHP7
RUN apk add --no-cache --update \
    tini \
    php7 \
    php7-fpm \
    php7-apcu \
    php7-pdo \
    php7-pdo_mysql \
    php7-ctype \
    php7-xml \
    php7-simplexml \
    php7-gd \
    php7-zlib \
    php7-bz2 \
    php7-zip \
    php7-openssl \
    php7-curl \
    php7-opcache \
    php7-json \
    php7-dom \
    php7-iconv \
    php7-ftp \
    php7-mbstring \
    php7-iconv \
    php7-bcmath \
    php7-session \
    php7-pcntl \
    php7-xmlwriter \
    php7-tokenizer \
    php7-redis \
    php7-oauth \
    php7-zmq \
    php7-phar

ADD custom.ini /etc/php7/conf.d/zz_custom.ini
ADD www.conf /etc/php7/php-fpm.d/www.conf

USER php

ENTRYPOINT ["tini", "--"]
CMD ["php-fpm7"]