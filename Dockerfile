FROM alpine:3.15

# Set uid/gid
RUN adduser -D -u 1000 -g 1000 -s /bin/sh php

# Install PHP8
RUN apk add --no-cache --update \
    tini \
    php8 \
    php8-fpm \
    php8-apcu \
    php8-pdo \
    php8-pdo_mysql \
    php8-ctype \
    php8-xml \
    php8-simplexml \
    php8-gd \
    php8-zlib \
    php8-bz2 \
    php8-zip \
    php8-openssl \
    php8-curl \
    php8-opcache \
    php8-json \
    php8-dom \
    php8-iconv \
    php8-ftp \
    php8-mbstring \
    php8-iconv \
    php8-bcmath \
    php8-session \
    php8-pcntl \
    php8-xmlwriter \
    php8-tokenizer \
    php8-redis \
    php8-pecl-oauth \
    php8-phar

ADD custom.ini /etc/php8/conf.d/zz_custom.ini
ADD www.conf /etc/php8/php-fpm.d/www.conf

USER php

ENTRYPOINT ["tini", "--"]
CMD ["php-fpm8"]
