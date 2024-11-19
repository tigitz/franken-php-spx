#syntax=docker/dockerfile:1

FROM dunglas/frankenphp:1-php8.3

COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update && apt-get install -y zlib1g-dev git \
    && git clone --depth=1 https://github.com/NoiseByNorthwest/php-spx.git /usr/lib/php-spx \
    && cd /usr/lib/php-spx \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && rm -rf /var/lib/apt/lists/*

RUN  echo "extension=spx.so" > /usr/local/etc/php/conf.d/docker-php-ext-spx.ini
