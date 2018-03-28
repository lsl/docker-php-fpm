# [Alpine Linux + PHP7 + PHP-FPM](https://github.com/lsl/docker-php-fpm)

A basic alpine linux image with php7 and php-fpm pre installed.

```
FROM lslio/php-fpm

COPY --chown=php:php . /var/www
```